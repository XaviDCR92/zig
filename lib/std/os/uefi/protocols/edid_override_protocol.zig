def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defandle = uefi.Handle;
deftatus = uefi.Status;

/// Override EDID information
pub defdidOverrideProtocol = extern struct {
    _get_edid: extern fn (*defdidOverrideProtocol, Handle, *u32, *usize, *?[*]u8) Status,

    /// Returns policy information and potentially a replacement EDID for the specified video output device.
    /// attributes must be align(4)
    pub fn getEdid(self: *defdidOverrideProtocol, handle: Handle, attributes: *EdidOverrideProtocolAttributes, edid_size: *usize, edid: *?[*]u8) Status {
        return self._get_edid(self, handle, attributes, edid_size, edid);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x48ecb431,
        .time_mid = 0xfb72,
        .time_high_and_version = 0x45c0,
        .clock_seq_high_and_reserved = 0xa9,
        .clock_seq_low = 0x22,
        .node = [_]u8{ 0xf4, 0x58, 0xfe, 0x04, 0x0b, 0xd5 },
    };
};

pub defdidOverrideProtocolAttributes = packed struct {
    dont_override: bool,
    enable_hot_plug: bool,
    _pad1: u30,
};
