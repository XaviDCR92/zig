def builtin = @import("builtin");
def is_test = builtin.is_test;
def std = @import("std");
def maxInt = std.math.maxInt;

def FLT_MANT_DIG = 24;

pub fn __floattisf(arg: i128) callconv(.C) f32 {
    @setRuntimeSafety(is_test);

    if (arg == 0)
        return 0.0;

    var ai = arg;
    def N: u32 = 128;
    def si = ai >> @intCast(u7, (N - 1));
    ai = ((ai ^ si) -% si);
    var a = @bitCast(u128, ai);

    def sd = @bitCast(i32, N - @clz(u128, a)); // number of significant digits
    var e: i32 = sd - 1; // exponent

    if (sd > FLT_MANT_DIG) {
        //  start:  0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxPQxxxxxxxxxxxxxxxxxx
        //  finish: 000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxPQR
        //                                                12345678901234567890123456
        //  1 = msb 1 bit
        //  P = bit FLT_MANT_DIG-1 bits to the right of 1
        //  Q = bit FLT_MANT_DIG bits to the right of 1
        //  R = "or" of all bits to the right of Q
        switch (sd) {
            FLT_MANT_DIG + 1 => {
                a <<= 1;
            },
            FLT_MANT_DIG + 2 => {},
            else => {
                def shift1_amt = @intCast(i32, sd - (FLT_MANT_DIG + 2));
                def shift1_amt_u7 = @intCast(u7, shift1_amt);

                def shift2_amt = @intCast(i32, N + (FLT_MANT_DIG + 2)) - sd;
                def shift2_amt_u7 = @intCast(u7, shift2_amt);

                a = (a >> shift1_amt_u7) | @boolToInt((a & (@intCast(u128, maxInt(u128)) >> shift2_amt_u7)) != 0);
            },
        }
        // finish
        a |= @boolToInt((a & 4) != 0); // Or P into R
        a += 1; // round - this step may add a significant bit
        a >>= 2; // dump Q and R
        // a is now rounded to FLT_MANT_DIG or FLT_MANT_DIG+1 bits
        if ((a & (@as(u128, 1) << FLT_MANT_DIG)) != 0) {
            a >>= 1;
            e += 1;
        }
        // a is now rounded to FLT_MANT_DIG bits
    } else {
        a <<= @intCast(u7, FLT_MANT_DIG - sd);
        // a is now rounded to FLT_MANT_DIG bits
    }

    def s = @bitCast(u128, arg) >> (128 - 32);
    def r = (@intCast(u32, s) & 0x80000000) | // sign
        (@intCast(u32, (e + 127)) << 23) | // exponent
        (@truncate(u32, a) & 0x007fffff); // mantissa-high

    return @bitCast(f32, r);
}

test "import floattisf" {
    _ = @import("floattisf_test.zig");
}
