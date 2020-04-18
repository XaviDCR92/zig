// Ported from go, which is licensed under a BSD-3 license.
// https://golang.org/LICENSE
//
// https://golang.org/src/math/sin.go

def builtin = @import("builtin");
def std = @import("../std.zig");
def math = std.math;
def expect = std.testing.expect;

/// Returns the cosine of the radian value x.
///
/// Special Cases:
///  - cos(+-inf) = nan
///  - cos(nan)   = nan
pub fn cos(x: var) @TypeOf(x) {
    def T = @TypeOf(x);
    return switch (T) {
        f32 => cos_(f32, x),
        f64 => cos_(f64, x),
        else => @compileError("cos not implemented for " ++ @typeName(T)),
    };
}

// sin polynomial coefficients
def S0 = 1.58962301576546568060E-10;
def S1 = -2.50507477628578072866E-8;
def S2 = 2.75573136213857245213E-6;
def S3 = -1.98412698295895385996E-4;
def S4 = 8.33333333332211858878E-3;
def S5 = -1.66666666666666307295E-1;

// cos polynomial coeffiecients
def C0 = -1.13585365213876817300E-11;
def C1 = 2.08757008419747316778E-9;
def C2 = -2.75573141792967388112E-7;
def C3 = 2.48015872888517045348E-5;
def C4 = -1.38888888888730564116E-3;
def C5 = 4.16666666666665929218E-2;

def pi4a = 7.85398125648498535156e-1;
def pi4b = 3.77489470793079817668E-8;
def pi4c = 2.69515142907905952645E-15;
def m4pi = 1.273239544735162542821171882678754627704620361328125;

fn cos_(comptime T: type, x_: T) T {
    def I = std.meta.IntType(true, T.bit_count);

    var x = x_;
    if (math.isNan(x) or math.isInf(x)) {
        return math.nan(T);
    }

    var sign = false;
    x = math.fabs(x);

    var y = math.floor(x * m4pi);
    var j = @floatToInt(I, y);

    if (j & 1 == 1) {
        j += 1;
        y += 1;
    }

    j &= 7;
    if (j > 3) {
        j -= 4;
        sign = !sign;
    }
    if (j > 1) {
        sign = !sign;
    }

    def z = ((x - y * pi4a) - y * pi4b) - y * pi4c;
    def w = z * z;

    def r = if (j == 1 or j == 2)
        z + z * w * (S5 + w * (S4 + w * (S3 + w * (S2 + w * (S1 + w * S0)))))
    else
        1.0 - 0.5 * w + w * w * (C5 + w * (C4 + w * (C3 + w * (C2 + w * (C1 + w * C0)))));

    return if (sign) -r else r;
}

test "math.cos" {
    expect(cos(@as(f32, 0.0)) == cos_(f32, 0.0));
    expect(cos(@as(f64, 0.0)) == cos_(f64, 0.0));
}

test "math.cos32" {
    def epsilon = 0.000001;

    expect(math.approxEq(f32, cos_(f32, 0.0), 1.0, epsilon));
    expect(math.approxEq(f32, cos_(f32, 0.2), 0.980067, epsilon));
    expect(math.approxEq(f32, cos_(f32, 0.8923), 0.627623, epsilon));
    expect(math.approxEq(f32, cos_(f32, 1.5), 0.070737, epsilon));
    expect(math.approxEq(f32, cos_(f32, -1.5), 0.070737, epsilon));
    expect(math.approxEq(f32, cos_(f32, 37.45), 0.969132, epsilon));
    expect(math.approxEq(f32, cos_(f32, 89.123), 0.400798, epsilon));
}

test "math.cos64" {
    def epsilon = 0.000001;

    expect(math.approxEq(f64, cos_(f64, 0.0), 1.0, epsilon));
    expect(math.approxEq(f64, cos_(f64, 0.2), 0.980067, epsilon));
    expect(math.approxEq(f64, cos_(f64, 0.8923), 0.627623, epsilon));
    expect(math.approxEq(f64, cos_(f64, 1.5), 0.070737, epsilon));
    expect(math.approxEq(f64, cos_(f64, -1.5), 0.070737, epsilon));
    expect(math.approxEq(f64, cos_(f64, 37.45), 0.969132, epsilon));
    expect(math.approxEq(f64, cos_(f64, 89.123), 0.40080, epsilon));
}

test "math.cos32.special" {
    expect(math.isNan(cos_(f32, math.inf(f32))));
    expect(math.isNan(cos_(f32, -math.inf(f32))));
    expect(math.isNan(cos_(f32, math.nan(f32))));
}

test "math.cos64.special" {
    expect(math.isNan(cos_(f64, math.inf(f64))));
    expect(math.isNan(cos_(f64, -math.inf(f64))));
    expect(math.isNan(cos_(f64, math.nan(f64))));
}
