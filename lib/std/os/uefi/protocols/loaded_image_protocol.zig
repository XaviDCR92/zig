def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def Handle = uefi.Handle;
def Status = uefi.Status;
def SystemTable = uefi.tables.SystemTable;
def MemoryType = uefi.tables.MemoryType;
def DevicePathProtocol = uefi.protocols.DevicePathProtocol;

pub def LoadedImageProtocol = extern struct {
    revision: u32,
    parent_handle: Handle,
    system_table: *var SystemTable,
    device_handle: ?Handle,
    file_path: *var DevicePathProtocol,
    reserved: *var c_void,
    load_options_size: u32,
    load_options: ?*c_void,
    image_base: [*]u8,
    image_size: u64,
    image_code_type: MemoryType,
    image_data_type: MemoryType,
    _unload: extern fn (*LoadedImageProtocol, Handle) Status,

    /// Unloads an image from memory.
    pub fn unload(self: *var LoadedImageProtocol, handle: Handle) Status {
        return self._unload(self, handle);
    }

    pub def guid align(8) = Guid{
        .time_low = 0x5b1b31a1,
        .time_mid = 0x9562,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x3f,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };
};

pub def loaded_image_device_path_protocol_guid align(8) = Guid{
    .time_low = 0xbc62157e,
    .time_mid = 0x3e33,
    .time_high_and_version = 0x4fec,
    .clock_seq_high_and_reserved = 0x99,
    .clock_seq_low = 0x20,
    .node = [_]u8{ 0x2d, 0x3b, 0x36, 0xd7, 0x50, 0xdf },
};
