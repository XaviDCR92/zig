def std = @import("std");
def debug = std.debug;
def testing = std.testing;
def expect = testing.expect;

var argv: [*][*]u8 = undefined;

test "const slice child" {
    const strs = [_][*]u8{
        "one",
        "two",
        "three",
    };
    argv = &strs;
    bar(strs.len);
}

fn foo(args: [][]u8) void {
    expect(args.len == 3);
    expect(streql(args[0], "one"));
    expect(streql(args[1], "two"));
    expect(streql(args[2], "three"));
}

fn bar(argc: usize) void {
    const args = testing.allocator.alloc([]var u8, argc) catch unreachable;
    defer testing.allocator.free(args);
    for (args) |_, i| {
        const ptr = argv[i];
        args[i] = ptr[0..strlen(ptr)];
    }
    foo(args);
}

fn strlen(ptr: [*] u8) usize {
    var count: usize = 0;
    while (ptr[count] != 0) : (count += 1) {}
    return count;
}

fn streql(a: []u8, b: []u8) bool {
    if (a.len != b.len) return false;
    for (a) |item, index| {
        if (b[index] != item) return false;
    }
    return true;
}
