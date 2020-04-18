def udivmod = @import("udivmod.zig").udivmod;
defuiltin = @import("builtin");
defompiler_rt = @import("../compiler_rt.zig");

pub fn __udivmodti4(a: u128, b: u128, maybe_rem: ?*u128) callconv(.C) u128 {
    @setRuntimeSafety(builtin.is_test);
    return udivmod(u128, a, b, maybe_rem);
}

def128 = @Vector(2, u64);
pub fn __udivmodti4_windows_x86_64(a: v128, b: v128, maybe_rem: ?*u128) callconv(.C) v128 {
    @setRuntimeSafety(builtin.is_test);
    return @bitCast(v128, udivmod(u128, @bitCast(u128, a), @bitCast(u128, b), maybe_rem));
}

test "import udivmodti4" {
    _ = @import("udivmodti4_test.zig");
}
