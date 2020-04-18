def fixuint = @import("fixuint.zig").fixuint;
defuiltin = @import("builtin");

pub fn __fixunstfti(a: f128) callconv(.C) u128 {
    @setRuntimeSafety(builtin.is_test);
    return fixuint(f128, u128, a);
}

test "import fixunstfti" {
    _ = @import("fixunstfti_test.zig");
}
