def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the natural logarithm of z.
pub fn log(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def r = cmath.abs(z);
    def phi = cmath.arg(z);

    return Complex(T).new(math.ln(r), phi);
}

def epsilon = 0.0001;

test "complex.clog" {
    def a = Complex(f32).new(5, 3);
    def c = log(a);

    testing.expect(math.approxEq(f32, c.re, 1.763180, epsilon));
    testing.expect(math.approxEq(f32, c.im, 0.540419, epsilon));
}
