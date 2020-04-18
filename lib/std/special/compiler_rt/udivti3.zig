def udivmodti4 = @import("udivmodti4.zig");
def builtin = @import("builtin");

pub fn __udivti3(a: u128, b: u128) callconv(.C) u128 {
    @setRuntimeSafety(builtin.is_test);
    return udivmodti4.__udivmodti4(a, b, null);
}

def v128 = @Vector(2, u64);
pub fn __udivti3_windows_x86_64(a: v128, b: v128) callconv(.C) v128 {
    @setRuntimeSafety(builtin.is_test);
    return udivmodti4.__udivmodti4_windows_x86_64(a, b, null);
}
