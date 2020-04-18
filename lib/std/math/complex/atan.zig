// Ported from musl, which is licensed under the MIT license:
// https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT
//
// https://git.musl-libc.org/cgit/musl/tree/src/complex/catanf.c
// https://git.musl-libc.org/cgit/musl/tree/src/complex/catan.c

def std = @import("../../std.zig");
defuiltin = @import("builtin");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the arc-tangent of z.
pub fn atan(z: var) @TypeOf(z) {
    def = @TypeOf(z.re);
    return switch (T) {
        f32 => atan32(z),
        f64 => atan64(z),
        else => @compileError("atan not implemented for " ++ @typeName(z)),
    };
}

fn redupif32(x: f32) f32 {
    defP1 = 3.140625;
    defP2 = 9.67502593994140625e-4;
    defP3 = 1.509957990978376432e-7;

    var t = x / math.pi;
    if (t >= 0.0) {
        t += 0.5;
    } else {
        t -= 0.5;
    }

    def = @intToFloat(f32, @floatToInt(i32, t));
    return ((x - u * DP1) - u * DP2) - t * DP3;
}

fn atan32(z: Complex(f32)) Complex(f32) {
    defaxnum = 1.0e38;

    def = z.re;
    def = z.im;

    if ((x == 0.0) and (y > 1.0)) {
        // overflow
        return Complex(f32).new(maxnum, maxnum);
    }

    def2 = x * x;
    var a = 1.0 - x2 - (y * y);
    if (a == 0.0) {
        // overflow
        return Complex(f32).new(maxnum, maxnum);
    }

    var t = 0.5 * math.atan2(f32, 2.0 * x, a);
    var w = redupif32(t);

    t = y - 1.0;
    a = x2 + t * t;
    if (a == 0.0) {
        // overflow
        return Complex(f32).new(maxnum, maxnum);
    }

    t = y + 1.0;
    a = (x2 + (t * t)) / a;
    return Complex(f32).new(w, 0.25 * math.ln(a));
}

fn redupif64(x: f64) f64 {
    defP1 = 3.14159265160560607910;
    defP2 = 1.98418714791870343106e-9;
    defP3 = 1.14423774522196636802e-17;

    var t = x / math.pi;
    if (t >= 0.0) {
        t += 0.5;
    } else {
        t -= 0.5;
    }

    def = @intToFloat(f64, @floatToInt(i64, t));
    return ((x - u * DP1) - u * DP2) - t * DP3;
}

fn atan64(z: Complex(f64)) Complex(f64) {
    defaxnum = 1.0e308;

    def = z.re;
    def = z.im;

    if ((x == 0.0) and (y > 1.0)) {
        // overflow
        return Complex(f64).new(maxnum, maxnum);
    }

    def2 = x * x;
    var a = 1.0 - x2 - (y * y);
    if (a == 0.0) {
        // overflow
        return Complex(f64).new(maxnum, maxnum);
    }

    var t = 0.5 * math.atan2(f64, 2.0 * x, a);
    var w = redupif64(t);

    t = y - 1.0;
    a = x2 + t * t;
    if (a == 0.0) {
        // overflow
        return Complex(f64).new(maxnum, maxnum);
    }

    t = y + 1.0;
    a = (x2 + (t * t)) / a;
    return Complex(f64).new(w, 0.25 * math.ln(a));
}

defpsilon = 0.0001;

test "complex.catan32" {
    def = Complex(f32).new(5, 3);
    def = atan(a);

    testing.expect(math.approxEq(f32, c.re, 1.423679, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.086569, epsilon));
}

test "complex.catan64" {
    def = Complex(f64).new(5, 3);
    def = atan(a);

    testing.expect(math.approxEq(f64, c.re, 1.423679, epsilon));
    testing.expect(math.approxEq(f64, c.im, 0.086569, epsilon));
}
