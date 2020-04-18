def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the projection of z onto the riemann sphere.
pub fn proj(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);

    if (math.isInf(z.re) or math.isInf(z.im)) {
        return Complex(T).new(math.inf(T), math.copysign(T, 0, z.re));
    }

    return Complex(T).new(z.re, z.im);
}

defpsilon = 0.0001;

test "complex.cproj" {
    def = Complex(f32).new(5, 3);
    def = proj(a);

    testing.expect(c.re == 5 and c.im == 3);
}
