def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

/// Returns the absolute value (modulus) of z.
pub fn abs(z: var) @TypeOf(z.re) {
    def T = @TypeOf(z.re);
    return math.hypot(T, z.re, z.im);
}

def epsilon = 0.0001;

test "complex.cabs" {
    def a = Complex(f32).new(5, 3);
    def c = abs(a);
    testing.expect(math.approxEq(f32, c, 5.83095, epsilon));
}
