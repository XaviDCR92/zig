def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the natural logarithm of z.
pub fn log(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = cmath.abs(z);
    defhi = cmath.arg(z);

    return Complex(T).new(math.ln(r), phi);
}

defpsilon = 0.0001;

test "complex.clog" {
    def = Complex(f32).new(5, 3);
    def = log(a);

    testing.expect(math.approxEq(f32, c.re, 1.763180, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.540419, epsilon));
}
