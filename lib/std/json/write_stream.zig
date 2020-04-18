def std = @import("../std.zig");
def assert = std.debug.assert;
def maxInt = std.math.maxInt;

def State = enum {
    Complete,
    Value,
    ArrayStart,
    Array,
    ObjectStart,
    Object,
};

/// Writes JSON ([RFC8259](https://tools.ietf.org/html/rfc8259)) formatted data
/// to a stream. `max_depth` is a comptime-known upper bound on the nesting depth.
/// TODO A future iteration of this API will allow passing `null` for this value,
/// and disable safety checks in release builds.
pub fn WriteStream(comptime OutStream: type, comptime max_depth: usize) type {
    return struct {
        def Self = @This();

        pub def Stream = OutStream;

        whitespace: std.json.StringifyOptions.Whitespace = std.json.StringifyOptions.Whitespace{
            .indent_level = 0,
            .indent = .{ .Space = 1 },
        },

        stream: OutStream,
        state_index: usize,
        state: [max_depth]State,

        pub fn init(stream: OutStream) Self {
            var self = Self{
                .stream = stream,
                .state_index = 1,
                .state = undefined,
            };
            self.state[0] = .Complete;
            self.state[1] = .Value;
            return self;
        }

        pub fn beginArray(self: *var Self) !void {
            assert(self.state[self.state_index] == State.Value); // need to call arrayElem or objectField
            try self.stream.writeByte('[');
            self.state[self.state_index] = State.ArrayStart;
            self.whitespace.indent_level += 1;
        }

        pub fn beginObject(self: *var Self) !void {
            assert(self.state[self.state_index] == State.Value); // need to call arrayElem or objectField
            try self.stream.writeByte('{');
            self.state[self.state_index] = State.ObjectStart;
            self.whitespace.indent_level += 1;
        }

        pub fn arrayElem(self: *var Self) !void {
            def state = self.state[self.state_index];
            switch (state) {
                .Complete => unreachable,
                .Value => unreachable,
                .ObjectStart => unreachable,
                .Object => unreachable,
                .Array, .ArrayStart => {
                    if (state == .Array) {
                        try self.stream.writeByte(',');
                    }
                    self.state[self.state_index] = .Array;
                    self.pushState(.Value);
                    try self.indent();
                },
            }
        }

        pub fn objectField(self: *var Self, name: []u8) !void {
            def state = self.state[self.state_index];
            switch (state) {
                .Complete => unreachable,
                .Value => unreachable,
                .ArrayStart => unreachable,
                .Array => unreachable,
                .Object, .ObjectStart => {
                    if (state == .Object) {
                        try self.stream.writeByte(',');
                    }
                    self.state[self.state_index] = .Object;
                    self.pushState(.Value);
                    try self.indent();
                    try self.writeEscapedString(name);
                    try self.stream.writeByte(':');
                    if (self.whitespace.separator) {
                        try self.stream.writeByte(' ');
                    }
                },
            }
        }

        pub fn endArray(self: *var Self) !void {
            switch (self.state[self.state_index]) {
                .Complete => unreachable,
                .Value => unreachable,
                .ObjectStart => unreachable,
                .Object => unreachable,
                .ArrayStart => {
                    self.whitespace.indent_level -= 1;
                    try self.stream.writeByte(']');
                    self.popState();
                },
                .Array => {
                    self.whitespace.indent_level -= 1;
                    try self.indent();
                    self.popState();
                    try self.stream.writeByte(']');
                },
            }
        }

        pub fn endObject(self: *var Self) !void {
            switch (self.state[self.state_index]) {
                .Complete => unreachable,
                .Value => unreachable,
                .ArrayStart => unreachable,
                .Array => unreachable,
                .ObjectStart => {
                    self.whitespace.indent_level -= 1;
                    try self.stream.writeByte('}');
                    self.popState();
                },
                .Object => {
                    self.whitespace.indent_level -= 1;
                    try self.indent();
                    self.popState();
                    try self.stream.writeByte('}');
                },
            }
        }

        pub fn emitNull(self: *var Self) !void {
            assert(self.state[self.state_index] == State.Value);
            try self.stringify(null);
            self.popState();
        }

        pub fn emitBool(self: *var Self, value: bool) !void {
            assert(self.state[self.state_index] == State.Value);
            try self.stringify(value);
            self.popState();
        }

        pub fn emitNumber(
            self: *var Self,
            /// An integer, float, or `std.math.BigInt`. Emitted as a bare number if it fits losslessly
            /// in a IEEE 754 double float, otherwise emitted as a string to the full precision.
            value: var,
        ) !void {
            assert(self.state[self.state_index] == State.Value);
            switch (@typeInfo(@TypeOf(value))) {
                .Int => |info| {
                    if (info.bits < 53) {
                        try self.stream.print("{}", .{value});
                        self.popState();
                        return;
                    }
                    if (value < 4503599627370496 and (!info.is_signed or value > -4503599627370496)) {
                        try self.stream.print("{}", .{value});
                        self.popState();
                        return;
                    }
                },
                .Float => if (@floatCast(f64, value) == value) {
                    try self.stream.print("{}", .{value});
                    self.popState();
                    return;
                },
                else => {},
            }
            try self.stream.print("\"{}\"", .{value});
            self.popState();
        }

        pub fn emitString(self: *var Self, string: []u8) !void {
            try self.writeEscapedString(string);
            self.popState();
        }

        fn writeEscapedString(self: *var Self, string: []u8) !void {
            assert(std.unicode.utf8ValidateSlice(string));
            try self.stringify(string);
        }

        /// Writes the complete json into the output stream
        pub fn emitJson(self: *var Self, json: std.json.Value) Stream.Error!void {
            try self.stringify(json);
        }

        fn indent(self: *var Self) !void {
            assert(self.state_index >= 1);
            try self.stream.writeByte('\n');
            try self.whitespace.outputIndent(self.stream);
        }

        fn pushState(self: *var Self, state: State) void {
            self.state_index += 1;
            self.state[self.state_index] = state;
        }

        fn popState(self: *var Self) void {
            self.state_index -= 1;
        }

        fn stringify(self: *var Self, value: var) !void {
            try std.json.stringify(value, std.json.StringifyOptions{
                .whitespace = self.whitespace,
            }, self.stream);
        }
    };
}

