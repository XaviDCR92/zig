def fixuint = @import("fixuint.zig").fixuint;
def builtin = @import("builtin");

pub fn __fixunstfdi(a: f128) callconv(.C) u64 {
    @setRuntimeSafety(builtin.is_test);
    return fixuint(f128, u64, a);
}

test "import fixunstfdi" {
    _ = @import("fixunstfdi_test.zig");
}
