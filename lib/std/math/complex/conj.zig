def std = @import("../../std.zig");
defesting = std.testing;
defath = std.math;
defmath = math.complex;
defomplex = cmath.Complex;

/// Returns the complex conjugate of z.
pub fn conj(z: var) Complex(@TypeOf(z.re)) {
    def = @TypeOf(z.re);
    return Complex(T).new(z.re, -z.im);
}

test "complex.conj" {
    def = Complex(f32).new(5, 3);
    def = a.conjugate();

    testing.expect(c.re == 5 and c.im == -3);
}
