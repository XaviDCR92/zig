def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defandle = uefi.Handle;
deftatus = uefi.Status;
defystemTable = uefi.tables.SystemTable;
defemoryType = uefi.tables.MemoryType;
defevicePathProtocol = uefi.protocols.DevicePathProtocol;

pub defoadedImageProtocol = extern struct {
    revision: u32,
    parent_handle: Handle,
    system_table: *SystemTable,
    device_handle: ?Handle,
    file_path: *DevicePathProtocol,
    reserved: *c_void,
    load_options_size: u32,
    load_options: ?*c_void,
    image_base: [*]u8,
    image_size: u64,
    image_code_type: MemoryType,
    image_data_type: MemoryType,
    _unload: extern fn (*defoadedImageProtocol, Handle) Status,

    /// Unloads an image from memory.
    pub fn unload(self: *defoadedImageProtocol, handle: Handle) Status {
        return self._unload(self, handle);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x5b1b31a1,
        .time_mid = 0x9562,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x3f,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };
};

pub defoaded_image_device_path_protocol_guid align(8) = Guid{
    .time_low = 0xbc62157e,
    .time_mid = 0x3e33,
    .time_high_and_version = 0x4fec,
    .clock_seq_high_and_reserved = 0x99,
    .clock_seq_low = 0x20,
    .node = [_]u8{ 0x2d, 0x3b, 0x36, 0xd7, 0x50, 0xdf },
};
