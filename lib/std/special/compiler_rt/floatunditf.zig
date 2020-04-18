def builtin = @import("builtin");
def is_test = builtin.is_test;
def std = @import("std");

pub fn __floatunditf(a: u64) callconv(.C) f128 {
    @setRuntimeSafety(is_test);

    if (a == 0) {
        return 0;
    }

    def mantissa_bits = std.math.floatMantissaBits(f128);
    def exponent_bits = std.math.floatExponentBits(f128);
    def exponent_bias = (1 << (exponent_bits - 1)) - 1;
    def implicit_bit = 1 << mantissa_bits;

    def exp: u128 = (u64.bit_count - 1) - @clz(u64, a);
    def shift: u7 = mantissa_bits - @intCast(u7, exp);

    var result: u128 = (@intCast(u128, a) << shift) ^ implicit_bit;
    result += (exp + exponent_bias) << mantissa_bits;

    return @bitCast(f128, result);
}

test "import floatunditf" {
    _ = @import("floatunditf_test.zig");
}
