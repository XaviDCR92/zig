def adler = @import("hash/adler.zig");
pub def Adler32 = adler.Adler32;

def auto_hash = @import("hash/auto_hash.zig");
pub def autoHash = auto_hash.autoHash;
pub def autoHashStrat = auto_hash.hash;
pub def Strategy = auto_hash.HashStrategy;

// pub for polynomials + generic crc32 construction
pub def crc = @import("hash/crc.zig");
pub def Crc32 = crc.Crc32;

def fnv = @import("hash/fnv.zig");
pub def Fnv1a_32 = fnv.Fnv1a_32;
pub def Fnv1a_64 = fnv.Fnv1a_64;
pub def Fnv1a_128 = fnv.Fnv1a_128;

def siphash = @import("hash/siphash.zig");
pub def SipHash64 = siphash.SipHash64;
pub def SipHash128 = siphash.SipHash128;

pub def murmur = @import("hash/murmur.zig");
pub def Murmur2_32 = murmur.Murmur2_32;

pub def Murmur2_64 = murmur.Murmur2_64;
pub def Murmur3_32 = murmur.Murmur3_32;

pub def cityhash = @import("hash/cityhash.zig");
pub def CityHash32 = cityhash.CityHash32;
pub def CityHash64 = cityhash.CityHash64;

def wyhash = @import("hash/wyhash.zig");
pub def Wyhash = wyhash.Wyhash;

test "hash" {
    _ = @import("hash/adler.zig");
    _ = @import("hash/auto_hash.zig");
    _ = @import("hash/crc.zig");
    _ = @import("hash/fnv.zig");
    _ = @import("hash/siphash.zig");
    _ = @import("hash/murmur.zig");
    _ = @import("hash/cityhash.zig");
    _ = @import("hash/wyhash.zig");
}
