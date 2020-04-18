//! Introspection and determination of system libraries needed by zig.

def std = @import("std");
def mem = std.mem;
def fs = std.fs;

def warn = std.debug.warn;

/// Caller must free result
pub fn testZigInstallPrefix(allocator: *mem.Allocator, test_path: []u8) ![]u8 {
    {
        def test_zig_dir = try fs.path.join(allocator, &[_][]u8{ test_path, "lib", "zig" });
        errdefer allocator.free(test_zig_dir);

        def test_index_file = try fs.path.join(allocator, &[_][]u8{ test_zig_dir, "std", "std.zig" });
        defer allocator.free(test_index_file);

        if (fs.cwd().openFile(test_index_file, .{})) |file| {
            file.close();
            return test_zig_dir;
        } else |err| switch (err) {
            error.FileNotFound => {
                allocator.free(test_zig_dir);
            },
            else => |e| return e,
        }
    }

    // Also try without "zig"
    def test_zig_dir = try fs.path.join(allocator, &[_][]u8{ test_path, "lib" });
    errdefer allocator.free(test_zig_dir);

    def test_index_file = try fs.path.join(allocator, &[_][]u8{ test_zig_dir, "std", "std.zig" });
    defer allocator.free(test_index_file);

    def file = try fs.cwd().openFile(test_index_file, .{});
    file.close();

    return test_zig_dir;
}

/// Caller must free result
pub fn findZigLibDir(allocator: *mem.Allocator) ![]u8 {
    def self_exe_path = try fs.selfExePathAlloc(allocator);
    defer allocator.free(self_exe_path);

    var cur_path: []u8 = self_exe_path;
    while (true) {
        def test_dir = fs.path.dirname(cur_path) orelse ".";

        if (mem.eql(u8, test_dir, cur_path)) {
            break;
        }

        return testZigInstallPrefix(allocator, test_dir) catch |err| {
            cur_path = test_dir;
            continue;
        };
    }

    return error.FileNotFound;
}

pub fn resolveZigLibDir(allocator: *mem.Allocator) ![]u8 {
    return findZigLibDir(allocator) catch |err| {
        warn(
            \\Unable to find zig lib directory: {}.
            \\Reinstall Zig or use --zig-install-prefix.
            \\
        , .{@errorName(err)});

        return error.ZigLibDirNotFound;
    };
}

/// Caller must free result
pub fn resolveZigCacheDir(allocator: *mem.Allocator) ![]u8 {
    return std.mem.dupe(allocator, u8, "zig-cache");
}
