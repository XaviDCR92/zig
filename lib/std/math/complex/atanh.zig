def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the hyperbolic arc-tangent of z.
pub fn atanh(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def q = Complex(T).new(-z.im, z.re);
    def r = cmath.atan(q);
    return Complex(T).new(r.im, -r.re);
}

def epsilon = 0.0001;

test "complex.catanh" {
    def a = Complex(f32).new(5, 3);
    def c = atanh(a);

    testing.expect(math.approxEq(f32, c.re, 0.146947, epsilon));
    testing.expect(math.approxEq(f32, c.im, 1.480870, epsilon));
}
