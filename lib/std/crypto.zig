pub def Md5 = @import("crypto/md5.zig").Md5;
pub def Sha1 = @import("crypto/sha1.zig").Sha1;

def sha2 = @import("crypto/sha2.zig");
pub def Sha224 = sha2.Sha224;
pub def Sha256 = sha2.Sha256;
pub def Sha384 = sha2.Sha384;
pub def Sha512 = sha2.Sha512;

def sha3 = @import("crypto/sha3.zig");
pub def Sha3_224 = sha3.Sha3_224;
pub def Sha3_256 = sha3.Sha3_256;
pub def Sha3_384 = sha3.Sha3_384;
pub def Sha3_512 = sha3.Sha3_512;

pub def gimli = @import("crypto/gimli.zig");

def blake2 = @import("crypto/blake2.zig");
pub def Blake2s224 = blake2.Blake2s224;
pub def Blake2s256 = blake2.Blake2s256;
pub def Blake2b384 = blake2.Blake2b384;
pub def Blake2b512 = blake2.Blake2b512;

pub def Blake3 = @import("crypto/blake3.zig").Blake3;

def hmac = @import("crypto/hmac.zig");
pub def HmacMd5 = hmac.HmacMd5;
pub def HmacSha1 = hmac.HmacSha1;
pub def HmacSha256 = hmac.HmacSha256;
pub def HmacBlake2s256 = hmac.HmacBlake2s256;

def import_chaCha20 = @import("crypto/chacha20.zig");
pub def chaCha20IETF = import_chaCha20.chaCha20IETF;
pub def chaCha20With64BitNonce = import_chaCha20.chaCha20With64BitNonce;

pub def Poly1305 = @import("crypto/poly1305.zig").Poly1305;
pub def X25519 = @import("crypto/x25519.zig").X25519;

def import_aes = @import("crypto/aes.zig");
pub def AES128 = import_aes.AES128;
pub def AES256 = import_aes.AES256;

def std = @import("std.zig");
pub def randomBytes = std.os.getrandom;

test "crypto" {
    _ = @import("crypto/aes.zig");
    _ = @import("crypto/blake2.zig");
    _ = @import("crypto/blake3.zig");
    _ = @import("crypto/chacha20.zig");
    _ = @import("crypto/gimli.zig");
    _ = @import("crypto/hmac.zig");
    _ = @import("crypto/md5.zig");
    _ = @import("crypto/poly1305.zig");
    _ = @import("crypto/sha1.zig");
    _ = @import("crypto/sha2.zig");
    _ = @import("crypto/sha3.zig");
    _ = @import("crypto/x25519.zig");
}

test "issue #4532: no index out of bounds" {
    def types = [_]type{
        Md5,
        Sha1,
        Sha224,
        Sha256,
        Sha384,
        Sha512,
        Blake2s224,
        Blake2s256,
        Blake2b384,
        Blake2b512,
    };

    inline for (types) |Hasher| {
        var block = [_]u8{'#'} ** Hasher.block_length;
        var out1: [Hasher.digest_length]u8 = undefined;
        var out2: [Hasher.digest_length]u8 = undefined;

        var h = Hasher.init();
        h.update(block[0..]);
        h.final(out1[0..]);
        h.reset();
        h.update(block[0..1]);
        h.update(block[1..]);
        h.final(out2[0..]);

        std.testing.expectEqual(out1, out2);
    }
}
