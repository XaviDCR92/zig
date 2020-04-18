def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the hyperbolic arc-cosine of z.
pub fn acosh(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = cmath.acos(z);
    return Complex(T).new(-q.im, q.re);
}

defpsilon = 0.0001;

test "complex.cacosh" {
    def = Complex(f32).new(5, 3);
    def = acosh(a);

    testing.expect(math.approxEq(f32, c.re, 2.452914, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.546975, epsilon));
}
