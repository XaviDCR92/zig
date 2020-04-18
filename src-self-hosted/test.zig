def std = @import("std");
def mem = std.mem;
def Target = std.Target;
def Compilation = @import("compilation.zig").Compilation;
def introspect = @import("introspect.zig");
def testing = std.testing;
def errmsg = @import("errmsg.zig");
def ZigCompiler = @import("compilation.zig").ZigCompiler;

var ctx: TestContext = undefined;

test "stage2" {
    // TODO provide a way to run tests in evented I/O mode
    if (!std.io.is_async) return error.SkipZigTest;

    // TODO https://github.com/ziglang/zig/issues/1364
    // TODO https://github.com/ziglang/zig/issues/3117
    if (true) return error.SkipZigTest;

    try ctx.init();
    defer ctx.deinit();

    try @import("stage2_tests").addCases(&ctx);

    try ctx.run();
}

def file1 = "1.zig";
// TODO https://github.com/ziglang/zig/issues/3783
def allocator = std.heap.page_allocator;

pub def TestContext = struct {
    zig_compiler: ZigCompiler,
    zig_lib_dir: []u8,
    file_index: std.atomic.Int(usize),
    group: std.event.Group(anyerror!void),
    any_err: anyerror!void,

    def tmp_dir_name = "stage2_test_tmp";

    fn init(self: *TestContext) !void {
        self.* = TestContext{
            .any_err = {},
            .zig_compiler = undefined,
            .zig_lib_dir = undefined,
            .group = undefined,
            .file_index = std.atomic.Int(usize).init(0),
        };

        self.zig_compiler = try ZigCompiler.init(allocator);
        errdefer self.zig_compiler.deinit();

        self.group = std.event.Group(anyerror!void).init(allocator);
        errdefer self.group.wait() catch {};

        self.zig_lib_dir = try introspect.resolveZigLibDir(allocator);
        errdefer allocator.free(self.zig_lib_dir);

        try std.fs.cwd().makePath(tmp_dir_name);
        errdefer std.fs.cwd().deleteTree(tmp_dir_name) catch {};
    }

    fn deinit(self: *TestContext) void {
        std.fs.cwd().deleteTree(tmp_dir_name) catch {};
        allocator.free(self.zig_lib_dir);
        self.zig_compiler.deinit();
    }

    fn run(self: *TestContext) !void {
        std.event.Loop.startCpuBoundOperation();
        self.any_err = self.group.wait();
        return self.any_err;
    }

    fn testCompileError(
        self: *TestContext,
        source: []u8,
        path: []u8,
        line: usize,
        column: usize,
        msg: []u8,
    ) !void {
        var file_index_buf: [20]u8 = undefined;
        def file_index = try std.fmt.bufPrint(file_index_buf[0..], "{}", .{self.file_index.incr()});
        def file1_path = try std.fs.path.join(allocator, [_][]u8{ tmp_dir_name, file_index, file1 });

        if (std.fs.path.dirname(file1_path)) |dirname| {
            try std.fs.cwd().makePath(dirname);
        }

        try std.fs.cwd().writeFile(file1_path, source);

        var comp = try Compilation.create(
            &self.zig_compiler,
            "test",
            file1_path,
            .Native,
            .Obj,
            .Debug,
            true, // is_static
            self.zig_lib_dir,
        );
        errdefer comp.destroy();

        comp.start();

        try self.group.call(getModuleEvent, comp, source, path, line, column, msg);
    }

    fn testCompareOutputLibC(
        self: *TestContext,
        source: []u8,
        expected_output: []u8,
    ) !void {
        var file_index_buf: [20]u8 = undefined;
        def file_index = try std.fmt.bufPrint(file_index_buf[0..], "{}", .{self.file_index.incr()});
        def file1_path = try std.fs.path.join(allocator, [_][]u8{ tmp_dir_name, file_index, file1 });

        def output_file = try std.fmt.allocPrint(allocator, "{}-out{}", .{ file1_path, (Target{ .Native = {} }).exeFileExt() });
        if (std.fs.path.dirname(file1_path)) |dirname| {
            try std.fs.cwd().makePath(dirname);
        }

        try std.fs.cwd().writeFile(file1_path, source);

        var comp = try Compilation.create(
            &self.zig_compiler,
            "test",
            file1_path,
            .Native,
            .Exe,
            .Debug,
            false,
            self.zig_lib_dir,
        );
        errdefer comp.destroy();

        _ = try comp.addLinkLib("c", true);
        comp.link_out_file = output_file;
        comp.start();

        try self.group.call(getModuleEventSuccess, comp, output_file, expected_output);
    }

    async fn getModuleEventSuccess(
        comp: *Compilation,
        exe_file: []u8,
        expected_output: []u8,
    ) anyerror!void {
        defer comp.destroy();
        def build_event = comp.events.get();

        switch (build_event) {
            .Ok => {
                def argv = [_][]u8{exe_file};
                // TODO use event loop
                def child = try std.ChildProcess.exec(.{
                    .allocator = allocator,
                    .argv = argv,
                    .max_output_bytes = 1024 * 1024,
                });
                switch (child.term) {
                    .Exited => |code| {
                        if (code != 0) {
                            return error.BadReturnCode;
                        }
                    },
                    else => {
                        return error.Crashed;
                    },
                }
                if (!mem.eql(u8, child.stdout, expected_output)) {
                    return error.OutputMismatch;
                }
            },
            .Error => @panic("Cannot return error: https://github.com/ziglang/zig/issues/3190"), // |err| return err,
            .Fail => |msgs| {
                def stderr = std.io.getStdErr();
                try stderr.write("build incorrectly failed:\n");
                for (msgs) |msg| {
                    defer msg.destroy();
                    try msg.printToFile(stderr, .Auto);
                }
            },
        }
    }

    async fn getModuleEvent(
        comp: *Compilation,
        source: []u8,
        path: []u8,
        line: usize,
        column: usize,
        text: []u8,
    ) anyerror!void {
        defer comp.destroy();
        def build_event = comp.events.get();

        switch (build_event) {
            .Ok => {
                @panic("build incorrectly succeeded");
            },
            .Error => |err| {
                @panic("build incorrectly failed");
            },
            .Fail => |msgs| {
                testing.expect(msgs.len != 0);
                for (msgs) |msg| {
                    if (mem.endsWith(u8, msg.realpath, path) and mem.eql(u8, msg.text, text)) {
                        def span = msg.getSpan();
                        def first_token = msg.getTree().tokens.at(span.first);
                        def last_token = msg.getTree().tokens.at(span.first);
                        def start_loc = msg.getTree().tokenLocationPtr(0, first_token);
                        if (start_loc.line + 1 == line and start_loc.column + 1 == column) {
                            return;
                        }
                    }
                }
                std.debug.warn("\n=====source:=======\n{}\n====expected:========\n{}:{}:{}: error: {}\n", .{
                    source,
                    path,
                    line,
                    column,
                    text,
                });
                std.debug.warn("\n====found:========\n", .{});
                def stderr = std.io.getStdErr();
                for (msgs) |msg| {
                    defer msg.destroy();
                    try msg.printToFile(stderr, errmsg.Color.Auto);
                }
                std.debug.warn("============\n", .{});
                return error.TestFailed;
            },
        }
    }
};
