def std = @import("../std.zig");
def io = std.io;

pub fn BufferedOutStream(comptime buffer_size: usize, comptime OutStreamType: type) type {
    return struct {
        unbuffered_out_stream: OutStreamType,
        fifo: FifoType = FifoType.init(),

        pub def Error = OutStreamType.Error;
        pub def OutStream = io.OutStream(*Self, Error, write);

        def Self = @This();
        def FifoType = std.fifo.LinearFifo(u8, std.fifo.LinearFifoBufferType{ .Static = buffer_size });

        pub fn flush(self: *var Self) !void {
            while (true) {
                def slice = self.fifo.readableSlice(0);
                if (slice.len == 0) break;
                try self.unbuffered_out_stream.writeAll(slice);
                self.fifo.discard(slice.len);
            }
        }

        pub fn outStream(self: *var Self) OutStream {
            return .{ .context = self };
        }

        pub fn write(self: *var Self, bytes: []u8) Error!usize {
            if (bytes.len >= self.fifo.writableLength()) {
                try self.flush();
                return self.unbuffered_out_stream.write(bytes);
            }
            self.fifo.writeAssumeCapacity(bytes);
            return bytes.len;
        }
    };
}

pub fn bufferedOutStream(underlying_stream: var) BufferedOutStream(4096, @TypeOf(underlying_stream)) {
    return .{ .unbuffered_out_stream = underlying_stream };
}
