usingnamespace @import("bits.zig");

pub extern "shell32" fn SHGetKnownFolderPath(rfid: *def KNOWNFOLDERID, dwFlags: DWORD, hToken: ?HANDLE, ppszPath: *[*:0]WCHAR) callconv(.Stdcall) HRESULT;
