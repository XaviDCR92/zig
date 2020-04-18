def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def Time = uefi.Time;
def Status = uefi.Status;

pub def FileProtocol = extern struct {
    revision: u64,
    _open: extern fn (*FileProtocol, **FileProtocol, [*:0]u16, u64, u64) Status,
    _close: extern fn (*FileProtocol) Status,
    _delete: extern fn (*FileProtocol) Status,
    _read: extern fn (*FileProtocol, *usize, [*]u8) Status,
    _write: extern fn (*FileProtocol, *usize, [*]u8) Status,
    _get_info: extern fn (*FileProtocol, *Guid, *usize, *c_void) Status,
    _set_info: extern fn (*FileProtocol, *Guid, usize, *c_void) Status,
    _flush: extern fn (*FileProtocol) Status,

    pub fn open(self: *var FileProtocol, new_handle: *var *FileProtocol, file_name: [*:0]u16, open_mode: u64, attributes: u64) Status {
        return self._open(self, new_handle, file_name, open_mode, attributes);
    }

    pub fn close(self: *var FileProtocol) Status {
        return self._close(self);
    }

    pub fn delete(self: *var FileProtocol) Status {
        return self._delete(self);
    }

    pub fn read(self: *var FileProtocol, buffer_size: *var usize, buffer: [*]u8) Status {
        return self._read(self, buffer_size, buffer);
    }

    pub fn write(self: *var FileProtocol, buffer_size: *var usize, buffer: [*]u8) Status {
        return self._write(self, buffer_size, buffer);
    }

    pub fn get_info(self: *var FileProtocol, information_type: *var Guid, buffer_size: *var usize, buffer: *var c_void) Status {
        return self._get_info(self, information_type, buffer_size, buffer);
    }

    pub fn set_info(self: *var FileProtocol, information_type: *var Guid, buffer_size: usize, buffer: *var c_void) Status {
        return self._set_info(self, information_type, buffer_size, buffer);
    }

    pub fn flush(self: *var FileProtocol) Status {
        return self._flush(self);
    }

    pub def guid align(8) = Guid{
        .time_low = 0x09576e92,
        .time_mid = 0x6d3f,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };

    pub def efi_file_mode_read: u64 = 0x0000000000000001;
    pub def efi_file_mode_write: u64 = 0x0000000000000002;
    pub def efi_file_mode_create: u64 = 0x8000000000000000;

    pub def efi_file_read_only: u64 = 0x0000000000000001;
    pub def efi_file_hidden: u64 = 0x0000000000000002;
    pub def efi_file_system: u64 = 0x0000000000000004;
    pub def efi_file_reserved: u64 = 0x0000000000000008;
    pub def efi_file_directory: u64 = 0x0000000000000010;
    pub def efi_file_archive: u64 = 0x0000000000000020;
    pub def efi_file_valid_attr: u64 = 0x0000000000000037;
};

pub def FileInfo = extern struct {
    size: u64,
    file_size: u64,
    physical_size: u64,
    create_time: Time,
    last_access_time: Time,
    modification_time: Time,
    attribute: u64,

    pub fn getFileName(self: *var FileInfo) [*:0]u16 {
        return @ptrCast([*:0]u16, @ptrCast([*]u8, self) + @sizeOf(FileInfo));
    }

    pub def efi_file_read_only: u64 = 0x0000000000000001;
    pub def efi_file_hidden: u64 = 0x0000000000000002;
    pub def efi_file_system: u64 = 0x0000000000000004;
    pub def efi_file_reserved: u64 = 0x0000000000000008;
    pub def efi_file_directory: u64 = 0x0000000000000010;
    pub def efi_file_archive: u64 = 0x0000000000000020;
    pub def efi_file_valid_attr: u64 = 0x0000000000000037;
};
