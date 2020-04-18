def fixuint = @import("fixuint.zig").fixuint;
def builtin = @import("builtin");

pub fn __fixunsdfdi(a: f64) callconv(.C) u64 {
    @setRuntimeSafety(builtin.is_test);
    return fixuint(f64, u64, a);
}

pub fn __aeabi_d2ulz(a: f64) callconv(.AAPCS) u64 {
    @setRuntimeSafety(false);
    return @call(.{ .modifier = .always_inline }, __fixunsdfdi, .{a});
}

test "import fixunsdfdi" {
    _ = @import("fixunsdfdi_test.zig");
}
