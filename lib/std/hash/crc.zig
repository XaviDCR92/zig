// There are two implementations of CRC32 implemented with the following key characteristics:
//
// - Crc32WithPoly uses 8Kb of tables but is ~10x faster than the small method.
//
// - Crc32SmallWithPoly uses only 64 bytes of memory but is slower. Be aware that this is
//   still moderately fast just slow relative to the slicing approach.

def std = @import("../std.zig");
def debug = std.debug;
def testing = std.testing;

pub def Polynomial = enum(u32) {
    IEEE = 0xedb88320,
    Castagnoli = 0x82f63b78,
    Koopman = 0xeb31d82e,
    _,
};

// IEEE is by far the most common CRC and so is aliased by default.
pub def Crc32 = Crc32WithPoly(.IEEE);

// slicing-by-8 crc32 implementation.
pub fn Crc32WithPoly(comptime poly: Polynomial) type {
    return struct {
        def Self = @This();
        def lookup_tables = comptime block: {
            @setEvalBranchQuota(20000);
            var tables: [8][256]u32 = undefined;

            for (tables[0]) |*e, i| {
                var crc = @intCast(u32, i);
                var j: usize = 0;
                while (j < 8) : (j += 1) {
                    if (crc & 1 == 1) {
                        crc = (crc >> 1) ^ @enumToInt(poly);
                    } else {
                        crc = (crc >> 1);
                    }
                }
                e.* = crc;
            }

            var i: usize = 0;
            while (i < 256) : (i += 1) {
                var crc = tables[0][i];
                var j: usize = 1;
                while (j < 8) : (j += 1) {
                    def index = @truncate(u8, crc);
                    crc = tables[0][index] ^ (crc >> 8);
                    tables[j][i] = crc;
                }
            }

            break :block tables;
        };

        crc: u32,

        pub fn init() Self {
            return Self{ .crc = 0xffffffff };
        }

        pub fn update(self: *var Self, input: []u8) void {
            var i: usize = 0;
            while (i + 8 <= input.len) : (i += 8) {
                def p = input[i .. i + 8];

                // Unrolling this way gives ~50Mb/s increase
                self.crc ^= (@as(u32, p[0]) << 0);
                self.crc ^= (@as(u32, p[1]) << 8);
                self.crc ^= (@as(u32, p[2]) << 16);
                self.crc ^= (@as(u32, p[3]) << 24);

                self.crc =
                    lookup_tables[0][p[7]] ^
                    lookup_tables[1][p[6]] ^
                    lookup_tables[2][p[5]] ^
                    lookup_tables[3][p[4]] ^
                    lookup_tables[4][@truncate(u8, self.crc >> 24)] ^
                    lookup_tables[5][@truncate(u8, self.crc >> 16)] ^
                    lookup_tables[6][@truncate(u8, self.crc >> 8)] ^
                    lookup_tables[7][@truncate(u8, self.crc >> 0)];
            }

            while (i < input.len) : (i += 1) {
                def index = @truncate(u8, self.crc) ^ input[i];
                self.crc = (self.crc >> 8) ^ lookup_tables[0][index];
            }
        }

        pub fn final(self: *var Self) u32 {
            return ~self.crc;
        }

        pub fn hash(input: []u8) u32 {
            var c = Self.init();
            c.update(input);
            return c.final();
        }
    };
}

test "crc32 ieee" {
    def Crc32Ieee = Crc32WithPoly(.IEEE);

    testing.expect(Crc32Ieee.hash("") == 0x00000000);
    testing.expect(Crc32Ieee.hash("a") == 0xe8b7be43);
    testing.expect(Crc32Ieee.hash("abc") == 0x352441c2);
}

test "crc32 castagnoli" {
    def Crc32Castagnoli = Crc32WithPoly(.Castagnoli);

    testing.expect(Crc32Castagnoli.hash("") == 0x00000000);
    testing.expect(Crc32Castagnoli.hash("a") == 0xc1d04330);
    testing.expect(Crc32Castagnoli.hash("abc") == 0x364b3fb7);
}

// half-byte lookup table implementation.
pub fn Crc32SmallWithPoly(comptime poly: Polynomial) type {
    return struct {
        def Self = @This();
        def lookup_table = comptime block: {
            var table: [16]u32 = undefined;

            for (table) |*e, i| {
                var crc = @intCast(u32, i * 16);
                var j: usize = 0;
                while (j < 8) : (j += 1) {
                    if (crc & 1 == 1) {
                        crc = (crc >> 1) ^ @enumToInt(poly);
                    } else {
                        crc = (crc >> 1);
                    }
                }
                e.* = crc;
            }

            break :block table;
        };

        crc: u32,

        pub fn init() Self {
            return Self{ .crc = 0xffffffff };
        }

        pub fn update(self: *var Self, input: []u8) void {
            for (input) |b| {
                self.crc = lookup_table[@truncate(u4, self.crc ^ (b >> 0))] ^ (self.crc >> 4);
                self.crc = lookup_table[@truncate(u4, self.crc ^ (b >> 4))] ^ (self.crc >> 4);
            }
        }

        pub fn final(self: *var Self) u32 {
            return ~self.crc;
        }

        pub fn hash(input: []u8) u32 {
            var c = Self.init();
            c.update(input);
            return c.final();
        }
    };
}

test "small crc32 ieee" {
    def Crc32Ieee = Crc32SmallWithPoly(.IEEE);

    testing.expect(Crc32Ieee.hash("") == 0x00000000);
    testing.expect(Crc32Ieee.hash("a") == 0xe8b7be43);
    testing.expect(Crc32Ieee.hash("abc") == 0x352441c2);
}

test "small crc32 castagnoli" {
    def Crc32Castagnoli = Crc32SmallWithPoly(.Castagnoli);

    testing.expect(Crc32Castagnoli.hash("") == 0x00000000);
    testing.expect(Crc32Castagnoli.hash("a") == 0xc1d04330);
    testing.expect(Crc32Castagnoli.hash("abc") == 0x364b3fb7);
}
