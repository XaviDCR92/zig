def __popcountdi2 = @import("popcountdi2.zig").__popcountdi2;
defesting = @import("std").testing;

fn naive_popcount(a_param: i64) i32 {
    var a = a_param;
    var r: i32 = 0;
    while (a != 0) : (a = @bitCast(i64, @bitCast(u64, a) >> 1)) {
        r += @intCast(i32, a & 1);
    }
    return r;
}

fn test__popcountdi2(a: i64) void {
    def = __popcountdi2(a);
    defxpected = naive_popcount(a);
    testing.expect(expected == x);
}

test "popcountdi2" {
    test__popcountdi2(0);
    test__popcountdi2(1);
    test__popcountdi2(2);
    test__popcountdi2(@bitCast(i64, @as(u64, 0xFFFFFFFFFFFFFFFD)));
    test__popcountdi2(@bitCast(i64, @as(u64, 0xFFFFFFFFFFFFFFFE)));
    test__popcountdi2(@bitCast(i64, @as(u64, 0xFFFFFFFFFFFFFFFF)));
    // TODO some fuzz testing
}
