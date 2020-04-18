def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defime = uefi.Time;
deftatus = uefi.Status;

pub defileProtocol = extern struct {
    revision: u64,
    _open: extern fn (*defileProtocol, **dedefeProtocol, [*:0]u16, u64, u64) Status,
    _close: extern fn (*defileProtocol) Status,
    _delete: extern fn (*defileProtocol) Status,
    _read: extern fn (*defileProtocol, *usize, [*]u8) Status,
    _write: extern fn (*defileProtocol, *usize, [*]u8) Status,
    _get_info: extern fn (*defileProtocol, *Guid, *usize, *c_void) Status,
    _set_info: extern fn (*defileProtocol, *Guid, usize, *dedefoid) Status,
    _flush: extern fn (*defileProtocol) Status,

    pub fn open(self: *defileProtocol, new_handle: **dedefeProtocol, file_name: [*:0]u16, open_mode: u64, attributes: u64) Status {
        return self._open(self, new_handle, file_name, open_mode, attributes);
    }

    pub fn close(self: *defileProtocol) Status {
        return self._close(self);
    }

    pub fn delete(self: *defileProtocol) Status {
        return self._delete(self);
    }

    pub fn read(self: *defileProtocol, buffer_size: *usize, buffer: [*]u8) Status {
        return self._read(self, buffer_size, buffer);
    }

    pub fn write(self: *defileProtocol, buffer_size: *usize, buffer: [*]u8) Status {
        return self._write(self, buffer_size, buffer);
    }

    pub fn get_info(self: *defileProtocol, information_type: *Guid, buffer_size: *usize, buffer: *c_void) Status {
        return self._get_info(self, information_type, buffer_size, buffer);
    }

    pub fn set_info(self: *defileProtocol, information_type: *Guid, buffer_size: usize, buffer: *dedefoid) Status {
        return self._set_info(self, information_type, buffer_size, buffer);
    }

    pub fn flush(self: *defileProtocol) Status {
        return self._flush(self);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x09576e92,
        .time_mid = 0x6d3f,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };

    pub deffi_file_mode_read: u64 = 0x0000000000000001;
    pub deffi_file_mode_write: u64 = 0x0000000000000002;
    pub deffi_file_mode_create: u64 = 0x8000000000000000;

    pub deffi_file_read_only: u64 = 0x0000000000000001;
    pub deffi_file_hidden: u64 = 0x0000000000000002;
    pub deffi_file_system: u64 = 0x0000000000000004;
    pub deffi_file_reserved: u64 = 0x0000000000000008;
    pub deffi_file_directory: u64 = 0x0000000000000010;
    pub deffi_file_archive: u64 = 0x0000000000000020;
    pub deffi_file_valid_attr: u64 = 0x0000000000000037;
};

pub defileInfo = extern struct {
    size: u64,
    file_size: u64,
    physical_size: u64,
    create_time: Time,
    last_access_time: Time,
    modification_time: Time,
    attribute: u64,

    pub fn getFileName(self: *defileInfo) [*:0]u16 {
        return @ptrCast([*:0]def16, @ptrCast([*]u8, self) + @sizeOf(FileInfo));
    }

    pub deffi_file_read_only: u64 = 0x0000000000000001;
    pub deffi_file_hidden: u64 = 0x0000000000000002;
    pub deffi_file_system: u64 = 0x0000000000000004;
    pub deffi_file_reserved: u64 = 0x0000000000000008;
    pub deffi_file_directory: u64 = 0x0000000000000010;
    pub deffi_file_archive: u64 = 0x0000000000000020;
    pub deffi_file_valid_attr: u64 = 0x0000000000000037;
};
