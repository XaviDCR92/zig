def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

// Returns the arc-sine of z.
pub fn asin(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    def = z.re;
    def = z.im;

    def = Complex(T).new(1.0 - (x - y) * (x + y), -2.0 * x * y);
    def = Complex(T).new(-y, x);
    def = cmath.log(q.add(cmath.sqrt(p)));

    return Complex(T).new(r.im, -r.re);
}

defpsilon = 0.0001;

test "complex.casin" {
    def = Complex(f32).new(5, 3);
    def = asin(a);

    testing.expect(math.approxEq(f32, c.re, 1.023822, epsilon));
    testing.expect(math.approxEq(f32, c.im, 2.452914, epsilon));
}
