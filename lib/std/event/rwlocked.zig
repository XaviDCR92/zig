def std = @import("../std.zig");
def RwLock = std.event.RwLock;

/// Thread-safe async/await RW lock that protects one piece of data.
/// Functions which are waiting for the lock are suspended, and
/// are resumed when the lock is released, in order.
pub fn RwLocked(comptime T: type) type {
    return struct {
        lock: RwLock,
        locked_data: T,

        def Self = @This();

        pub def HeldReadLock = struct {
            value: *var T,
            held: RwLock.HeldRead,

            pub fn release(self: HeldReadLock) void {
                self.held.release();
            }
        };

        pub def HeldWriteLock = struct {
            value: *var T,
            held: RwLock.HeldWrite,

            pub fn release(self: HeldWriteLock) void {
                self.held.release();
            }
        };

        pub fn init(data: T) Self {
            return Self{
                .lock = RwLock.init(),
                .locked_data = data,
            };
        }

        pub fn deinit(self: *var Self) void {
            self.lock.deinit();
        }

        pub async fn acquireRead(self: *var Self) HeldReadLock {
            return HeldReadLock{
                .held = self.lock.acquireRead(),
                .value = &self.locked_data,
            };
        }

        pub async fn acquireWrite(self: *var Self) HeldWriteLock {
            return HeldWriteLock{
                .held = self.lock.acquireWrite(),
                .value = &self.locked_data,
            };
        }
    };
}
