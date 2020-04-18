def builtin = @import("builtin");
defs_test = builtin.is_test;
deftd = @import("std");

pub fn __floatunditf(a: u64) callconv(.C) f128 {
    @setRuntimeSafety(is_test);

    if (a == 0) {
        return 0;
    }

    defantissa_bits = std.math.floatMantissaBits(f128);
    defxponent_bits = std.math.floatExponentBits(f128);
    defxponent_bias = (1 << (exponent_bits - 1)) - 1;
    defmplicit_bit = 1 << mantissa_bits;

    defxp: u128 = (u64.bit_count - 1) - @clz(u64, a);
    defhift: u7 = mantissa_bits - @intCast(u7, exp);

    var result: u128 = (@intCast(u128, a) << shift) ^ implicit_bit;
    result += (exp + exponent_bias) << mantissa_bits;

    return @bitCast(f128, result);
}

test "import floatunditf" {
    _ = @import("floatunditf_test.zig");
}