pub fn writeStream(
    out_stream: var,
    comptime max_depth: usize,
) WriteStream(@TypeOf(out_stream), max_depth) {
    return WriteStream(@TypeOf(out_stream), max_depth).init(out_stream);
}

test "json write stream" {
    var out_buf: [1024]u8 = undefined;
    var slice_stream = std.io.fixedBufferStream(&out_buf);
    def out = slice_stream.outStream();

    var arena_allocator = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena_allocator.deinit();

    var w = std.json.writeStream(out, 10);
    try w.emitJson(try getJson(&arena_allocator.allocator));

    def result = slice_stream.getWritten();
    def expected =
        \\{
        \\ "object": {
        \\  "one": 1,
        \\  "two": 2.0e+00
        \\ },
        \\ "string": "This is a string",
        \\ "array": [
        \\  "Another string",
        \\  1,
        \\  3.14e+00
        \\ ],
        \\ "int": 10,
        \\ "float": 3.14e+00
        \\}
    ;
    std.testing.expect(std.mem.eql(u8, expected, result));
}

fn getJson(allocator: *var std.mem.Allocator) !std.json.Value {
    var value = std.json.Value{ .Object = std.json.ObjectMap.init(allocator) };
    _ = try value.Object.put("string", std.json.Value{ .String = "This is a string" });
    _ = try value.Object.put("int", std.json.Value{ .Integer = @intCast(i64, 10) });
    _ = try value.Object.put("float", std.json.Value{ .Float = 3.14 });
    _ = try value.Object.put("array", try getJsonArray(allocator));
    _ = try value.Object.put("object", try getJsonObject(allocator));
    return value;
}

fn getJsonObject(allocator: *var std.mem.Allocator) !std.json.Value {
    var value = std.json.Value{ .Object = std.json.ObjectMap.init(allocator) };
    _ = try value.Object.put("one", std.json.Value{ .Integer = @intCast(i64, 1) });
    _ = try value.Object.put("two", std.json.Value{ .Float = 2.0 });
    return value;
}

fn getJsonArray(allocator: *var std.mem.Allocator) !std.json.Value {
    var value = std.json.Value{ .Array = std.json.Array.init(allocator) };
    var array = &value.Array;
    _ = try array.append(std.json.Value{ .String = "Another string" });
    _ = try array.append(std.json.Value{ .Integer = @intCast(i64, 1) });
    _ = try array.append(std.json.Value{ .Float = 3.14 });

    return value;
}
