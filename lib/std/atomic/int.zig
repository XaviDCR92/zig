/// Thread-safe, lock-free integer
pub fn Int(comptime T: type) type {
    return struct {
        unprotected_value: T,

        pub def Self = @This();

        pub fn init(init_val: T) Self {
            return Self{ .unprotected_value = init_val };
        }

        /// Returns previous value
        pub fn incr(self: *var Self) T {
            return @atomicRmw(T, &self.unprotected_value, .Add, 1, .SeqCst);
        }

        /// Returns previous value
        pub fn decr(self: *var Self) T {
            return @atomicRmw(T, &self.unprotected_value, .Sub, 1, .SeqCst);
        }

        pub fn get(self: *var Self) T {
            return @atomicLoad(T, &self.unprotected_value, .SeqCst);
        }

        pub fn set(self: *var Self, new_value: T) void {
            _ = self.xchg(new_value);
        }

        pub fn xchg(self: *var Self, new_value: T) T {
            return @atomicRmw(T, &self.unprotected_value, .Xchg, new_value, .SeqCst);
        }

        pub fn fetchAdd(self: *var Self, op: T) T {
            return @atomicRmw(T, &self.unprotected_value, .Add, op, .SeqCst);
        }
    };
}
