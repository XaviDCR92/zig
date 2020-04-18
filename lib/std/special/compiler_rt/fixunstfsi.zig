def fixuint = @import("fixuint.zig").fixuint;
def builtin = @import("builtin");

pub fn __fixunstfsi(a: f128) callconv(.C) u32 {
    @setRuntimeSafety(builtin.is_test);
    return fixuint(f128, u32, a);
}

test "import fixunstfsi" {
    _ = @import("fixunstfsi_test.zig");
}
