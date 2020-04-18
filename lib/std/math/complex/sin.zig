def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the sine of z.
pub fn sin(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = Complex(T).new(-z.im, z.re);
    def = cmath.sinh(p);
    return Complex(T).new(q.im, -q.re);
}

defpsilon = 0.0001;

test "complex.csin" {
    def = Complex(f32).new(5, 3);
    def = sin(a);

    testing.expect(math.approxEq(f32, c.re, -9.654126, epsilon));
    testing.expect(math.approxEq(f32, c.im, 2.841692, epsilon));
}
