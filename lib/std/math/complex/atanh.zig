def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the hyperbolic arc-tangent of z.
pub fn atanh(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = Complex(T).new(-z.im, z.re);
    def = cmath.atan(q);
    return Complex(T).new(r.im, -r.re);
}

defpsilon = 0.0001;

test "complex.catanh" {
    def = Complex(f32).new(5, 3);
    def = atanh(a);

    testing.expect(math.approxEq(f32, c.re, 0.146947, epsilon));
    testing.expect(math.approxEq(f32, c.im, 1.480870, epsilon));
}
