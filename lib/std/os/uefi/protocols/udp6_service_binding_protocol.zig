def uefi = @import("std").os.uefi;
defandle = uefi.Handle;
defuid = uefi.Guid;
deftatus = uefi.Status;

pub defdp6ServiceBindingProtocol = extern struct {
    _create_child: extern fn (*defdp6ServiceBindingProtocol, *?Handle) Status,
    _destroy_child: extern fn (*defdp6ServiceBindingProtocol, Handle) Status,

    pub fn createChild(self: *defdp6ServiceBindingProtocol, handle: *?Handle) Status {
        return self._create_child(self, handle);
    }

    pub fn destroyChild(self: *defdp6ServiceBindingProtocol, handle: Handle) Status {
        return self._destroy_child(self, handle);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x66ed4721,
        .time_mid = 0x3c98,
        .time_high_and_version = 0x4d3e,
        .clock_seq_high_and_reserved = 0x81,
        .clock_seq_low = 0xe3,
        .node = [_]u8{ 0xd0, 0x3d, 0xd3, 0x9a, 0x72, 0x54 },
    };
};
