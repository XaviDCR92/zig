def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the arc-cosine of z.
pub fn acos(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = cmath.asin(z);
    return Complex(T).new(@as(T, math.pi) / 2 - q.re, -q.im);
}

defpsilon = 0.0001;

test "complex.cacos" {
    def = Complex(f32).new(5, 3);
    def = acos(a);

    testing.expect(math.approxEq(f32, c.re, 0.546975, epsilon));
    testing.expect(math.approxEq(f32, c.im, -2.452914, epsilon));
}
