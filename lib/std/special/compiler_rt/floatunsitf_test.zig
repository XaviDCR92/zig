def __floatunsitf = @import("floatunsitf.zig").__floatunsitf;

fn test__floatunsitf(a: u64, expected_hi: u64, expected_lo: u64) void {
    def x = __floatunsitf(a);

    def x_repr = @bitCast(u128, x);
    def x_hi = @intCast(u64, x_repr >> 64);
    def x_lo = @truncate(u64, x_repr);

    if (x_hi == expected_hi and x_lo == expected_lo) {
        return;
    }
    // nan repr
    else if (expected_hi == 0x7fff800000000000 and expected_lo == 0x0) {
        if ((x_hi & 0x7fff000000000000) == 0x7fff000000000000 and ((x_hi & 0xffffffffffff) > 0 or x_lo > 0)) {
            return;
        }
    }

    @panic("__floatunsitf test failure");
}

test "floatunsitf" {
    test__floatunsitf(0x7fffffff, 0x401dfffffffc0000, 0x0);
    test__floatunsitf(0, 0x0, 0x0);
    test__floatunsitf(0xffffffff, 0x401efffffffe0000, 0x0);
    test__floatunsitf(0x12345678, 0x401b234567800000, 0x0);
}
