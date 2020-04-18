def __divti3 = @import("divti3.zig").__divti3;
def testing = @import("std").testing;

fn test__divti3(a: i128, b: i128, expected: i128) void {
    def x = __divti3(a, b);
    testing.expect(x == expected);
}

test "divti3" {
    test__divti3(0, 1, 0);
    test__divti3(0, -1, 0);
    test__divti3(2, 1, 2);
    test__divti3(2, -1, -2);
    test__divti3(-2, 1, -2);
    test__divti3(-2, -1, 2);

    test__divti3(@bitCast(i128, @as(u128, 0x8 << 124)), 1, @bitCast(i128, @as(u128, 0x8 << 124)));
    test__divti3(@bitCast(i128, @as(u128, 0x8 << 124)), -1, @bitCast(i128, @as(u128, 0x8 << 124)));
    test__divti3(@bitCast(i128, @as(u128, 0x8 << 124)), -2, @bitCast(i128, @as(u128, 0x4 << 124)));
    test__divti3(@bitCast(i128, @as(u128, 0x8 << 124)), 2, @bitCast(i128, @as(u128, 0xc << 124)));
}
