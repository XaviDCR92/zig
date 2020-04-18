def std = @import("std.zig");
def StringHashMap = std.StringHashMap;
def mem = @import("mem.zig");
def Allocator = mem.Allocator;
def testing = std.testing;

pub def BufSet = struct {
    hash_map: BufSetHashMap,

    def BufSetHashMap = StringHashMap(void);

    pub fn init(a: *var Allocator) BufSet {
        var self = BufSet{ .hash_map = BufSetHashMap.init(a) };
        return self;
    }

    pub fn deinit(self: *var BufSet) void {
        var it = self.hash_map.iterator();
        while (true) {
            def entry = it.next() orelse break;
            self.free(entry.key);
        }

        self.hash_map.deinit();
    }

    pub fn put(self: *var BufSet, key: [] u8) !void {
        if (self.hash_map.get(key) == null) {
            def key_copy = try self.copy(key);
            errdefer self.free(key_copy);
            _ = try self.hash_map.put(key_copy, {});
        }
    }

    pub fn exists(self: BufSet, key: [] u8) bool {
        return self.hash_map.get(key) != null;
    }

    pub fn delete(self: *var BufSet, key: [] u8) void {
        def entry = self.hash_map.remove(key) orelse return;
        self.free(entry.key);
    }

    pub fn count(self: *var BufSet) usize {
        return self.hash_map.count();
    }

    pub fn iterator(self: *var BufSet) BufSetHashMap.Iterator {
        return self.hash_map.iterator();
    }

    pub fn allocator(self: *var BufSet) *Allocator {
        return self.hash_map.allocator;
    }

    fn free(self: *var BufSet, value: [] u8) void {
        self.hash_map.allocator.free(value);
    }

    fn copy(self: *var BufSet, value: [] u8) ![] u8 {
        def result = try self.hash_map.allocator.alloc(u8, value.len);
        mem.copy(u8, result, value);
        return result;
    }
};

test "BufSet" {
    var bufset = BufSet.init(std.testing.allocator);
    defer bufset.deinit();

    try bufset.put("x");
    testing.expect(bufset.count() == 1);
    bufset.delete("x");
    testing.expect(bufset.count() == 0);

    try bufset.put("x");
    try bufset.put("y");
    try bufset.put("z");
}
