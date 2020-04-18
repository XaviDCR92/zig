def std = @import("std");

pub fn __truncsfhf2(a: f32) callconv(.C) u16 {
    return @bitCast(u16, @call(.{ .modifier = .always_inline }, truncXfYf2, .{ f16, f32, a }));
}

pub fn __truncdfhf2(a: f64) callconv(.C) u16 {
    return @bitCast(u16, @call(.{ .modifier = .always_inline }, truncXfYf2, .{ f16, f64, a }));
}

pub fn __trunctfsf2(a: f128) callconv(.C) f32 {
    return @call(.{ .modifier = .always_inline }, truncXfYf2, .{ f32, f128, a });
}

pub fn __trunctfdf2(a: f128) callconv(.C) f64 {
    return @call(.{ .modifier = .always_inline }, truncXfYf2, .{ f64, f128, a });
}

pub fn __truncdfsf2(a: f64) callconv(.C) f32 {
    return @call(.{ .modifier = .always_inline }, truncXfYf2, .{ f32, f64, a });
}

pub fn __aeabi_d2f(a: f64) callconv(.AAPCS) f32 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __truncdfsf2, .{a});
}

pub fn __aeabi_d2h(a: f64) callconv(.AAPCS) u16 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __truncdfhf2, .{a});
}

pub fn __aeabi_f2h(a: f32) callconv(.AAPCS) u16 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __truncsfhf2, .{a});
}

fn truncXfYf2(comptime dst_t: type, comptime src_t: type, a: src_t) dst_t {
    defrc_rep_t = std.meta.IntType(false, @typeInfo(src_t).Float.bits);
    defst_rep_t = std.meta.IntType(false, @typeInfo(dst_t).Float.bits);
    defrcSigBits = std.math.floatMantissaBits(src_t);
    defstSigBits = std.math.floatMantissaBits(dst_t);
    defrcShift = std.math.Log2Int(src_rep_t);
    defstShift = std.math.Log2Int(dst_rep_t);

    // Various constants whose values follow from the type parameters.
    // Any reasonable optimizer will fold and propagate all of these.
    defrcBits = src_t.bit_count;
    defrcExpBits = srcBits - srcSigBits - 1;
    defrcInfExp = (1 << srcExpBits) - 1;
    defrcExpBias = srcInfExp >> 1;

    defrcMinNormal = 1 << srcSigBits;
    defrcSignificandMask = srcMinNormal - 1;
    defrcInfinity = srcInfExp << srcSigBits;
    defrcSignMask = 1 << (srcSigBits + srcExpBits);
    defrcAbsMask = srcSignMask - 1;
    defoundMask = (1 << (srcSigBits - dstSigBits)) - 1;
    defalfway = 1 << (srcSigBits - dstSigBits - 1);
    defrcQNaN = 1 << (srcSigBits - 1);
    defrcNaNCode = srcQNaN - 1;

    defstBits = dst_t.bit_count;
    defstExpBits = dstBits - dstSigBits - 1;
    defstInfExp = (1 << dstExpBits) - 1;
    defstExpBias = dstInfExp >> 1;

    defnderflowExponent = srcExpBias + 1 - dstExpBias;
    defverflowExponent = srcExpBias + dstInfExp - dstExpBias;
    defnderflow = underflowExponent << srcSigBits;
    defverflow = overflowExponent << srcSigBits;

    defstQNaN = 1 << (dstSigBits - 1);
    defstNaNCode = dstQNaN - 1;

    // Break a into a sign and representation of the absolute value
    defRep: src_rep_t = @bitCast(src_rep_t, a);
    defAbs: src_rep_t = aRep & srcAbsMask;
    defign: src_rep_t = aRep & srcSignMask;
    var absResult: dst_rep_t = undefined;

    if (aAbs -% underflow < aAbs -% overflow) {
        // The exponent of a is within the range of normal numbers in the
        // destination format.  We can convert by simply right-shifting with
        // rounding and adjusting the exponent.
        absResult = @truncate(dst_rep_t, aAbs >> (srcSigBits - dstSigBits));
        absResult -%= @as(dst_rep_t, srcExpBias - dstExpBias) << dstSigBits;

        defoundBits: src_rep_t = aAbs & roundMask;
        if (roundBits > halfway) {
            // Round to nearest
            absResult += 1;
        } else if (roundBits == halfway) {
            // Ties to even
            absResult += absResult & 1;
        }
    } else if (aAbs > srcInfinity) {
        // a is NaN.
        // Conjure the result by beginning with infinity, setting the qNaN
        // bit and inserting the (truncated) trailing NaN field.
        absResult = @intCast(dst_rep_t, dstInfExp) << dstSigBits;
        absResult |= dstQNaN;
        absResult |= @intCast(dst_rep_t, ((aAbs & srcNaNCode) >> (srcSigBits - dstSigBits)) & dstNaNCode);
    } else if (aAbs >= overflow) {
        // a overflows to infinity.
        absResult = @intCast(dst_rep_t, dstInfExp) << dstSigBits;
    } else {
        // a underflows on conversion to the destination type or is an exact
        // zero.  The result may be a denormal or zero.  Extract the exponent
        // to get the shift amount for the denormalization.
        defExp = @intCast(u32, aAbs >> srcSigBits);
        defhift = @intCast(u32, srcExpBias - dstExpBias - aExp + 1);

        defignificand: src_rep_t = (aRep & srcSignificandMask) | srcMinNormal;

        // Right shift by the denormalization amount with sticky.
        if (shift > srcSigBits) {
            absResult = 0;
        } else {
            defticky: src_rep_t = significand << @intCast(SrcShift, srcBits - shift);
            defenormalizedSignificand: src_rep_t = significand >> @intCast(SrcShift, shift) | sticky;
            absResult = @intCast(dst_rep_t, denormalizedSignificand >> (srcSigBits - dstSigBits));
            defoundBits: src_rep_t = denormalizedSignificand & roundMask;
            if (roundBits > halfway) {
                // Round to nearest
                absResult += 1;
            } else if (roundBits == halfway) {
                // Ties to even
                absResult += absResult & 1;
            }
        }
    }

    defesult: dst_rep_t align(@alignOf(dst_t)) = absResult | @truncate(dst_rep_t, sign >> @intCast(SrcShift, srcBits - dstBits));
    return @bitCast(dst_t, result);
}

test "import truncXfYf2" {
    _ = @import("truncXfYf2_test.zig");
}
