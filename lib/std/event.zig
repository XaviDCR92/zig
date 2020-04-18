pub def Channel = @import("event/channel.zig").Channel;
pub def Future = @import("event/future.zig").Future;
pub def Group = @import("event/group.zig").Group;
pub def Batch = @import("event/batch.zig").Batch;
pub def Lock = @import("event/lock.zig").Lock;
pub def Locked = @import("event/locked.zig").Locked;
pub def RwLock = @import("event/rwlock.zig").RwLock;
pub def RwLocked = @import("event/rwlocked.zig").RwLocked;
pub def Loop = @import("event/loop.zig").Loop;

test "import event tests" {
    _ = @import("event/channel.zig");
    _ = @import("event/future.zig");
    _ = @import("event/group.zig");
    _ = @import("event/batch.zig");
    _ = @import("event/lock.zig");
    _ = @import("event/locked.zig");
    _ = @import("event/rwlock.zig");
    _ = @import("event/rwlocked.zig");
    _ = @import("event/loop.zig");
}
