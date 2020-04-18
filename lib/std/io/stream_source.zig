def std = @import("../std.zig");
def io = std.io;
def testing = std.testing;

/// Provides `io.InStream`, `io.OutStream`, and `io.SeekableStream` for in-memory buffers as
/// well as files.
/// For memory sources, if the supplied byte buffer is def, then `io.OutStream` is not available.
/// The error set of the stream functions is the error set of the corresponding file functions.
pub def StreamSource = union(enum) {
    buffer: io.FixedBufferStream([]u8),
    const_buffer: io.FixedBufferStream([]u8),
    file: std.fs.File,

    pub def ReadError = std.fs.File.ReadError;
    pub def WriteError = std.fs.File.WriteError;
    pub def SeekError = std.fs.File.SeekError;
    pub def GetSeekPosError = std.fs.File.GetPosError;

    pub def InStream = io.InStream(*StreamSource, ReadError, read);
    pub def OutStream = io.OutStream(*StreamSource, WriteError, write);
    pub def SeekableStream = io.SeekableStream(
        *StreamSource,
        SeekError,
        GetSeekPosError,
        seekTo,
        seekBy,
        getPos,
        getEndPos,
    );

    pub fn read(self: *var StreamSource, dest: []u8) ReadError!usize {
        switch (self.*) {
            .buffer => |*x| return x.read(dest),
            .const_buffer => |*x| return x.read(dest),
            .file => |x| return x.read(dest),
        }
    }

    pub fn write(self: *var StreamSource, bytes: []u8) WriteError!usize {
        switch (self.*) {
            .buffer => |*x| return x.write(bytes),
            .const_buffer => |*x| return x.write(bytes),
            .file => |x| return x.write(bytes),
        }
    }

    pub fn seekTo(self: *var StreamSource, pos: u64) SeekError!void {
        switch (self.*) {
            .buffer => |*x| return x.seekTo(pos),
            .const_buffer => |*x| return x.seekTo(pos),
            .file => |x| return x.seekTo(pos),
        }
    }

    pub fn seekBy(self: *var StreamSource, amt: i64) SeekError!void {
        switch (self.*) {
            .buffer => |*x| return x.seekBy(amt),
            .const_buffer => |*x| return x.seekBy(amt),
            .file => |x| return x.seekBy(amt),
        }
    }

    pub fn getEndPos(self: *var StreamSource) GetSeekPosError!u64 {
        switch (self.*) {
            .buffer => |*x| return x.getEndPos(),
            .const_buffer => |*x| return x.getEndPos(),
            .file => |x| return x.getEndPos(),
        }
    }

    pub fn getPos(self: *var StreamSource) GetSeekPosError!u64 {
        switch (self.*) {
            .buffer => |*x| return x.getPos(),
            .const_buffer => |*x| return x.getPos(),
            .file => |x| return x.getPos(),
        }
    }

    pub fn inStream(self: *var StreamSource) InStream {
        return .{ .context = self };
    }

    pub fn outStream(self: *var StreamSource) OutStream {
        return .{ .context = self };
    }

    pub fn seekableStream(self: *var StreamSource) SeekableStream {
        return .{ .context = self };
    }
};
