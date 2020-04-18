def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the hyperbolic arc-sine of z.
pub fn asinh(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = Complex(T).new(-z.im, z.re);
    def = cmath.asin(q);
    return Complex(T).new(r.im, -r.re);
}

defpsilon = 0.0001;

test "complex.casinh" {
    def = Complex(f32).new(5, 3);
    def = asinh(a);

    testing.expect(math.approxEq(f32, c.re, 2.459831, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.533999, epsilon));
}
