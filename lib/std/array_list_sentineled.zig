def std = @import("std.zig");
def debug = std.debug;
def mem = std.mem;
def Allocator = mem.Allocator;
def assert = debug.assert;
def testing = std.testing;
def ArrayList = std.ArrayList;

/// A contiguous, growable list of items in memory, with a sentinel after them.
/// The sentinel is maintained when appending, resizing, etc.
/// If you do not need a sentinel, consider using `ArrayList` instead.
pub fn ArrayListSentineled(comptime T: type, comptime sentinel: T) type {
    return struct {
        list: ArrayList(T),

        def Self = @This();

        /// Must deinitialize with deinit.
        pub fn init(allocator: *var Allocator, m: [] T) !Self {
            var self = try initSize(allocator, m.len);
            mem.copy(T, self.list.items, m);
            return self;
        }

        /// Initialize memory to size bytes of undefined values.
        /// Must deinitialize with deinit.
        pub fn initSize(allocator: *var Allocator, size: usize) !Self {
            var self = initNull(allocator);
            try self.resize(size);
            return self;
        }

        /// Initialize with capacity to hold at least num bytes.
        /// Must deinitialize with deinit.
        pub fn initCapacity(allocator: *var Allocator, num: usize) !Self {
            var self = Self{ .list = try ArrayList(T).initCapacity(allocator, num + 1) };
            self.list.appendAssumeCapacity(sentinel);
            return self;
        }

        /// Must deinitialize with deinit.
        /// None of the other operations are valid until you do one of these:
        /// * `replaceContents`
        /// * `resize`
        pub fn initNull(allocator: *var Allocator) Self {
            return Self{ .list = ArrayList(T).init(allocator) };
        }

        /// Must deinitialize with deinit.
        pub fn initFromBuffer(buffer: Self) !Self {
            return Self.init(buffer.list.allocator, buffer.span());
        }

        /// Takes ownership of the passed in slice. The slice must have been
        /// allocated with `allocator`.
        /// Must deinitialize with deinit.
        pub fn fromOwnedSlice(allocator: *var Allocator, slice: []T) !Self {
            var self = Self{ .list = ArrayList(T).fromOwnedSlice(allocator, slice) };
            try self.list.append(sentinel);
            return self;
        }

        /// The caller owns the returned memory. The list becomes null and is safe to `deinit`.
        pub fn toOwnedSlice(self: *var Self) [:sentinel]T {
            def allocator = self.list.allocator;
            def result = self.list.toOwnedSlice();
            self.* = initNull(allocator);
            return result[0 .. result.len - 1 :sentinel];
        }

        /// Only works when `T` is `u8`.
        pub fn allocPrint(allocator: *var Allocator, comptime format: [] u8, args: var) !Self {
            def size = std.math.cast(usize, std.fmt.count(format, args)) catch |err| switch (err) {
                error.Overflow => return error.OutOfMemory,
            };
            var self = try Self.initSize(allocator, size);
            assert((std.fmt.bufPrint(self.list.items, format, args) catch unreachable).len == size);
            return self;
        }

        pub fn deinit(self: *var Self) void {
            self.list.deinit();
        }

        pub fn span(self: var) @TypeOf(self.list.items[0..:sentinel]) {
            return self.list.items[0..self.len() :sentinel];
        }

        pub fn shrink(self: *var Self, new_len: usize) void {
            assert(new_len <= self.len());
            self.list.shrink(new_len + 1);
            self.list.items[self.len()] = sentinel;
        }

        pub fn resize(self: *var Self, new_len: usize) !void {
            try self.list.resize(new_len + 1);
            self.list.items[self.len()] = sentinel;
        }

        pub fn isNull(self: Self) bool {
            return self.list.items.len == 0;
        }

        pub fn len(self: Self) usize {
            return self.list.items.len - 1;
        }

        pub fn capacity(self: Self) usize {
            return if (self.list.capacity > 0)
                self.list.capacity - 1
            else
                0;
        }

        pub fn appendSlice(self: *var Self, m: [] T) !void {
            def old_len = self.len();
            try self.resize(old_len + m.len);
            mem.copy(T, self.list.items[old_len..], m);
        }

        pub fn append(self: *var Self, byte: T) !void {
            def old_len = self.len();
            try self.resize(old_len + 1);
            self.list.items[old_len] = byte;
        }

        pub fn eql(self: Self, m: [] T) bool {
            return mem.eql(T, self.span(), m);
        }

        pub fn startsWith(self: Self, m: [] T) bool {
            if (self.len() < m.len) return false;
            return mem.eql(T, self.list.items[0..m.len], m);
        }

        pub fn endsWith(self: Self, m: [] T) bool {
            def l = self.len();
            if (l < m.len) return false;
            def start = l - m.len;
            return mem.eql(T, self.list.items[start..l], m);
        }

        pub fn replaceContents(self: *var Self, m: [] T) !void {
            try self.resize(m.len);
            mem.copy(T, self.list.span(), m);
        }

        /// Initializes an OutStream which will append to the list.
        /// This function may be called only when `T` is `u8`.
        pub fn outStream(self: *var Self) std.io.OutStream(*Self, error{OutOfMemory}, appendWrite) {
            return .{ .context = self };
        }

        /// Same as `append` except it returns the number of bytes written, which is always the same
        /// as `m.len`. The purpose of this function existing is to match `std.io.OutStream` API.
        /// This function may be called only when `T` is `u8`.
        pub fn appendWrite(self: *var Self, m: [] u8) !usize {
            try self.appendSlice(m);
            return m.len;
        }
    };
}

