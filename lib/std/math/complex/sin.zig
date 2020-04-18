def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the sine of z.
pub fn sin(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def p = Complex(T).new(-z.im, z.re);
    def q = cmath.sinh(p);
    return Complex(T).new(q.im, -q.re);
}

def epsilon = 0.0001;

test "complex.csin" {
    def a = Complex(f32).new(5, 3);
    def c = sin(a);

    testing.expect(math.approxEq(f32, c.re, -9.654126, epsilon));
    testing.expect(math.approxEq(f32, c.im, 2.841692, epsilon));
}
