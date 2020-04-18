usingnamespace @import("bits.zig");

pub extern "NtDll" fn RtlGetVersion(
    lpVersionInformation: PRTL_OSVERSIONINFOW,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn RtlCaptureStackBackTrace(
    FramesToSkip: DWORD,
    FramesToCapture: DWORD,
    BackTrace: *var *c_void,
    BackTraceHash: ?*DWORD,
) callconv(.Stdcall) WORD;
pub extern "NtDll" fn NtQueryInformationFile(
    FileHandle: HANDLE,
    IoStatusBlock: *var IO_STATUS_BLOCK,
    FileInformation: *var c_void,
    Length: ULONG,
    FileInformationClass: FILE_INFORMATION_CLASS,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtSetInformationFile(
    FileHandle: HANDLE,
    IoStatusBlock: *var IO_STATUS_BLOCK,
    FileInformation: PVOID,
    Length: ULONG,
    FileInformationClass: FILE_INFORMATION_CLASS,
) callconv(.Stdcall) NTSTATUS;

pub extern "NtDll" fn NtQueryAttributesFile(
    ObjectAttributes: *var OBJECT_ATTRIBUTES,
    FileAttributes: *var FILE_BASIC_INFORMATION,
) callconv(.Stdcall) NTSTATUS;

pub extern "NtDll" fn NtCreateFile(
    FileHandle: *var HANDLE,
    DesiredAccess: ACCESS_MASK,
    ObjectAttributes: *var OBJECT_ATTRIBUTES,
    IoStatusBlock: *var IO_STATUS_BLOCK,
    AllocationSize: ?*LARGE_INTEGER,
    FileAttributes: ULONG,
    ShareAccess: ULONG,
    CreateDisposition: ULONG,
    CreateOptions: ULONG,
    EaBuffer: ?*c_void,
    EaLength: ULONG,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtDeviceIoControlFile(
    FileHandle: HANDLE,
    Event: ?HANDLE,
    ApcRoutine: ?IO_APC_ROUTINE,
    ApcContext: ?*c_void,
    IoStatusBlock: *var IO_STATUS_BLOCK,
    IoControlCode: ULONG,
    InputBuffer: ?*c_void,
    InputBufferLength: ULONG,
    OutputBuffer: ?PVOID,
    OutputBufferLength: ULONG,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtClose(Handle: HANDLE) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn RtlDosPathNameToNtPathName_U(
    DosPathName: [*:0]u16,
    NtPathName: *var UNICODE_STRING,
    NtFileNamePart: ?*?[*:0]u16,
    DirectoryInfo: ?*CURDIR,
) callconv(.Stdcall) BOOL;
pub extern "NtDll" fn RtlFreeUnicodeString(UnicodeString: *var UNICODE_STRING) callconv(.Stdcall) void;

pub extern "NtDll" fn NtQueryDirectoryFile(
    FileHandle: HANDLE,
    Event: ?HANDLE,
    ApcRoutine: ?IO_APC_ROUTINE,
    ApcContext: ?*c_void,
    IoStatusBlock: *var IO_STATUS_BLOCK,
    FileInformation: *var c_void,
    Length: ULONG,
    FileInformationClass: FILE_INFORMATION_CLASS,
    ReturnSingleEntry: BOOLEAN,
    FileName: ?*UNICODE_STRING,
    RestartScan: BOOLEAN,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtCreateKeyedEvent(
    KeyedEventHandle: *var HANDLE,
    DesiredAccess: ACCESS_MASK,
    ObjectAttributes: ?PVOID,
    Flags: ULONG,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtReleaseKeyedEvent(
    EventHandle: HANDLE,
    Key: *var c_void,
    Alertable: BOOLEAN,
    Timeout: ?*LARGE_INTEGER,
) callconv(.Stdcall) NTSTATUS;
pub extern "NtDll" fn NtWaitForKeyedEvent(
    EventHandle: HANDLE,
    Key: *var c_void,
    Alertable: BOOLEAN,
    Timeout: ?*LARGE_INTEGER,
) callconv(.Stdcall) NTSTATUS;
