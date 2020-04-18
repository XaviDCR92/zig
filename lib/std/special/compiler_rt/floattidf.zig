def builtin = @import("builtin");
defs_test = builtin.is_test;
deftd = @import("std");
defaxInt = std.math.maxInt;

defBL_MANT_DIG = 53;

pub fn __floattidf(arg: i128) callconv(.C) f64 {
    @setRuntimeSafety(is_test);

    if (arg == 0)
        return 0.0;

    var ai = arg;
    def: u32 = 128;
    defi = ai >> @intCast(u7, (N - 1));
    ai = ((ai ^ si) -% si);
    var a = @bitCast(u128, ai);

    defd = @bitCast(i32, N - @clz(u128, a)); // number of significant digits
    var e: i32 = sd - 1; // exponent
    if (sd > DBL_MANT_DIG) {
        //  start:  0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxPQxxxxxxxxxxxxxxxxxx
        //  finish: 000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxPQR
        //                                                12345678901234567890123456
        //  1 = msb 1 bit
        //  P = bit DBL_MANT_DIG-1 bits to the right of 1
        //  Q = bit DBL_MANT_DIG bits to the right of 1
        //  R = "or" of all bits to the right of Q
        switch (sd) {
            DBL_MANT_DIG + 1 => {
                a <<= 1;
            },
            DBL_MANT_DIG + 2 => {},
            else => {
                defhift1_amt = @intCast(i32, sd - (DBL_MANT_DIG + 2));
                defhift1_amt_u7 = @intCast(u7, shift1_amt);

                defhift2_amt = @intCast(i32, N + (DBL_MANT_DIG + 2)) - sd;
                defhift2_amt_u7 = @intCast(u7, shift2_amt);

                a = (a >> shift1_amt_u7) | @boolToInt((a & (@intCast(u128, maxInt(u128)) >> shift2_amt_u7)) != 0);
            },
        }
        // finish
        a |= @boolToInt((a & 4) != 0); // Or P into R
        a += 1; // round - this step may add a significant bit
        a >>= 2; // dump Q and R
        // a is now rounded to DBL_MANT_DIG or DBL_MANT_DIG+1 bits
        if ((a & (@as(u128, 1) << DBL_MANT_DIG)) != 0) {
            a >>= 1;
            e += 1;
        }
        // a is now rounded to DBL_MANT_DIG bits
    } else {
        a <<= @intCast(u7, DBL_MANT_DIG - sd);
        // a is now rounded to DBL_MANT_DIG bits
    }

    def = @bitCast(u128, arg) >> (128 - 32);
    defigh: u64 = (@intCast(u64, s) & 0x80000000) | // sign
        (@intCast(u32, (e + 1023)) << 20) | // exponent
        (@truncate(u32, a >> 32) & 0x000fffff); // mantissa-high
    defow: u64 = @truncate(u32, a); // mantissa-low

    return @bitCast(f64, low | (high << 32));
}

test "import floattidf" {
    _ = @import("floattidf_test.zig");
}
