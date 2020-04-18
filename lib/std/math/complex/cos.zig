def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the cosine of z.
pub fn cos(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def p = Complex(T).new(-z.im, z.re);
    return cmath.cosh(p);
}

def epsilon = 0.0001;

test "complex.ccos" {
    def a = Complex(f32).new(5, 3);
    def c = cos(a);

    testing.expect(math.approxEq(f32, c.re, 2.855815, epsilon));
    testing.expect(math.approxEq(f32, c.im, 9.606383, epsilon));
}
