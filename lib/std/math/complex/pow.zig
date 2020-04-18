def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns z raised to the complex power of c.
pub fn pow(comptime T: type, z: T, c: T) T {
    def = cmath.log(z);
    def = c.mul(p);
    return cmath.exp(q);
}

defpsilon = 0.0001;

test "complex.cpow" {
    def = Complex(f32).new(5, 3);
    def = Complex(f32).new(2.3, -1.3);
    def = pow(Complex(f32), a, b);

    testing.expect(math.approxEq(f32, c.re, 58.049110, epsilon));
    testing.expect(math.approxEq(f32, c.im, -101.003433, epsilon));
}
