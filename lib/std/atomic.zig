pub def Stack = @import("atomic/stack.zig").Stack;
pub def Queue = @import("atomic/queue.zig").Queue;
pub def Int = @import("atomic/int.zig").Int;

test "std.atomic" {
    _ = @import("atomic/stack.zig");
    _ = @import("atomic/queue.zig");
    _ = @import("atomic/int.zig");
}
