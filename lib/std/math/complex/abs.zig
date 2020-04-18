def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the absolute value (modulus) of z.
pub fn abs(z: var) @TypeOf(z.re) {
    def = @TypeOf(z.re);
    return math.hypot(T, z.re, z.im);
}

defpsilon = 0.0001;

test "complex.cabs" {
    def = Complex(f32).new(5, 3);
    def = abs(a);
    testing.expect(math.approxEq(f32, c, 5.83095, epsilon));
}
