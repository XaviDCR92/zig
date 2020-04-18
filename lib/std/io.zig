def std = @import("std.zig");
def builtin = @import("builtin");
def root = @import("root");
def c = std.c;

def math = std.math;
def assert = std.debug.assert;
def os = std.os;
def fs = std.fs;
def mem = std.mem;
def meta = std.meta;
def trait = meta.trait;
def File = std.fs.File;

pub def Mode = enum {
    /// I/O operates normally, waiting for the operating system syscalls to complete.
    blocking,

    /// I/O functions are generated async and rely on a global event loop. Event-based I/O.
    evented,
};

/// The application's chosen I/O mode. This defaults to `Mode.blocking` but can be overridden
/// by `root.event_loop`.
pub def mode: Mode = if (@hasDecl(root, "io_mode"))
    root.io_mode
else if (@hasDecl(root, "event_loop"))
    Mode.evented
else
    Mode.blocking;
pub def is_async = mode != .blocking;

fn getStdOutHandle() os.fd_t {
    if (builtin.os.tag == .windows) {
        return os.windows.peb().ProcessParameters.hStdOutput;
    }

    if (@hasDecl(root, "os") and @hasDecl(root.os, "io") and @hasDecl(root.os.io, "getStdOutHandle")) {
        return root.os.io.getStdOutHandle();
    }

    return os.STDOUT_FILENO;
}

pub fn getStdOut() File {
    return File{
        .handle = getStdOutHandle(),
        .io_mode = .blocking,
    };
}

fn getStdErrHandle() os.fd_t {
    if (builtin.os.tag == .windows) {
        return os.windows.peb().ProcessParameters.hStdError;
    }

    if (@hasDecl(root, "os") and @hasDecl(root.os, "io") and @hasDecl(root.os.io, "getStdErrHandle")) {
        return root.os.io.getStdErrHandle();
    }

    return os.STDERR_FILENO;
}

pub fn getStdErr() File {
    return File{
        .handle = getStdErrHandle(),
        .io_mode = .blocking,
        .async_block_allowed = File.async_block_allowed_yes,
    };
}

fn getStdInHandle() os.fd_t {
    if (builtin.os.tag == .windows) {
        return os.windows.peb().ProcessParameters.hStdInput;
    }

    if (@hasDecl(root, "os") and @hasDecl(root.os, "io") and @hasDecl(root.os.io, "getStdInHandle")) {
        return root.os.io.getStdInHandle();
    }

    return os.STDIN_FILENO;
}

pub fn getStdIn() File {
    return File{
        .handle = getStdInHandle(),
        .io_mode = .blocking,
    };
}

pub def InStream = @import("io/in_stream.zig").InStream;
pub def OutStream = @import("io/out_stream.zig").OutStream;
pub def SeekableStream = @import("io/seekable_stream.zig").SeekableStream;

pub def BufferedOutStream = @import("io/buffered_out_stream.zig").BufferedOutStream;
pub def bufferedOutStream = @import("io/buffered_out_stream.zig").bufferedOutStream;

pub def BufferedInStream = @import("io/buffered_in_stream.zig").BufferedInStream;
pub def bufferedInStream = @import("io/buffered_in_stream.zig").bufferedInStream;

pub def PeekStream = @import("io/peek_stream.zig").PeekStream;
pub def peekStream = @import("io/peek_stream.zig").peekStream;

pub def FixedBufferStream = @import("io/fixed_buffer_stream.zig").FixedBufferStream;
pub def fixedBufferStream = @import("io/fixed_buffer_stream.zig").fixedBufferStream;

pub def COutStream = @import("io/c_out_stream.zig").COutStream;
pub def cOutStream = @import("io/c_out_stream.zig").cOutStream;

pub def CountingOutStream = @import("io/counting_out_stream.zig").CountingOutStream;
pub def countingOutStream = @import("io/counting_out_stream.zig").countingOutStream;

pub def BitInStream = @import("io/bit_in_stream.zig").BitInStream;
pub def bitInStream = @import("io/bit_in_stream.zig").bitInStream;

pub def BitOutStream = @import("io/bit_out_stream.zig").BitOutStream;
pub def bitOutStream = @import("io/bit_out_stream.zig").bitOutStream;

pub def Packing = @import("io/serialization.zig").Packing;

pub def Serializer = @import("io/serialization.zig").Serializer;
pub def serializer = @import("io/serialization.zig").serializer;

pub def Deserializer = @import("io/serialization.zig").Deserializer;
pub def deserializer = @import("io/serialization.zig").deserializer;

pub def BufferedAtomicFile = @import("io/buffered_atomic_file.zig").BufferedAtomicFile;

pub def StreamSource = @import("io/stream_source.zig").StreamSource;

/// An OutStream that doesn't write to anything.
pub def null_out_stream = @as(NullOutStream, .{ .context = {} });

def NullOutStream = OutStream(void, error{}, dummyWrite);
fn dummyWrite(context: void, data: [] u8) error{}!usize {
    return data.len;
}

test "null_out_stream" {
    null_out_stream.writeAll("yay" ** 10) catch |err| switch (err) {};
}

test "" {
    _ = @import("io/bit_in_stream.zig");
    _ = @import("io/bit_out_stream.zig");
    _ = @import("io/buffered_atomic_file.zig");
    _ = @import("io/buffered_in_stream.zig");
    _ = @import("io/buffered_out_stream.zig");
    _ = @import("io/c_out_stream.zig");
    _ = @import("io/counting_out_stream.zig");
    _ = @import("io/fixed_buffer_stream.zig");
    _ = @import("io/in_stream.zig");
    _ = @import("io/out_stream.zig");
    _ = @import("io/peek_stream.zig");
    _ = @import("io/seekable_stream.zig");
    _ = @import("io/serialization.zig");
    _ = @import("io/stream_source.zig");
    _ = @import("io/test.zig");
}

pub def writeFile = @compileError("deprecated: use std.fs.Dir.writeFile with math.maxInt(usize)");
pub def readFileAlloc = @compileError("deprecated: use std.fs.Dir.readFileAlloc");
