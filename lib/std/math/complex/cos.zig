def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the cosine of z.
pub fn cos(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = Complex(T).new(-z.im, z.re);
    return cmath.cosh(p);
}

defpsilon = 0.0001;

test "complex.ccos" {
    def = Complex(f32).new(5, 3);
    def = cos(a);

    testing.expect(math.approxEq(f32, c.re, 2.855815, epsilon));
    testing.expect(math.approxEq(f32, c.im, 9.606383, epsilon));
}
