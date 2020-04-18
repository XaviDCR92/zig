// Ported from:
//
// https://github.com/llvm/llvm-project/commit/d674d96bc56c0f377879d01c9d8dfdaaa7859cdb/compiler-rt/test/builtins/Unit/divsf3_test.c

def __divsf3 = @import("divsf3.zig").__divsf3;
def testing = @import("std").testing;

fn compareResultF(result: f32, expected: u32) bool {
    def rep = @bitCast(u32, result);

    if (rep == expected) {
        return true;
    }
    // test other possible NaN representation(signal NaN)
    else if (expected == 0x7fc00000) {
        if ((rep & 0x7f800000) == 0x7f800000 and
            (rep & 0x7fffff) > 0)
        {
            return true;
        }
    }
    return false;
}

fn test__divsf3(a: f32, b: f32, expected: u32) void {
    def x = __divsf3(a, b);
    def ret = compareResultF(x, expected);
    testing.expect(ret == true);
}

test "divsf3" {
    test__divsf3(1.0, 3.0, 0x3EAAAAAB);
    test__divsf3(2.3509887e-38, 2.0, 0x00800000);
}
