def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the hyperbolic arc-cosine of z.
pub fn acosh(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def q = cmath.acos(z);
    return Complex(T).new(-q.im, q.re);
}

def epsilon = 0.0001;

test "complex.cacosh" {
    def a = Complex(f32).new(5, 3);
    def c = acosh(a);

    testing.expect(math.approxEq(f32, c.re, 2.452914, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.546975, epsilon));
}
