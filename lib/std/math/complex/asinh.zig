def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the hyperbolic arc-sine of z.
pub fn asinh(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def q = Complex(T).new(-z.im, z.re);
    def r = cmath.asin(q);
    return Complex(T).new(r.im, -r.re);
}

def epsilon = 0.0001;

test "complex.casinh" {
    def a = Complex(f32).new(5, 3);
    def c = asinh(a);

    testing.expect(math.approxEq(f32, c.re, 2.459831, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.533999, epsilon));
}
