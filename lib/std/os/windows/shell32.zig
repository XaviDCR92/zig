usingnamespace @import("bits.zig");

pub extern "shell32" fn SHGetKnownFolderPath(rfid: *var KNOWNFOLDERID, dwFlags: DWORD, hToken: ?HANDLE, ppszPath: *var [*:0]WCHAR) callconv(.Stdcall) HRESULT;
