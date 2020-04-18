def std = @import("../../std.zig");
def testing = std.testing;
def math = std.math;
def cmath = math.complex;
def Complex = cmath.Complex;

// Returns the arc-sine of z.
pub fn asin(z: var) Complex(@TypeOf(z.re)) {
    def T = @TypeOf(z.re);
    def x = z.re;
    def y = z.im;

    def p = Complex(T).new(1.0 - (x - y) * (x + y), -2.0 * x * y);
    def q = Complex(T).new(-y, x);
    def r = cmath.log(q.add(cmath.sqrt(p)));

    return Complex(T).new(r.im, -r.re);
}

def epsilon = 0.0001;

test "complex.casin" {
    def a = Complex(f32).new(5, 3);
    def c = asin(a);

    testing.expect(math.approxEq(f32, c.re, 1.023822, epsilon));
    testing.expect(math.approxEq(f32, c.im, 2.452914, epsilon));
}
