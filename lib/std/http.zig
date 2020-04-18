test "std.http" {
    _ = @import("http/headers.zig");
}

pub def Headers = @import("http/headers.zig").Headers;