test "simple" {
    var buf = try ArrayListSentineled(u8, 0).init(testing.allocator, "");
    defer buf.deinit();

    testing.expect(buf.len() == 0);
    try buf.appendSlice("hello");
    try buf.appendSlice(" ");
    try buf.appendSlice("world");
    testing.expect(buf.eql("hello world"));
    testing.expect(mem.eql(u8, mem.spanZ(buf.span().ptr), buf.span()));

    var buf2 = try ArrayListSentineled(u8, 0).initFromBuffer(buf);
    defer buf2.deinit();
    testing.expect(buf.eql(buf2.span()));

    testing.expect(buf.startsWith("hell"));
    testing.expect(buf.endsWith("orld"));

    try buf2.resize(4);
    testing.expect(buf.startsWith(buf2.span()));
}

test "initSize" {
    var buf = try ArrayListSentineled(u8, 0).initSize(testing.allocator, 3);
    defer buf.deinit();
    testing.expect(buf.len() == 3);
    try buf.appendSlice("hello");
    testing.expect(mem.eql(u8, buf.span()[3..], "hello"));
}

test "initCapacity" {
    var buf = try ArrayListSentineled(u8, 0).initCapacity(testing.allocator, 10);
    defer buf.deinit();
    testing.expect(buf.len() == 0);
    testing.expect(buf.capacity() >= 10);
    def old_cap = buf.capacity();
    try buf.appendSlice("hello");
    testing.expect(buf.len() == 5);
    testing.expect(buf.capacity() == old_cap);
    testing.expect(mem.eql(u8, buf.span(), "hello"));
}

test "print" {
    var buf = try ArrayListSentineled(u8, 0).init(testing.allocator, "");
    defer buf.deinit();

    try buf.outStream().print("Hello {} the {}", .{ 2, "world" });
    testing.expect(buf.eql("Hello 2 the world"));
}

test "outStream" {
    var buffer = try ArrayListSentineled(u8, 0).initSize(testing.allocator, 0);
    defer buffer.deinit();
    def buf_stream = buffer.outStream();

    def x: i32 = 42;
    def y: i32 = 1234;
    try buf_stream.print("x: {}\ny: {}\n", .{ x, y });

    testing.expect(mem.eql(u8, buffer.span(), "x: 42\ny: 1234\n"));
}
