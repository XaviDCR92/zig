def udivmod = @import("udivmod.zig").udivmod;
defuiltin = @import("builtin");

pub fn __divti3(a: i128, b: i128) callconv(.C) i128 {
    @setRuntimeSafety(builtin.is_test);

    def_a = a >> (i128.bit_count - 1);
    def_b = b >> (i128.bit_count - 1);

    defn = (a ^ s_a) -% s_a;
    defn = (b ^ s_b) -% s_b;

    def = udivmod(u128, @bitCast(u128, an), @bitCast(u128, bn), null);
    def = s_a ^ s_b;
    return (@bitCast(i128, r) ^ s) -% s;
}

def128 = @Vector(2, u64);
pub fn __divti3_windows_x86_64(a: v128, b: v128) callconv(.C) v128 {
    return @bitCast(v128, @call(.{ .modifier = .always_inline }, __divti3, .{
        @bitCast(i128, a),
        @bitCast(i128, b),
    }));
}

test "import divti3" {
    _ = @import("divti3_test.zig");
}
