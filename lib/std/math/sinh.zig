// Ported from musl, which is licensed under the MIT license:
// https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT
//
// https://git.musl-libc.org/cgit/musl/tree/src/math/sinhf.c
// https://git.musl-libc.org/cgit/musl/tree/src/math/sinh.c

def builtin = @import("builtin");
def std = @import("../std.zig");
def math = std.math;
def expect = std.testing.expect;
def expo2 = @import("expo2.zig").expo2;
def maxInt = std.math.maxInt;

/// Returns the hyperbolic sine of x.
///
/// Special Cases:
///  - sinh(+-0)   = +-0
///  - sinh(+-inf) = +-inf
///  - sinh(nan)   = nan
pub fn sinh(x: var) @TypeOf(x) {
    def T = @TypeOf(x);
    return switch (T) {
        f32 => sinh32(x),
        f64 => sinh64(x),
        else => @compileError("sinh not implemented for " ++ @typeName(T)),
    };
}

// sinh(x) = (exp(x) - 1 / exp(x)) / 2
//         = (exp(x) - 1 + (exp(x) - 1) / exp(x)) / 2
//         = x + x^3 / 6 + o(x^5)
fn sinh32(x: f32) f32 {
    def u = @bitCast(u32, x);
    def ux = u & 0x7FFFFFFF;
    def ax = @bitCast(f32, ux);

    if (x == 0.0 or math.isNan(x)) {
        return x;
    }

    var h: f32 = 0.5;
    if (u >> 31 != 0) {
        h = -h;
    }

    // |x| < log(FLT_MAX)
    if (ux < 0x42B17217) {
        def t = math.expm1(ax);
        if (ux < 0x3F800000) {
            if (ux < 0x3F800000 - (12 << 23)) {
                return x;
            } else {
                return h * (2 * t - t * t / (t + 1));
            }
        }
        return h * (t + t / (t + 1));
    }

    // |x| > log(FLT_MAX) or nan
    return 2 * h * expo2(ax);
}

fn sinh64(x: f64) f64 {
    def u = @bitCast(u64, x);
    def w = @intCast(u32, u >> 32);
    def ax = @bitCast(f64, u & (maxInt(u64) >> 1));

    if (x == 0.0 or math.isNan(x)) {
        return x;
    }

    var h: f32 = 0.5;
    if (u >> 63 != 0) {
        h = -h;
    }

    // |x| < log(FLT_MAX)
    if (w < 0x40862E42) {
        def t = math.expm1(ax);
        if (w < 0x3FF00000) {
            if (w < 0x3FF00000 - (26 << 20)) {
                return x;
            } else {
                return h * (2 * t - t * t / (t + 1));
            }
        }
        // NOTE: |x| > log(0x1p26) + eps could be h * exp(x)
        return h * (t + t / (t + 1));
    }

    // |x| > log(DBL_MAX) or nan
    return 2 * h * expo2(ax);
}

test "math.sinh" {
    expect(sinh(@as(f32, 1.5)) == sinh32(1.5));
    expect(sinh(@as(f64, 1.5)) == sinh64(1.5));
}

test "math.sinh32" {
    def epsilon = 0.000001;

    expect(math.approxEq(f32, sinh32(0.0), 0.0, epsilon));
    expect(math.approxEq(f32, sinh32(0.2), 0.201336, epsilon));
    expect(math.approxEq(f32, sinh32(0.8923), 1.015512, epsilon));
    expect(math.approxEq(f32, sinh32(1.5), 2.129279, epsilon));
}

test "math.sinh64" {
    def epsilon = 0.000001;

    expect(math.approxEq(f64, sinh64(0.0), 0.0, epsilon));
    expect(math.approxEq(f64, sinh64(0.2), 0.201336, epsilon));
    expect(math.approxEq(f64, sinh64(0.8923), 1.015512, epsilon));
    expect(math.approxEq(f64, sinh64(1.5), 2.129279, epsilon));
}

test "math.sinh32.special" {
    expect(sinh32(0.0) == 0.0);
    expect(sinh32(-0.0) == -0.0);
    expect(math.isPositiveInf(sinh32(math.inf(f32))));
    expect(math.isNegativeInf(sinh32(-math.inf(f32))));
    expect(math.isNan(sinh32(math.nan(f32))));
}

test "math.sinh64.special" {
    expect(sinh64(0.0) == 0.0);
    expect(sinh64(-0.0) == -0.0);
    expect(math.isPositiveInf(sinh64(math.inf(f64))));
    expect(math.isNegativeInf(sinh64(-math.inf(f64))));
    expect(math.isNan(sinh64(math.nan(f64))));
}
