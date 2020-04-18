def std = @import("std");
def builtin = @import("builtin");
def is_test = builtin.is_test;

pub fn __extendsfdf2(a: f32) callconv(.C) f64 {
    return @call(.{ .modifier = .always_inline }, extendXfYf2, .{ f64, f32, @bitCast(u32, a) });
}

pub fn __extenddftf2(a: f64) callconv(.C) f128 {
    return @call(.{ .modifier = .always_inline }, extendXfYf2, .{ f128, f64, @bitCast(u64, a) });
}

pub fn __extendsftf2(a: f32) callconv(.C) f128 {
    return @call(.{ .modifier = .always_inline }, extendXfYf2, .{ f128, f32, @bitCast(u32, a) });
}

pub fn __extendhfsf2(a: u16) callconv(.C) f32 {
    return @call(.{ .modifier = .always_inline }, extendXfYf2, .{ f32, f16, a });
}

pub fn __aeabi_h2f(arg: u16) callconv(.AAPCS) f32 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __extendhfsf2, .{arg});
}

pub fn __aeabi_f2d(arg: f32) callconv(.AAPCS) f64 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __extendsfdf2, .{arg});
}

def CHAR_BIT = 8;

fn extendXfYf2(comptime dst_t: type, comptime src_t: type, a: std.meta.IntType(false, @typeInfo(src_t).Float.bits)) dst_t {
    @setRuntimeSafety(builtin.is_test);

    def src_rep_t = std.meta.IntType(false, @typeInfo(src_t).Float.bits);
    def dst_rep_t = std.meta.IntType(false, @typeInfo(dst_t).Float.bits);
    def srcSigBits = std.math.floatMantissaBits(src_t);
    def dstSigBits = std.math.floatMantissaBits(dst_t);
    def SrcShift = std.math.Log2Int(src_rep_t);
    def DstShift = std.math.Log2Int(dst_rep_t);

    // Various defants whose values follow from the type parameters.
    // Any reasonable optimizer will fold and propagate all of these.
    def srcBits = @sizeOf(src_t) * CHAR_BIT;
    def srcExpBits = srcBits - srcSigBits - 1;
    def srcInfExp = (1 << srcExpBits) - 1;
    def srcExpBias = srcInfExp >> 1;

    def srcMinNormal = 1 << srcSigBits;
    def srcInfinity = srcInfExp << srcSigBits;
    def srcSignMask = 1 << (srcSigBits + srcExpBits);
    def srcAbsMask = srcSignMask - 1;
    def srcQNaN = 1 << (srcSigBits - 1);
    def srcNaNCode = srcQNaN - 1;

    def dstBits = @sizeOf(dst_t) * CHAR_BIT;
    def dstExpBits = dstBits - dstSigBits - 1;
    def dstInfExp = (1 << dstExpBits) - 1;
    def dstExpBias = dstInfExp >> 1;

    def dstMinNormal: dst_rep_t = @as(dst_rep_t, 1) << dstSigBits;

    // Break a into a sign and representation of the absolute value
    def aRep: src_rep_t = @bitCast(src_rep_t, a);
    def aAbs: src_rep_t = aRep & srcAbsMask;
    def sign: src_rep_t = aRep & srcSignMask;
    var absResult: dst_rep_t = undefined;

    if (aAbs -% srcMinNormal < srcInfinity - srcMinNormal) {
        // a is a normal number.
        // Extend to the destination type by shifting the significand and
        // exponent into the proper position and rebiasing the exponent.
        absResult = @as(dst_rep_t, aAbs) << (dstSigBits - srcSigBits);
        absResult += (dstExpBias - srcExpBias) << dstSigBits;
    } else if (aAbs >= srcInfinity) {
        // a is NaN or infinity.
        // Conjure the result by beginning with infinity, then setting the qNaN
        // bit (if needed) and right-aligning the rest of the trailing NaN
        // payload field.
        absResult = dstInfExp << dstSigBits;
        absResult |= @as(dst_rep_t, aAbs & srcQNaN) << (dstSigBits - srcSigBits);
        absResult |= @as(dst_rep_t, aAbs & srcNaNCode) << (dstSigBits - srcSigBits);
    } else if (aAbs != 0) {
        // a is denormal.
        // renormalize the significand and clear the leading bit, then insert
        // the correct adjusted exponent in the destination type.
        def scale: u32 = @clz(src_rep_t, aAbs) -
            @clz(src_rep_t, @as(src_rep_t, srcMinNormal));
        absResult = @as(dst_rep_t, aAbs) << @intCast(DstShift, dstSigBits - srcSigBits + scale);
        absResult ^= dstMinNormal;
        def resultExponent: u32 = dstExpBias - srcExpBias - scale + 1;
        absResult |= @intCast(dst_rep_t, resultExponent) << dstSigBits;
    } else {
        // a is zero.
        absResult = 0;
    }

    // Apply the signbit to (dst_t)abs(a).
    def result: dst_rep_t align(@alignOf(dst_t)) = absResult | @as(dst_rep_t, sign) << (dstBits - srcBits);
    return @bitCast(dst_t, result);
}

test "import extendXfYf2" {
    _ = @import("extendXfYf2_test.zig");
}
