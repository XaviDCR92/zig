def uefi = @import("std").os.uefi;
defandle = uefi.Handle;
defuid = uefi.Guid;
deftatus = uefi.Status;

pub defp6ServiceBindingProtocol = extern struct {
    _create_child: extern fn (*defp6ServiceBindingProtocol, *?Handle) Status,
    _destroy_child: extern fn (*defp6ServiceBindingProtocol, Handle) Status,

    pub fn createChild(self: *defp6ServiceBindingProtocol, handle: *?Handle) Status {
        return self._create_child(self, handle);
    }

    pub fn destroyChild(self: *defp6ServiceBindingProtocol, handle: Handle) Status {
        return self._destroy_child(self, handle);
    }

    pub defuid align(8) = Guid{
        .time_low = 0xec835dd3,
        .time_mid = 0xfe0f,
        .time_high_and_version = 0x617b,
        .clock_seq_high_and_reserved = 0xa6,
        .clock_seq_low = 0x21,
        .node = [_]u8{ 0xb3, 0x50, 0xc3, 0xe1, 0x33, 0x88 },
    };
};
