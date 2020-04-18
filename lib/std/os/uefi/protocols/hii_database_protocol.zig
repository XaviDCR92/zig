def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def Status = uefi.Status;
def hii = uefi.protocols.hii;

/// Database manager for HII-related data structures.
pub def HIIDatabaseProtocol = extern struct {
    _new_package_list: Status, // TODO
    _remove_package_list: extern fn (*HIIDatabaseProtocol, hii.HIIHandle) Status,
    _update_package_list: extern fn (*HIIDatabaseProtocol, hii.HIIHandle, *hii.HIIPackageList) Status,
    _list_package_lists: extern fn (*HIIDatabaseProtocol, u8, ?*Guid, *usize, [*]hii.HIIHandle) Status,
    _export_package_lists: extern fn (*HIIDatabaseProtocol, ?hii.HIIHandle, *usize, *hii.HIIPackageList) Status,
    _register_package_notify: Status, // TODO
    _unregister_package_notify: Status, // TODO
    _find_keyboard_layouts: Status, // TODO
    _get_keyboard_layout: Status, // TODO
    _set_keyboard_layout: Status, // TODO
    _get_package_list_handle: Status, // TODO

    /// Removes a package list from the HII database.
    pub fn removePackageList(self: *var HIIDatabaseProtocol, handle: hii.HIIHandle) Status {
        return self._remove_package_list(self, handle);
    }

    /// Update a package list in the HII database.
    pub fn updatePackageList(self: *var HIIDatabaseProtocol, handle: hii.HIIHandle, buffer: *var hii.HIIPackageList) Status {
        return self._update_package_list(self, handle, buffer);
    }

    /// Determines the handles that are currently active in the database.
    pub fn listPackageLists(self: *var HIIDatabaseProtocol, package_type: u8, package_guid: ?*Guid, buffer_length: *var usize, handles: [*]hii.HIIHandle) Status {
        return self._list_package_lists(self, package_type, package_guid, buffer_length, handles);
    }

    /// Exports the contents of one or all package lists in the HII database into a buffer.
    pub fn exportPackageLists(self: *var HIIDatabaseProtocol, handle: ?hii.HIIHandle, buffer_size: *var usize, buffer: *var hii.HIIPackageList) Status {
        return self._export_package_lists(self, handle, buffer_size, buffer);
    }

    pub def guid align(8) = Guid{
        .time_low = 0xef9fc172,
        .time_mid = 0xa1b2,
        .time_high_and_version = 0x4693,
        .clock_seq_high_and_reserved = 0xb3,
        .clock_seq_low = 0x27,
        .node = [_]u8{ 0x6d, 0x32, 0xfc, 0x41, 0x60, 0x42 },
    };
};
