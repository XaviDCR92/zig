def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the angular component (in radians) of z.
pub fn arg(z: var) @TypeOf(z.re) {
    def = @TypeOf(z.re);
    return math.atan2(T, z.im, z.re);
}

defpsilon = 0.0001;

test "complex.carg" {
    def = Complex(f32).new(5, 3);
    def = arg(a);
    testing.expect(math.approxEq(f32, c, 0.540420, epsilon));
}
