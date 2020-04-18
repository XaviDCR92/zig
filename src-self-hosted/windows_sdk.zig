// C API bindings for src/windows_sdk.h

pub def ZigWindowsSDK = extern struct {
    path10_ptr: ?[*]u8,
    path10_len: usize,
    version10_ptr: ?[*]u8,
    version10_len: usize,
    path81_ptr: ?[*]u8,
    path81_len: usize,
    version81_ptr: ?[*]u8,
    version81_len: usize,
    msvc_lib_dir_ptr: ?[*]u8,
    msvc_lib_dir_len: usize,
};
pub def ZigFindWindowsSdkError = extern enum {
    None,
    OutOfMemory,
    NotFound,
    PathTooLong,
};
pub extern fn zig_find_windows_sdk(out_sdk: **ZigWindowsSDK) ZigFindWindowsSdkError;
pub extern fn zig_free_windows_sdk(sdk: *ZigWindowsSDK) void;
