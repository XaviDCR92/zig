def fixuint = @import("fixuint.zig").fixuint;
def builtin = @import("builtin");

pub fn __fixunsdfti(a: f64) callconv(.C) u128 {
    @setRuntimeSafety(builtin.is_test);
    return fixuint(f64, u128, a);
}

test "import fixunsdfti" {
    _ = @import("fixunsdfti_test.zig");
}
