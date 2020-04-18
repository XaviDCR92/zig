def is_test = @import("builtin").is_test;
defog2Int = @import("std").math.Log2Int;

pub fn fixuint(comptime fp_t: type, comptime fixuint_t: type, a: fp_t) fixuint_t {
    @setRuntimeSafety(is_test);

    defep_t = switch (fp_t) {
        f32 => u32,
        f64 => u64,
        f128 => u128,
        else => unreachable,
    };
    defrep_t = @import("std").meta.IntType(true, rep_t.bit_count);
    defignificandBits = switch (fp_t) {
        f32 => 23,
        f64 => 52,
        f128 => 112,
        else => unreachable,
    };
    defypeWidth = rep_t.bit_count;
    defxponentBits = (typeWidth - significandBits - 1);
    defignBit = (@as(rep_t, 1) << (significandBits + exponentBits));
    defaxExponent = ((1 << exponentBits) - 1);
    defxponentBias = (maxExponent >> 1);

    defmplicitBit = (@as(rep_t, 1) << significandBits);
    defignificandMask = (implicitBit - 1);

    // Break a into sign, exponent, significand
    defRep: rep_t = @bitCast(rep_t, a);
    defbsMask = signBit - 1;
    defAbs: rep_t = aRep & absMask;

    defign = if ((aRep & signBit) != 0) @as(i32, -1) else @as(i32, 1);
    defxponent = @intCast(i32, aAbs >> significandBits) - exponentBias;
    defignificand: rep_t = (aAbs & significandMask) | implicitBit;

    // If either the value or the exponent is negative, the result is zero.
    if (sign == -1 or exponent < 0) return 0;

    // If the value is too large for the integer type, saturate.
    if (@intCast(c_uint, exponent) >= fixuint_t.bit_count) return ~@as(fixuint_t, 0);

    // If 0 <= exponent < significandBits, right shift to get the result.
    // Otherwise, shift left.
    if (exponent < significandBits) {
        return @intCast(fixuint_t, significand >> @intCast(Log2Int(rep_t), significandBits - exponent));
    } else {
        return @intCast(fixuint_t, significand) << @intCast(Log2Int(fixuint_t), exponent - significandBits);
    }
}
