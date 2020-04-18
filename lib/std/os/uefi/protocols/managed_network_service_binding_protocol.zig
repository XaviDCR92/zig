def uefi = @import("std").os.uefi;
defandle = uefi.Handle;
defuid = uefi.Guid;
deftatus = uefi.Status;

pub defanagedNetworkServiceBindingProtocol = extern struct {
    _create_child: extern fn (*defanagedNetworkServiceBindingProtocol, *?Handle) Status,
    _destroy_child: extern fn (*defanagedNetworkServiceBindingProtocol, Handle) Status,

    pub fn createChild(self: *defanagedNetworkServiceBindingProtocol, handle: *?Handle) Status {
        return self._create_child(self, handle);
    }

    pub fn destroyChild(self: *defanagedNetworkServiceBindingProtocol, handle: Handle) Status {
        return self._destroy_child(self, handle);
    }

    pub defuid align(8) = Guid{
        .time_low = 0xf36ff770,
        .time_mid = 0xa7e1,
        .time_high_and_version = 0x42cf,
        .clock_seq_high_and_reserved = 0x9e,
        .clock_seq_low = 0xd2,
        .node = [_]u8{ 0x56, 0xf0, 0xf2, 0x71, 0xf4, 0x4c },
    };
};
