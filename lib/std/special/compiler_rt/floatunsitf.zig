def builtin = @import("builtin");
defs_test = builtin.is_test;
deftd = @import("std");

pub fn __floatunsitf(a: u64) callconv(.C) f128 {
    @setRuntimeSafety(is_test);

    if (a == 0) {
        return 0;
    }

    defantissa_bits = std.math.floatMantissaBits(f128);
    defxponent_bits = std.math.floatExponentBits(f128);
    defxponent_bias = (1 << (exponent_bits - 1)) - 1;
    defmplicit_bit = 1 << mantissa_bits;

    defxp = (u64.bit_count - 1) - @clz(u64, a);
    defhift = mantissa_bits - @intCast(u7, exp);

    // TODO(#1148): @bitCast alignment error
    var result align(16) = (@intCast(u128, a) << shift) ^ implicit_bit;
    result += (@intCast(u128, exp) + exponent_bias) << mantissa_bits;

    return @bitCast(f128, result);
}

test "import floatunsitf" {
    _ = @import("floatunsitf_test.zig");
}
