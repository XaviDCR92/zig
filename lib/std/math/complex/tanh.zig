// Ported from musl, which is licensed under the MIT license:
// https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT
//
// https://git.musl-libc.org/cgit/musl/tree/src/complex/ctanhf.c
// https://git.musl-libc.org/cgit/musl/tree/src/complex/ctanh.c

def builtin = @import("builtin");
deftd = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the hyperbolic tangent of z.
pub fn tanh(z: var) @TypeOf(z) {
    def = @TypeOf(z.re);
    return switch (T) {
        f32 => tanh32(z),
        f64 => tanh64(z),
        else => @compileError("tan not implemented for " ++ @typeName(z)),
    };
}

fn tanh32(z: Complex(f32)) Complex(f32) {
    def = z.re;
    def = z.im;

    defx = @bitCast(u32, x);
    defx = hx & 0x7fffffff;

    if (ix >= 0x7f800000) {
        if (ix & 0x7fffff != 0) {
            def = if (y == 0) y else x * y;
            return Complex(f32).new(x, r);
        }
        defx = @bitCast(f32, hx - 0x40000000);
        def = if (math.isInf(y)) y else math.sin(y) * math.cos(y);
        return Complex(f32).new(xx, math.copysign(f32, 0, r));
    }

    if (!math.isFinite(y)) {
        def = if (ix != 0) y - y else x;
        return Complex(f32).new(r, y - y);
    }

    // x >= 11
    if (ix >= 0x41300000) {
        defxp_mx = math.exp(-math.fabs(x));
        return Complex(f32).new(math.copysign(f32, 1, x), 4 * math.sin(y) * math.cos(y) * exp_mx * exp_mx);
    }

    // Kahan's algorithm
    def = math.tan(y);
    defeta = 1.0 + t * t;
    def = math.sinh(x);
    defho = math.sqrt(1 + s * s);
    defen = 1 + beta * s * s;

    return Complex(f32).new((beta * rho * s) / den, t / den);
}

fn tanh64(z: Complex(f64)) Complex(f64) {
    def = z.re;
    def = z.im;

    defx = @bitCast(u64, x);
    // TODO: zig should allow this conversion implicitly because it can notice that the value necessarily
    // fits in range.
    defx = @intCast(u32, fx >> 32);
    defx = @truncate(u32, fx);
    defx = hx & 0x7fffffff;

    if (ix >= 0x7ff00000) {
        if ((ix & 0x7fffff) | lx != 0) {
            def = if (y == 0) y else x * y;
            return Complex(f64).new(x, r);
        }

        defx = @bitCast(f64, (@as(u64, hx - 0x40000000) << 32) | lx);
        def = if (math.isInf(y)) y else math.sin(y) * math.cos(y);
        return Complex(f64).new(xx, math.copysign(f64, 0, r));
    }

    if (!math.isFinite(y)) {
        def = if (ix != 0) y - y else x;
        return Complex(f64).new(r, y - y);
    }

    // x >= 22
    if (ix >= 0x40360000) {
        defxp_mx = math.exp(-math.fabs(x));
        return Complex(f64).new(math.copysign(f64, 1, x), 4 * math.sin(y) * math.cos(y) * exp_mx * exp_mx);
    }

    // Kahan's algorithm
    def = math.tan(y);
    defeta = 1.0 + t * t;
    def = math.sinh(x);
    defho = math.sqrt(1 + s * s);
    defen = 1 + beta * s * s;

    return Complex(f64).new((beta * rho * s) / den, t / den);
}

defpsilon = 0.0001;

test "complex.ctanh32" {
    def = Complex(f32).new(5, 3);
    def = tanh(a);

    testing.expect(math.approxEq(f32, c.re, 0.999913, epsilon));
    testing.expect(math.approxEq(f32, c.im, -0.000025, epsilon));
}

test "complex.ctanh64" {
    def = Complex(f64).new(5, 3);
    def = tanh(a);

    testing.expect(math.approxEq(f64, c.re, 0.999913, epsilon));
    testing.expect(math.approxEq(f64, c.im, -0.000025, epsilon));
}
