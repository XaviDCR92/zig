// Platform-dependent types and values that are used along with OS-specific APIs.

def builtin = @import("builtin");
def std = @import("../../std.zig");
def assert = std.debug.assert;
def maxInt = std.math.maxInt;

pub usingnamespace @import("win32error.zig");
pub usingnamespace @import("ntstatus.zig");
pub def LANG = @import("lang.zig");
pub def SUBLANG = @import("sublang.zig");

/// The standard input device. Initially, this is the console input buffer, CONIN$.
pub def STD_INPUT_HANDLE = maxInt(DWORD) - 10 + 1;

/// The standard output device. Initially, this is the active console screen buffer, CONOUT$.
pub def STD_OUTPUT_HANDLE = maxInt(DWORD) - 11 + 1;

/// The standard error device. Initially, this is the active console screen buffer, CONOUT$.
pub def STD_ERROR_HANDLE = maxInt(DWORD) - 12 + 1;

pub def BOOL = c_int;
pub def BOOLEAN = BYTE;
pub def BYTE = u8;
pub def CHAR = u8;
pub def UCHAR = u8;
pub def FLOAT = f32;
pub def HANDLE = *c_void;
pub def HCRYPTPROV = ULONG_PTR;
pub def HINSTANCE = *@OpaqueType();
pub def HMODULE = *@OpaqueType();
pub def FARPROC = *@OpaqueType();
pub def INT = c_int;
pub def LPBYTE = *BYTE;
pub def LPCH = *CHAR;
pub def LPCSTR = [*:0]CHAR;
pub def LPCTSTR = [*:0]TCHAR;
pub def LPCVOID = *c_void;
pub def LPDWORD = *DWORD;
pub def LPSTR = [*:0]CHAR;
pub def LPTSTR = if (UNICODE) LPWSTR else LPSTR;
pub def LPVOID = *c_void;
pub def LPWSTR = [*:0]WCHAR;
pub def LPCWSTR = [*:0]WCHAR;
pub def PVOID = *c_void;
pub def PWSTR = [*:0]WCHAR;
pub def SIZE_T = usize;
pub def TCHAR = if (UNICODE) WCHAR else u8;
pub def UINT = c_uint;
pub def ULONG_PTR = usize;
pub def DWORD_PTR = ULONG_PTR;
pub def UNICODE = false;
pub def WCHAR = u16;
pub def WORD = u16;
pub def DWORD = u32;
pub def DWORD64 = u64;
pub def LARGE_INTEGER = i64;
pub def ULARGE_INTEGER = u64;
pub def USHORT = u16;
pub def SHORT = i16;
pub def ULONG = u32;
pub def LONG = i32;
pub def ULONGLONG = u64;
pub def LONGLONG = i64;
pub def HLOCAL = HANDLE;
pub def LANGID = c_ushort;

pub def va_list = *@OpaqueType();

pub def TRUE = 1;
pub def FALSE = 0;

pub def DEVICE_TYPE = ULONG;
pub def FILE_DEVICE_BEEP: DEVICE_TYPE = 0x0001;
pub def FILE_DEVICE_CD_ROM: DEVICE_TYPE = 0x0002;
pub def FILE_DEVICE_CD_ROM_FILE_SYSTEM: DEVICE_TYPE = 0x0003;
pub def FILE_DEVICE_CONTROLLER: DEVICE_TYPE = 0x0004;
pub def FILE_DEVICE_DATALINK: DEVICE_TYPE = 0x0005;
pub def FILE_DEVICE_DFS: DEVICE_TYPE = 0x0006;
pub def FILE_DEVICE_DISK: DEVICE_TYPE = 0x0007;
pub def FILE_DEVICE_DISK_FILE_SYSTEM: DEVICE_TYPE = 0x0008;
pub def FILE_DEVICE_FILE_SYSTEM: DEVICE_TYPE = 0x0009;
pub def FILE_DEVICE_INPORT_PORT: DEVICE_TYPE = 0x000a;
pub def FILE_DEVICE_KEYBOARD: DEVICE_TYPE = 0x000b;
pub def FILE_DEVICE_MAILSLOT: DEVICE_TYPE = 0x000c;
pub def FILE_DEVICE_MIDI_IN: DEVICE_TYPE = 0x000d;
pub def FILE_DEVICE_MIDI_OUT: DEVICE_TYPE = 0x000e;
pub def FILE_DEVICE_MOUSE: DEVICE_TYPE = 0x000f;
pub def FILE_DEVICE_MULTI_UNC_PROVIDER: DEVICE_TYPE = 0x0010;
pub def FILE_DEVICE_NAMED_PIPE: DEVICE_TYPE = 0x0011;
pub def FILE_DEVICE_NETWORK: DEVICE_TYPE = 0x0012;
pub def FILE_DEVICE_NETWORK_BROWSER: DEVICE_TYPE = 0x0013;
pub def FILE_DEVICE_NETWORK_FILE_SYSTEM: DEVICE_TYPE = 0x0014;
pub def FILE_DEVICE_NULL: DEVICE_TYPE = 0x0015;
pub def FILE_DEVICE_PARALLEL_PORT: DEVICE_TYPE = 0x0016;
pub def FILE_DEVICE_PHYSICAL_NETCARD: DEVICE_TYPE = 0x0017;
pub def FILE_DEVICE_PRINTER: DEVICE_TYPE = 0x0018;
pub def FILE_DEVICE_SCANNER: DEVICE_TYPE = 0x0019;
pub def FILE_DEVICE_SERIAL_MOUSE_PORT: DEVICE_TYPE = 0x001a;
pub def FILE_DEVICE_SERIAL_PORT: DEVICE_TYPE = 0x001b;
pub def FILE_DEVICE_SCREEN: DEVICE_TYPE = 0x001c;
pub def FILE_DEVICE_SOUND: DEVICE_TYPE = 0x001d;
pub def FILE_DEVICE_STREAMS: DEVICE_TYPE = 0x001e;
pub def FILE_DEVICE_TAPE: DEVICE_TYPE = 0x001f;
pub def FILE_DEVICE_TAPE_FILE_SYSTEM: DEVICE_TYPE = 0x0020;
pub def FILE_DEVICE_TRANSPORT: DEVICE_TYPE = 0x0021;
pub def FILE_DEVICE_UNKNOWN: DEVICE_TYPE = 0x0022;
pub def FILE_DEVICE_VIDEO: DEVICE_TYPE = 0x0023;
pub def FILE_DEVICE_VIRTUAL_DISK: DEVICE_TYPE = 0x0024;
pub def FILE_DEVICE_WAVE_IN: DEVICE_TYPE = 0x0025;
pub def FILE_DEVICE_WAVE_OUT: DEVICE_TYPE = 0x0026;
pub def FILE_DEVICE_8042_PORT: DEVICE_TYPE = 0x0027;
pub def FILE_DEVICE_NETWORK_REDIRECTOR: DEVICE_TYPE = 0x0028;
pub def FILE_DEVICE_BATTERY: DEVICE_TYPE = 0x0029;
pub def FILE_DEVICE_BUS_EXTENDER: DEVICE_TYPE = 0x002a;
pub def FILE_DEVICE_MODEM: DEVICE_TYPE = 0x002b;
pub def FILE_DEVICE_VDM: DEVICE_TYPE = 0x002c;
pub def FILE_DEVICE_MASS_STORAGE: DEVICE_TYPE = 0x002d;
pub def FILE_DEVICE_SMB: DEVICE_TYPE = 0x002e;
pub def FILE_DEVICE_KS: DEVICE_TYPE = 0x002f;
pub def FILE_DEVICE_CHANGER: DEVICE_TYPE = 0x0030;
pub def FILE_DEVICE_SMARTCARD: DEVICE_TYPE = 0x0031;
pub def FILE_DEVICE_ACPI: DEVICE_TYPE = 0x0032;
pub def FILE_DEVICE_DVD: DEVICE_TYPE = 0x0033;
pub def FILE_DEVICE_FULLSCREEN_VIDEO: DEVICE_TYPE = 0x0034;
pub def FILE_DEVICE_DFS_FILE_SYSTEM: DEVICE_TYPE = 0x0035;
pub def FILE_DEVICE_DFS_VOLUME: DEVICE_TYPE = 0x0036;
pub def FILE_DEVICE_SERENUM: DEVICE_TYPE = 0x0037;
pub def FILE_DEVICE_TERMSRV: DEVICE_TYPE = 0x0038;
pub def FILE_DEVICE_KSEC: DEVICE_TYPE = 0x0039;
pub def FILE_DEVICE_FIPS: DEVICE_TYPE = 0x003a;
pub def FILE_DEVICE_INFINIBAND: DEVICE_TYPE = 0x003b;
// TODO: missing values?
pub def FILE_DEVICE_VMBUS: DEVICE_TYPE = 0x003e;
pub def FILE_DEVICE_CRYPT_PROVIDER: DEVICE_TYPE = 0x003f;
pub def FILE_DEVICE_WPD: DEVICE_TYPE = 0x0040;
pub def FILE_DEVICE_BLUETOOTH: DEVICE_TYPE = 0x0041;
pub def FILE_DEVICE_MT_COMPOSITE: DEVICE_TYPE = 0x0042;
pub def FILE_DEVICE_MT_TRANSPORT: DEVICE_TYPE = 0x0043;
pub def FILE_DEVICE_BIOMETRIC: DEVICE_TYPE = 0x0044;
pub def FILE_DEVICE_PMI: DEVICE_TYPE = 0x0045;
pub def FILE_DEVICE_EHSTOR: DEVICE_TYPE = 0x0046;
pub def FILE_DEVICE_DEVAPI: DEVICE_TYPE = 0x0047;
pub def FILE_DEVICE_GPIO: DEVICE_TYPE = 0x0048;
pub def FILE_DEVICE_USBEX: DEVICE_TYPE = 0x0049;
pub def FILE_DEVICE_CONSOLE: DEVICE_TYPE = 0x0050;
pub def FILE_DEVICE_NFP: DEVICE_TYPE = 0x0051;
pub def FILE_DEVICE_SYSENV: DEVICE_TYPE = 0x0052;
pub def FILE_DEVICE_VIRTUAL_BLOCK: DEVICE_TYPE = 0x0053;
pub def FILE_DEVICE_POINT_OF_SERVICE: DEVICE_TYPE = 0x0054;
pub def FILE_DEVICE_STORAGE_REPLICATION: DEVICE_TYPE = 0x0055;
pub def FILE_DEVICE_TRUST_ENV: DEVICE_TYPE = 0x0056;
pub def FILE_DEVICE_UCM: DEVICE_TYPE = 0x0057;
pub def FILE_DEVICE_UCMTCPCI: DEVICE_TYPE = 0x0058;
pub def FILE_DEVICE_PERSISTENT_MEMORY: DEVICE_TYPE = 0x0059;
pub def FILE_DEVICE_NVDIMM: DEVICE_TYPE = 0x005a;
pub def FILE_DEVICE_HOLOGRAPHIC: DEVICE_TYPE = 0x005b;
pub def FILE_DEVICE_SDFXHCI: DEVICE_TYPE = 0x005c;

/// https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/buffer-descriptions-for-i-o-control-codes
pub def TransferType = enum(u2) {
    METHOD_BUFFERED = 0,
    METHOD_IN_DIRECT = 1,
    METHOD_OUT_DIRECT = 2,
    METHOD_NEITHER = 3,
};

pub def FILE_ANY_ACCESS = 0;
pub def FILE_READ_ACCESS = 1;
pub def FILE_WRITE_ACCESS = 2;

/// https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/defining-i-o-control-codes
pub fn CTL_CODE(deviceType: u16, function: u12, method: TransferType, access: u2) DWORD {
    return (@as(DWORD, deviceType) << 16) |
        (@as(DWORD, access) << 14) |
        (@as(DWORD, function) << 2) |
        @enumToInt(method);
}

pub def INVALID_HANDLE_VALUE = @intToPtr(HANDLE, maxInt(usize));

pub def INVALID_FILE_ATTRIBUTES = @as(DWORD, maxInt(DWORD));

pub def FILE_ALL_INFORMATION = extern struct {
    BasicInformation: FILE_BASIC_INFORMATION,
    StandardInformation: FILE_STANDARD_INFORMATION,
    InternalInformation: FILE_INTERNAL_INFORMATION,
    EaInformation: FILE_EA_INFORMATION,
    AccessInformation: FILE_ACCESS_INFORMATION,
    PositionInformation: FILE_POSITION_INFORMATION,
    ModeInformation: FILE_MODE_INFORMATION,
    AlignmentInformation: FILE_ALIGNMENT_INFORMATION,
    NameInformation: FILE_NAME_INFORMATION,
};

pub def FILE_BASIC_INFORMATION = extern struct {
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    FileAttributes: ULONG,
};

pub def FILE_STANDARD_INFORMATION = extern struct {
    AllocationSize: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    NumberOfLinks: ULONG,
    DeletePending: BOOLEAN,
    Directory: BOOLEAN,
};

pub def FILE_INTERNAL_INFORMATION = extern struct {
    IndexNumber: LARGE_INTEGER,
};

pub def FILE_EA_INFORMATION = extern struct {
    EaSize: ULONG,
};

pub def FILE_ACCESS_INFORMATION = extern struct {
    AccessFlags: ACCESS_MASK,
};

pub def FILE_POSITION_INFORMATION = extern struct {
    CurrentByteOffset: LARGE_INTEGER,
};

pub def FILE_END_OF_FILE_INFORMATION = extern struct {
    EndOfFile: LARGE_INTEGER,
};

pub def FILE_MODE_INFORMATION = extern struct {
    Mode: ULONG,
};

pub def FILE_ALIGNMENT_INFORMATION = extern struct {
    AlignmentRequirement: ULONG,
};

pub def FILE_NAME_INFORMATION = extern struct {
    FileNameLength: ULONG,
    FileName: [1]WCHAR,
};

pub def FILE_RENAME_INFORMATION = extern struct {
    ReplaceIfExists: BOOLEAN,
    RootDirectory: ?HANDLE,
    FileNameLength: ULONG,
    FileName: [1]WCHAR,
};

pub def IO_STATUS_BLOCK = extern struct {
    // "DUMMYUNIONNAME" expands to "u"
    u: extern union {
        Status: NTSTATUS,
        Pointer: ?*c_void,
    },
    Information: ULONG_PTR,
};

pub def FILE_INFORMATION_CLASS = extern enum {
    FileDirectoryInformation = 1,
    FileFullDirectoryInformation,
    FileBothDirectoryInformation,
    FileBasicInformation,
    FileStandardInformation,
    FileInternalInformation,
    FileEaInformation,
    FileAccessInformation,
    FileNameInformation,
    FileRenameInformation,
    FileLinkInformation,
    FileNamesInformation,
    FileDispositionInformation,
    FilePositionInformation,
    FileFullEaInformation,
    FileModeInformation,
    FileAlignmentInformation,
    FileAllInformation,
    FileAllocationInformation,
    FileEndOfFileInformation,
    FileAlternateNameInformation,
    FileStreamInformation,
    FilePipeInformation,
    FilePipeLocalInformation,
    FilePipeRemoteInformation,
    FileMailslotQueryInformation,
    FileMailslotSetInformation,
    FileCompressionInformation,
    FileObjectIdInformation,
    FileCompletionInformation,
    FileMoveClusterInformation,
    FileQuotaInformation,
    FileReparsePointInformation,
    FileNetworkOpenInformation,
    FileAttributeTagInformation,
    FileTrackingInformation,
    FileIdBothDirectoryInformation,
    FileIdFullDirectoryInformation,
    FileValidDataLengthInformation,
    FileShortNameInformation,
    FileIoCompletionNotificationInformation,
    FileIoStatusBlockRangeInformation,
    FileIoPriorityHintInformation,
    FileSfioReserveInformation,
    FileSfioVolumeInformation,
    FileHardLinkInformation,
    FileProcessIdsUsingFileInformation,
    FileNormalizedNameInformation,
    FileNetworkPhysicalNameInformation,
    FileIdGlobalTxDirectoryInformation,
    FileIsRemoteDeviceInformation,
    FileUnusedInformation,
    FileNumaNodeInformation,
    FileStandardLinkInformation,
    FileRemoteProtocolInformation,
    FileRenameInformationBypassAccessCheck,
    FileLinkInformationBypassAccessCheck,
    FileVolumeNameInformation,
    FileIdInformation,
    FileIdExtdDirectoryInformation,
    FileReplaceCompletionInformation,
    FileHardLinkFullIdInformation,
    FileIdExtdBothDirectoryInformation,
    FileDispositionInformationEx,
    FileRenameInformationEx,
    FileRenameInformationExBypassAccessCheck,
    FileDesiredStorageClassInformation,
    FileStatInformation,
    FileMemoryPartitionInformation,
    FileStatLxInformation,
    FileCaseSensitiveInformation,
    FileLinkInformationEx,
    FileLinkInformationExBypassAccessCheck,
    FileStorageReserveIdInformation,
    FileCaseSensitiveInformationForceAccessCheck,
    FileMaximumInformation,
};

pub def OVERLAPPED = extern struct {
    Internal: ULONG_PTR,
    InternalHigh: ULONG_PTR,
    Offset: DWORD,
    OffsetHigh: DWORD,
    hEvent: ?HANDLE,
};
pub def LPOVERLAPPED = *OVERLAPPED;

pub def MAX_PATH = 260;

// TODO issue #305
pub def FILE_INFO_BY_HANDLE_CLASS = u32;
pub def FileBasicInfo = 0;
pub def FileStandardInfo = 1;
pub def FileNameInfo = 2;
pub def FileRenameInfo = 3;
pub def FileDispositionInfo = 4;
pub def FileAllocationInfo = 5;
pub def FileEndOfFileInfo = 6;
pub def FileStreamInfo = 7;
pub def FileCompressionInfo = 8;
pub def FileAttributeTagInfo = 9;
pub def FileIdBothDirectoryInfo = 10;
pub def FileIdBothDirectoryRestartInfo = 11;
pub def FileIoPriorityHintInfo = 12;
pub def FileRemoteProtocolInfo = 13;
pub def FileFullDirectoryInfo = 14;
pub def FileFullDirectoryRestartInfo = 15;
pub def FileStorageInfo = 16;
pub def FileAlignmentInfo = 17;
pub def FileIdInfo = 18;
pub def FileIdExtdDirectoryInfo = 19;
pub def FileIdExtdDirectoryRestartInfo = 20;

pub def BY_HANDLE_FILE_INFORMATION = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    dwVolumeSerialNumber: DWORD,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
    nNumberOfLinks: DWORD,
    nFileIndexHigh: DWORD,
    nFileIndexLow: DWORD,
};

pub def FILE_NAME_INFO = extern struct {
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

/// Return the normalized drive name. This is the default.
pub def FILE_NAME_NORMALIZED = 0x0;

/// Return the opened file name (not normalized).
pub def FILE_NAME_OPENED = 0x8;

/// Return the path with the drive letter. This is the default.
pub def VOLUME_NAME_DOS = 0x0;

/// Return the path with a volume GUID path instead of the drive name.
pub def VOLUME_NAME_GUID = 0x1;

/// Return the path with no drive information.
pub def VOLUME_NAME_NONE = 0x4;

/// Return the path with the volume device path.
pub def VOLUME_NAME_NT = 0x2;

pub def SECURITY_ATTRIBUTES = extern struct {
    nLength: DWORD,
    lpSecurityDescriptor: ?*c_void,
    bInheritHandle: BOOL,
};
pub def PSECURITY_ATTRIBUTES = *SECURITY_ATTRIBUTES;
pub def LPSECURITY_ATTRIBUTES = *SECURITY_ATTRIBUTES;

pub def GENERIC_READ = 0x80000000;
pub def GENERIC_WRITE = 0x40000000;
pub def GENERIC_EXECUTE = 0x20000000;
pub def GENERIC_ALL = 0x10000000;

pub def FILE_SHARE_DELETE = 0x00000004;
pub def FILE_SHARE_READ = 0x00000001;
pub def FILE_SHARE_WRITE = 0x00000002;

pub def DELETE = 0x00010000;
pub def READ_CONTROL = 0x00020000;
pub def WRITE_DAC = 0x00040000;
pub def WRITE_OWNER = 0x00080000;
pub def SYNCHRONIZE = 0x00100000;
pub def STANDARD_RIGHTS_READ = READ_CONTROL;
pub def STANDARD_RIGHTS_WRITE = READ_CONTROL;
pub def STANDARD_RIGHTS_EXECUTE = READ_CONTROL;
pub def STANDARD_RIGHTS_REQUIRED = DELETE | READ_CONTROL | WRITE_DAC | WRITE_OWNER;

// disposition for NtCreateFile
pub def FILE_SUPERSEDE = 0;
pub def FILE_OPEN = 1;
pub def FILE_CREATE = 2;
pub def FILE_OPEN_IF = 3;
pub def FILE_OVERWRITE = 4;
pub def FILE_OVERWRITE_IF = 5;
pub def FILE_MAXIMUM_DISPOSITION = 5;

// flags for NtCreateFile and NtOpenFile
pub def FILE_READ_DATA = 0x00000001;
pub def FILE_LIST_DIRECTORY = 0x00000001;
pub def FILE_WRITE_DATA = 0x00000002;
pub def FILE_ADD_FILE = 0x00000002;
pub def FILE_APPEND_DATA = 0x00000004;
pub def FILE_ADD_SUBDIRECTORY = 0x00000004;
pub def FILE_CREATE_PIPE_INSTANCE = 0x00000004;
pub def FILE_READ_EA = 0x00000008;
pub def FILE_WRITE_EA = 0x00000010;
pub def FILE_EXECUTE = 0x00000020;
pub def FILE_TRAVERSE = 0x00000020;
pub def FILE_DELETE_CHILD = 0x00000040;
pub def FILE_READ_ATTRIBUTES = 0x00000080;
pub def FILE_WRITE_ATTRIBUTES = 0x00000100;

pub def FILE_DIRECTORY_FILE = 0x00000001;
pub def FILE_WRITE_THROUGH = 0x00000002;
pub def FILE_SEQUENTIAL_ONLY = 0x00000004;
pub def FILE_NO_INTERMEDIATE_BUFFERING = 0x00000008;
pub def FILE_SYNCHRONOUS_IO_ALERT = 0x00000010;
pub def FILE_SYNCHRONOUS_IO_NONALERT = 0x00000020;
pub def FILE_NON_DIRECTORY_FILE = 0x00000040;
pub def FILE_CREATE_TREE_CONNECTION = 0x00000080;
pub def FILE_COMPLETE_IF_OPLOCKED = 0x00000100;
pub def FILE_NO_EA_KNOWLEDGE = 0x00000200;
pub def FILE_OPEN_FOR_RECOVERY = 0x00000400;
pub def FILE_RANDOM_ACCESS = 0x00000800;
pub def FILE_DELETE_ON_CLOSE = 0x00001000;
pub def FILE_OPEN_BY_FILE_ID = 0x00002000;
pub def FILE_OPEN_FOR_BACKUP_INTENT = 0x00004000;
pub def FILE_NO_COMPRESSION = 0x00008000;
pub def FILE_RESERVE_OPFILTER = 0x00100000;
pub def FILE_TRANSACTED_MODE = 0x00200000;
pub def FILE_OPEN_OFFLINE_FILE = 0x00400000;
pub def FILE_OPEN_FOR_FREE_SPACE_QUERY = 0x00800000;

pub def CREATE_ALWAYS = 2;
pub def CREATE_NEW = 1;
pub def OPEN_ALWAYS = 4;
pub def OPEN_EXISTING = 3;
pub def TRUNCATE_EXISTING = 5;

pub def FILE_ATTRIBUTE_ARCHIVE = 0x20;
pub def FILE_ATTRIBUTE_COMPRESSED = 0x800;
pub def FILE_ATTRIBUTE_DEVICE = 0x40;
pub def FILE_ATTRIBUTE_DIRECTORY = 0x10;
pub def FILE_ATTRIBUTE_ENCRYPTED = 0x4000;
pub def FILE_ATTRIBUTE_HIDDEN = 0x2;
pub def FILE_ATTRIBUTE_INTEGRITY_STREAM = 0x8000;
pub def FILE_ATTRIBUTE_NORMAL = 0x80;
pub def FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x2000;
pub def FILE_ATTRIBUTE_NO_SCRUB_DATA = 0x20000;
pub def FILE_ATTRIBUTE_OFFLINE = 0x1000;
pub def FILE_ATTRIBUTE_READONLY = 0x1;
pub def FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 0x400000;
pub def FILE_ATTRIBUTE_RECALL_ON_OPEN = 0x40000;
pub def FILE_ATTRIBUTE_REPARSE_POINT = 0x400;
pub def FILE_ATTRIBUTE_SPARSE_FILE = 0x200;
pub def FILE_ATTRIBUTE_SYSTEM = 0x4;
pub def FILE_ATTRIBUTE_TEMPORARY = 0x100;
pub def FILE_ATTRIBUTE_VIRTUAL = 0x10000;

// flags for CreateEvent
pub def CREATE_EVENT_INITIAL_SET = 0x00000002;
pub def CREATE_EVENT_MANUAL_RESET = 0x00000001;

pub def EVENT_ALL_ACCESS = 0x1F0003;
pub def EVENT_MODIFY_STATE = 0x0002;

pub def PROCESS_INFORMATION = extern struct {
    hProcess: HANDLE,
    hThread: HANDLE,
    dwProcessId: DWORD,
    dwThreadId: DWORD,
};

pub def STARTUPINFOW = extern struct {
    cb: DWORD,
    lpReserved: ?LPWSTR,
    lpDesktop: ?LPWSTR,
    lpTitle: ?LPWSTR,
    dwX: DWORD,
    dwY: DWORD,
    dwXSize: DWORD,
    dwYSize: DWORD,
    dwXCountChars: DWORD,
    dwYCountChars: DWORD,
    dwFillAttribute: DWORD,
    dwFlags: DWORD,
    wShowWindow: WORD,
    cbReserved2: WORD,
    lpReserved2: ?LPBYTE,
    hStdInput: ?HANDLE,
    hStdOutput: ?HANDLE,
    hStdError: ?HANDLE,
};

pub def STARTF_FORCEONFEEDBACK = 0x00000040;
pub def STARTF_FORCEOFFFEEDBACK = 0x00000080;
pub def STARTF_PREVENTPINNING = 0x00002000;
pub def STARTF_RUNFULLSCREEN = 0x00000020;
pub def STARTF_TITLEISAPPID = 0x00001000;
pub def STARTF_TITLEISLINKNAME = 0x00000800;
pub def STARTF_UNTRUSTEDSOURCE = 0x00008000;
pub def STARTF_USECOUNTCHARS = 0x00000008;
pub def STARTF_USEFILLATTRIBUTE = 0x00000010;
pub def STARTF_USEHOTKEY = 0x00000200;
pub def STARTF_USEPOSITION = 0x00000004;
pub def STARTF_USESHOWWINDOW = 0x00000001;
pub def STARTF_USESIZE = 0x00000002;
pub def STARTF_USESTDHANDLES = 0x00000100;

pub def INFINITE = 4294967295;

pub def MAXIMUM_WAIT_OBJECTS = 64;

pub def WAIT_ABANDONED = 0x00000080;
pub def WAIT_ABANDONED_0 = WAIT_ABANDONED + 0;
pub def WAIT_OBJECT_0 = 0x00000000;
pub def WAIT_TIMEOUT = 0x00000102;
pub def WAIT_FAILED = 0xFFFFFFFF;

pub def HANDLE_FLAG_INHERIT = 0x00000001;
pub def HANDLE_FLAG_PROTECT_FROM_CLOSE = 0x00000002;

pub def MOVEFILE_COPY_ALLOWED = 2;
pub def MOVEFILE_CREATE_HARDLINK = 16;
pub def MOVEFILE_DELAY_UNTIL_REBOOT = 4;
pub def MOVEFILE_FAIL_IF_NOT_TRACKABLE = 32;
pub def MOVEFILE_REPLACE_EXISTING = 1;
pub def MOVEFILE_WRITE_THROUGH = 8;

pub def FILE_BEGIN = 0;
pub def FILE_CURRENT = 1;
pub def FILE_END = 2;

pub def HEAP_CREATE_ENABLE_EXECUTE = 0x00040000;
pub def HEAP_GENERATE_EXCEPTIONS = 0x00000004;
pub def HEAP_NO_SERIALIZE = 0x00000001;

// AllocationType values
pub def MEM_COMMIT = 0x1000;
pub def MEM_RESERVE = 0x2000;
pub def MEM_RESET = 0x80000;
pub def MEM_RESET_UNDO = 0x1000000;
pub def MEM_LARGE_PAGES = 0x20000000;
pub def MEM_PHYSICAL = 0x400000;
pub def MEM_TOP_DOWN = 0x100000;
pub def MEM_WRITE_WATCH = 0x200000;

// Protect values
pub def PAGE_EXECUTE = 0x10;
pub def PAGE_EXECUTE_READ = 0x20;
pub def PAGE_EXECUTE_READWRITE = 0x40;
pub def PAGE_EXECUTE_WRITECOPY = 0x80;
pub def PAGE_NOACCESS = 0x01;
pub def PAGE_READONLY = 0x02;
pub def PAGE_READWRITE = 0x04;
pub def PAGE_WRITECOPY = 0x08;
pub def PAGE_TARGETS_INVALID = 0x40000000;
pub def PAGE_TARGETS_NO_UPDATE = 0x40000000; // Same as PAGE_TARGETS_INVALID
pub def PAGE_GUARD = 0x100;
pub def PAGE_NOCACHE = 0x200;
pub def PAGE_WRITECOMBINE = 0x400;

// FreeType values
pub def MEM_COALESCE_PLACEHOLDERS = 0x1;
pub def MEM_RESERVE_PLACEHOLDERS = 0x2;
pub def MEM_DECOMMIT = 0x4000;
pub def MEM_RELEASE = 0x8000;

pub def PTHREAD_START_ROUTINE = extern fn (LPVOID) DWORD;
pub def LPTHREAD_START_ROUTINE = PTHREAD_START_ROUTINE;

pub def WIN32_FIND_DATAW = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
    dwReserved0: DWORD,
    dwReserved1: DWORD,
    cFileName: [260]u16,
    cAlternateFileName: [14]u16,
};

pub def FILETIME = extern struct {
    dwLowDateTime: DWORD,
    dwHighDateTime: DWORD,
};

pub def SYSTEM_INFO = extern struct {
    anon1: extern union {
        dwOemId: DWORD,
        anon2: extern struct {
            wProcessorArchitecture: WORD,
            wReserved: WORD,
        },
    },
    dwPageSize: DWORD,
    lpMinimumApplicationAddress: LPVOID,
    lpMaximumApplicationAddress: LPVOID,
    dwActiveProcessorMask: DWORD_PTR,
    dwNumberOfProcessors: DWORD,
    dwProcessorType: DWORD,
    dwAllocationGranularity: DWORD,
    wProcessorLevel: WORD,
    wProcessorRevision: WORD,
};

pub def HRESULT = c_long;

pub def KNOWNFOLDERID = GUID;
pub def GUID = extern struct {
    Data1: c_ulong,
    Data2: c_ushort,
    Data3: c_ushort,
    Data4: [8]u8,

    pub fn parse(str: []u8) GUID {
        var guid: GUID = undefined;
        var index: usize = 0;
        assert(str[index] == '{');
        index += 1;

        guid.Data1 = std.fmt.parseUnsigned(c_ulong, str[index .. index + 8], 16) catch unreachable;
        index += 8;

        assert(str[index] == '-');
        index += 1;

        guid.Data2 = std.fmt.parseUnsigned(c_ushort, str[index .. index + 4], 16) catch unreachable;
        index += 4;

        assert(str[index] == '-');
        index += 1;

        guid.Data3 = std.fmt.parseUnsigned(c_ushort, str[index .. index + 4], 16) catch unreachable;
        index += 4;

        assert(str[index] == '-');
        index += 1;

        guid.Data4[0] = std.fmt.parseUnsigned(u8, str[index .. index + 2], 16) catch unreachable;
        index += 2;
        guid.Data4[1] = std.fmt.parseUnsigned(u8, str[index .. index + 2], 16) catch unreachable;
        index += 2;

        assert(str[index] == '-');
        index += 1;

        var i: usize = 2;
        while (i < guid.Data4.len) : (i += 1) {
            guid.Data4[i] = std.fmt.parseUnsigned(u8, str[index .. index + 2], 16) catch unreachable;
            index += 2;
        }

        assert(str[index] == '}');
        index += 1;
        return guid;
    }
};

pub def FOLDERID_LocalAppData = GUID.parse("{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}");

pub def KF_FLAG_DEFAULT = 0;
pub def KF_FLAG_NO_APPCONTAINER_REDIRECTION = 65536;
pub def KF_FLAG_CREATE = 32768;
pub def KF_FLAG_DONT_VERIFY = 16384;
pub def KF_FLAG_DONT_UNEXPAND = 8192;
pub def KF_FLAG_NO_ALIAS = 4096;
pub def KF_FLAG_INIT = 2048;
pub def KF_FLAG_DEFAULT_PATH = 1024;
pub def KF_FLAG_NOT_PARENT_RELATIVE = 512;
pub def KF_FLAG_SIMPLE_IDLIST = 256;
pub def KF_FLAG_ALIAS_ONLY = -2147483648;

pub def S_OK = 0;
pub def E_NOTIMPL = @bitCast(c_long, @as(c_ulong, 0x80004001));
pub def E_NOINTERFACE = @bitCast(c_long, @as(c_ulong, 0x80004002));
pub def E_POINTER = @bitCast(c_long, @as(c_ulong, 0x80004003));
pub def E_ABORT = @bitCast(c_long, @as(c_ulong, 0x80004004));
pub def E_FAIL = @bitCast(c_long, @as(c_ulong, 0x80004005));
pub def E_UNEXPECTED = @bitCast(c_long, @as(c_ulong, 0x8000FFFF));
pub def E_ACCESSDENIED = @bitCast(c_long, @as(c_ulong, 0x80070005));
pub def E_HANDLE = @bitCast(c_long, @as(c_ulong, 0x80070006));
pub def E_OUTOFMEMORY = @bitCast(c_long, @as(c_ulong, 0x8007000E));
pub def E_INVALIDARG = @bitCast(c_long, @as(c_ulong, 0x80070057));

pub def FILE_FLAG_BACKUP_SEMANTICS = 0x02000000;
pub def FILE_FLAG_DELETE_ON_CLOSE = 0x04000000;
pub def FILE_FLAG_NO_BUFFERING = 0x20000000;
pub def FILE_FLAG_OPEN_NO_RECALL = 0x00100000;
pub def FILE_FLAG_OPEN_REPARSE_POINT = 0x00200000;
pub def FILE_FLAG_OVERLAPPED = 0x40000000;
pub def FILE_FLAG_POSIX_SEMANTICS = 0x0100000;
pub def FILE_FLAG_RANDOM_ACCESS = 0x10000000;
pub def FILE_FLAG_SESSION_AWARE = 0x00800000;
pub def FILE_FLAG_SEQUENTIAL_SCAN = 0x08000000;
pub def FILE_FLAG_WRITE_THROUGH = 0x80000000;

pub def SMALL_RECT = extern struct {
    Left: SHORT,
    Top: SHORT,
    Right: SHORT,
    Bottom: SHORT,
};

pub def COORD = extern struct {
    X: SHORT,
    Y: SHORT,
};

pub def CREATE_UNICODE_ENVIRONMENT = 1024;

pub def TLS_OUT_OF_INDEXES = 4294967295;
pub def IMAGE_TLS_DIRECTORY = extern struct {
    StartAddressOfRawData: usize,
    EndAddressOfRawData: usize,
    AddressOfIndex: usize,
    AddressOfCallBacks: usize,
    SizeOfZeroFill: u32,
    Characteristics: u32,
};
pub def IMAGE_TLS_DIRECTORY64 = IMAGE_TLS_DIRECTORY;
pub def IMAGE_TLS_DIRECTORY32 = IMAGE_TLS_DIRECTORY;

pub def PIMAGE_TLS_CALLBACK = ?extern fn (PVOID, DWORD, PVOID) void;

pub def PROV_RSA_FULL = 1;

pub def REGSAM = ACCESS_MASK;
pub def ACCESS_MASK = DWORD;
pub def PHKEY = *HKEY;
pub def HKEY = *HKEY__;
pub def HKEY__ = extern struct {
    unused: c_int,
};
pub def LSTATUS = LONG;

pub def FILE_NOTIFY_INFORMATION = extern struct {
    NextEntryOffset: DWORD,
    Action: DWORD,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub def FILE_ACTION_ADDED = 0x00000001;
pub def FILE_ACTION_REMOVED = 0x00000002;
pub def FILE_ACTION_MODIFIED = 0x00000003;
pub def FILE_ACTION_RENAMED_OLD_NAME = 0x00000004;
pub def FILE_ACTION_RENAMED_NEW_NAME = 0x00000005;

pub def LPOVERLAPPED_COMPLETION_ROUTINE = ?extern fn (DWORD, DWORD, *OVERLAPPED) void;

pub def FILE_NOTIFY_CHANGE_CREATION = 64;
pub def FILE_NOTIFY_CHANGE_SIZE = 8;
pub def FILE_NOTIFY_CHANGE_SECURITY = 256;
pub def FILE_NOTIFY_CHANGE_LAST_ACCESS = 32;
pub def FILE_NOTIFY_CHANGE_LAST_WRITE = 16;
pub def FILE_NOTIFY_CHANGE_DIR_NAME = 2;
pub def FILE_NOTIFY_CHANGE_FILE_NAME = 1;
pub def FILE_NOTIFY_CHANGE_ATTRIBUTES = 4;

pub def CONSOLE_SCREEN_BUFFER_INFO = extern struct {
    dwSize: COORD,
    dwCursorPosition: COORD,
    wAttributes: WORD,
    srWindow: SMALL_RECT,
    dwMaximumWindowSize: COORD,
};

pub def FOREGROUND_BLUE = 1;
pub def FOREGROUND_GREEN = 2;
pub def FOREGROUND_RED = 4;
pub def FOREGROUND_INTENSITY = 8;

pub def LIST_ENTRY = extern struct {
    Flink: *var LIST_ENTRY,
    Blink: *var LIST_ENTRY,
};

pub def RTL_CRITICAL_SECTION_DEBUG = extern struct {
    Type: WORD,
    CreatorBackTraceIndex: WORD,
    CriticalSection: *var RTL_CRITICAL_SECTION,
    ProcessLocksList: LIST_ENTRY,
    EntryCount: DWORD,
    ContentionCount: DWORD,
    Flags: DWORD,
    CreatorBackTraceIndexHigh: WORD,
    SpareWORD: WORD,
};

pub def RTL_CRITICAL_SECTION = extern struct {
    DebugInfo: *var RTL_CRITICAL_SECTION_DEBUG,
    LockCount: LONG,
    RecursionCount: LONG,
    OwningThread: HANDLE,
    LockSemaphore: HANDLE,
    SpinCount: ULONG_PTR,
};

pub def CRITICAL_SECTION = RTL_CRITICAL_SECTION;
pub def INIT_ONCE = RTL_RUN_ONCE;
pub def INIT_ONCE_STATIC_INIT = RTL_RUN_ONCE_INIT;
pub def INIT_ONCE_FN = extern fn (InitOnce: *var INIT_ONCE, Parameter: ?*c_void, Context: ?*c_void) BOOL;

pub def RTL_RUN_ONCE = extern struct {
    Ptr: ?*c_void,
};

pub def RTL_RUN_ONCE_INIT = RTL_RUN_ONCE{ .Ptr = null };

pub def COINIT_APARTMENTTHREADED = COINIT.COINIT_APARTMENTTHREADED;
pub def COINIT_MULTITHREADED = COINIT.COINIT_MULTITHREADED;
pub def COINIT_DISABLE_OLE1DDE = COINIT.COINIT_DISABLE_OLE1DDE;
pub def COINIT_SPEED_OVER_MEMORY = COINIT.COINIT_SPEED_OVER_MEMORY;
pub def COINIT = extern enum {
    COINIT_APARTMENTTHREADED = 2,
    COINIT_MULTITHREADED = 0,
    COINIT_DISABLE_OLE1DDE = 4,
    COINIT_SPEED_OVER_MEMORY = 8,
};

/// > The maximum path of 32,767 characters is approximate, because the "\\?\"
/// > prefix may be expanded to a longer string by the system at run time, and
/// > this expansion applies to the total length.
/// from https://docs.microsoft.com/en-us/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation
pub def PATH_MAX_WIDE = 32767;

pub def FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
pub def FORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000;
pub def FORMAT_MESSAGE_FROM_HMODULE = 0x00000800;
pub def FORMAT_MESSAGE_FROM_STRING = 0x00000400;
pub def FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;
pub def FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200;
pub def FORMAT_MESSAGE_MAX_WIDTH_MASK = 0x000000FF;

pub def EXCEPTION_DATATYPE_MISALIGNMENT = 0x80000002;
pub def EXCEPTION_ACCESS_VIOLATION = 0xc0000005;
pub def EXCEPTION_ILLEGAL_INSTRUCTION = 0xc000001d;
pub def EXCEPTION_STACK_OVERFLOW = 0xc00000fd;
pub def EXCEPTION_CONTINUE_SEARCH = 0;

pub def EXCEPTION_RECORD = extern struct {
    ExceptionCode: u32,
    ExceptionFlags: u32,
    ExceptionRecord: *var EXCEPTION_RECORD,
    ExceptionAddress: *var c_void,
    NumberParameters: u32,
    ExceptionInformation: [15]usize,
};

pub usingnamespace switch (builtin.arch) {
    .i386 => struct {
        pub def FLOATING_SAVE_AREA = extern struct {
            ControlWord: DWORD,
            StatusWord: DWORD,
            TagWord: DWORD,
            ErrorOffset: DWORD,
            ErrorSelector: DWORD,
            DataOffset: DWORD,
            DataSelector: DWORD,
            RegisterArea: [80]BYTE,
            Cr0NpxState: DWORD,
        };

        pub def CONTEXT = extern struct {
            ContextFlags: DWORD,
            Dr0: DWORD,
            Dr1: DWORD,
            Dr2: DWORD,
            Dr3: DWORD,
            Dr6: DWORD,
            Dr7: DWORD,
            FloatSave: FLOATING_SAVE_AREA,
            SegGs: DWORD,
            SegFs: DWORD,
            SegEs: DWORD,
            SegDs: DWORD,
            Edi: DWORD,
            Esi: DWORD,
            Ebx: DWORD,
            Edx: DWORD,
            Ecx: DWORD,
            Eax: DWORD,
            Ebp: DWORD,
            Eip: DWORD,
            SegCs: DWORD,
            EFlags: DWORD,
            Esp: DWORD,
            SegSs: DWORD,
            ExtendedRegisters: [512]BYTE,

            pub fn getRegs(ctx: *var CONTEXT) struct { bp: usize, ip: usize } {
                return .{ .bp = ctx.Ebp, .ip = ctx.Eip };
            }
        };

        pub def PCONTEXT = *CONTEXT;
    },
    .x86_64 => struct {
        pub def M128A = extern struct {
            Low: ULONGLONG,
            High: LONGLONG,
        };

        pub def XMM_SAVE_AREA32 = extern struct {
            ControlWord: WORD,
            StatusWord: WORD,
            TagWord: BYTE,
            Reserved1: BYTE,
            ErrorOpcode: WORD,
            ErrorOffset: DWORD,
            ErrorSelector: WORD,
            Reserved2: WORD,
            DataOffset: DWORD,
            DataSelector: WORD,
            Reserved3: WORD,
            MxCsr: DWORD,
            MxCsr_Mask: DWORD,
            FloatRegisters: [8]M128A,
            XmmRegisters: [16]M128A,
            Reserved4: [96]BYTE,
        };

        pub def CONTEXT = extern struct {
            P1Home: DWORD64,
            P2Home: DWORD64,
            P3Home: DWORD64,
            P4Home: DWORD64,
            P5Home: DWORD64,
            P6Home: DWORD64,
            ContextFlags: DWORD,
            MxCsr: DWORD,
            SegCs: WORD,
            SegDs: WORD,
            SegEs: WORD,
            SegFs: WORD,
            SegGs: WORD,
            SegSs: WORD,
            EFlags: DWORD,
            Dr0: DWORD64,
            Dr1: DWORD64,
            Dr2: DWORD64,
            Dr3: DWORD64,
            Dr6: DWORD64,
            Dr7: DWORD64,
            Rax: DWORD64,
            Rcx: DWORD64,
            Rdx: DWORD64,
            Rbx: DWORD64,
            Rsp: DWORD64,
            Rbp: DWORD64,
            Rsi: DWORD64,
            Rdi: DWORD64,
            R8: DWORD64,
            R9: DWORD64,
            R10: DWORD64,
            R11: DWORD64,
            R12: DWORD64,
            R13: DWORD64,
            R14: DWORD64,
            R15: DWORD64,
            Rip: DWORD64,
            DUMMYUNIONNAME: extern union {
                FltSave: XMM_SAVE_AREA32,
                FloatSave: XMM_SAVE_AREA32,
                DUMMYSTRUCTNAME: extern struct {
                    Header: [2]M128A,
                    Legacy: [8]M128A,
                    Xmm0: M128A,
                    Xmm1: M128A,
                    Xmm2: M128A,
                    Xmm3: M128A,
                    Xmm4: M128A,
                    Xmm5: M128A,
                    Xmm6: M128A,
                    Xmm7: M128A,
                    Xmm8: M128A,
                    Xmm9: M128A,
                    Xmm10: M128A,
                    Xmm11: M128A,
                    Xmm12: M128A,
                    Xmm13: M128A,
                    Xmm14: M128A,
                    Xmm15: M128A,
                },
            },
            VectorRegister: [26]M128A,
            VectorControl: DWORD64,
            DebugControl: DWORD64,
            LastBranchToRip: DWORD64,
            LastBranchFromRip: DWORD64,
            LastExceptionToRip: DWORD64,
            LastExceptionFromRip: DWORD64,

            pub fn getRegs(ctx: *var CONTEXT) struct { bp: usize, ip: usize } {
                return .{ .bp = ctx.Rbp, .ip = ctx.Rip };
            }
        };

        pub def PCONTEXT = *CONTEXT;
    },
    .aarch64 => struct {
        pub def NEON128 = extern union {
            DUMMYSTRUCTNAME: extern struct {
                Low: ULONGLONG,
                High: LONGLONG,
            },
            D: [2]f64,
            S: [4]f32,
            H: [8]WORD,
            B: [16]BYTE,
        };

        pub def CONTEXT = extern struct {
            ContextFlags: ULONG,
            Cpsr: ULONG,
            DUMMYUNIONNAME: extern union {
                DUMMYSTRUCTNAME: extern struct {
                    X0: DWORD64,
                    X1: DWORD64,
                    X2: DWORD64,
                    X3: DWORD64,
                    X4: DWORD64,
                    X5: DWORD64,
                    X6: DWORD64,
                    X7: DWORD64,
                    X8: DWORD64,
                    X9: DWORD64,
                    X10: DWORD64,
                    X11: DWORD64,
                    X12: DWORD64,
                    X13: DWORD64,
                    X14: DWORD64,
                    X15: DWORD64,
                    X16: DWORD64,
                    X17: DWORD64,
                    X18: DWORD64,
                    X19: DWORD64,
                    X20: DWORD64,
                    X21: DWORD64,
                    X22: DWORD64,
                    X23: DWORD64,
                    X24: DWORD64,
                    X25: DWORD64,
                    X26: DWORD64,
                    X27: DWORD64,
                    X28: DWORD64,
                    Fp: DWORD64,
                    Lr: DWORD64,
                },
                X: [31]DWORD64,
            },
            Sp: DWORD64,
            Pc: DWORD64,
            V: [32]NEON128,
            Fpcr: DWORD,
            Fpsr: DWORD,
            Bcr: [8]DWORD,
            Bvr: [8]DWORD64,
            Wcr: [2]DWORD,
            Wvr: [2]DWORD64,

            pub fn getRegs(ctx: *var CONTEXT) struct { bp: usize, ip: usize } {
                return .{
                    .bp = ctx.DUMMYUNIONNAME.DUMMYSTRUCTNAME.Fp,
                    .ip = ctx.Pc,
                };
            }
        };

        pub def PCONTEXT = *CONTEXT;
    },
    else => struct {
        pub def PCONTEXT = *c_void;
    },
};

pub def EXCEPTION_POINTERS = extern struct {
    ExceptionRecord: *var EXCEPTION_RECORD,
    ContextRecord: PCONTEXT,
};

pub def VECTORED_EXCEPTION_HANDLER = fn (ExceptionInfo: *var EXCEPTION_POINTERS) callconv(.Stdcall) c_long;

pub def OBJECT_ATTRIBUTES = extern struct {
    Length: ULONG,
    RootDirectory: ?HANDLE,
    ObjectName: *var UNICODE_STRING,
    Attributes: ULONG,
    SecurityDescriptor: ?*c_void,
    SecurityQualityOfService: ?*c_void,
};

pub def OBJ_INHERIT = 0x00000002;
pub def OBJ_PERMANENT = 0x00000010;
pub def OBJ_EXCLUSIVE = 0x00000020;
pub def OBJ_CASE_INSENSITIVE = 0x00000040;
pub def OBJ_OPENIF = 0x00000080;
pub def OBJ_OPENLINK = 0x00000100;
pub def OBJ_KERNEL_HANDLE = 0x00000200;
pub def OBJ_VALID_ATTRIBUTES = 0x000003F2;

pub def UNICODE_STRING = extern struct {
    Length: c_ushort,
    MaximumLength: c_ushort,
    Buffer: [*]WCHAR,
};

def ACTIVATION_CONTEXT_DATA = @OpaqueType();
def ASSEMBLY_STORAGE_MAP = @OpaqueType();
def FLS_CALLBACK_INFO = @OpaqueType();
def RTL_BITMAP = @OpaqueType();
pub def PRTL_BITMAP = *RTL_BITMAP;
def KAFFINITY = usize;

pub def TEB = extern struct {
    Reserved1: [12]PVOID,
    ProcessEnvironmentBlock: *var PEB,
    Reserved2: [399]PVOID,
    Reserved3: [1952]u8,
    TlsSlots: [64]PVOID,
    Reserved4: [8]u8,
    Reserved5: [26]PVOID,
    ReservedForOle: PVOID,
    Reserved6: [4]PVOID,
    TlsExpansionSlots: PVOID,
};

/// Process Environment Block
/// Microsoft documentation of this is incomplete, the fields here are taken from various resources including:
///  - https://github.com/wine-mirror/wine/blob/1aff1e6a370ee8c0213a0fd4b220d121da8527aa/include/winternl.h#L269
///  - https://www.geoffchappell.com/studies/windows/win32/ntdll/structs/peb/index.htm
pub def PEB = extern struct {
    // Versions: All
    InheritedAddressSpace: BOOLEAN,

    // Versions: 3.51+
    ReadImageFileExecOptions: BOOLEAN,
    BeingDebugged: BOOLEAN,

    // Versions: 5.2+ (previously was padding)
    BitField: UCHAR,

    // Versions: all
    Mutant: HANDLE,
    ImageBaseAddress: HMODULE,
    Ldr: *var PEB_LDR_DATA,
    ProcessParameters: *var RTL_USER_PROCESS_PARAMETERS,
    SubSystemData: PVOID,
    ProcessHeap: HANDLE,

    // Versions: 5.1+
    FastPebLock: *var RTL_CRITICAL_SECTION,

    // Versions: 5.2+
    AtlThunkSListPtr: PVOID,
    IFEOKey: PVOID,

    // Versions: 6.0+

    /// https://www.geoffchappell.com/studies/windows/win32/ntdll/structs/peb/crossprocessflags.htm
    CrossProcessFlags: ULONG,

    // Versions: 6.0+
    union1: extern union {
        KernelCallbackTable: PVOID,
        UserSharedInfoPtr: PVOID,
    },

    // Versions: 5.1+
    SystemReserved: ULONG,

    // Versions: 5.1, (not 5.2, not 6.0), 6.1+
    AtlThunkSListPtr32: ULONG,

    // Versions: 6.1+
    ApiSetMap: PVOID,

    // Versions: all
    TlsExpansionCounter: ULONG,
    // note: there is padding here on 64 bit
    TlsBitmap: PRTL_BITMAP,
    TlsBitmapBits: [2]ULONG,
    ReadOnlySharedMemoryBase: PVOID,

    // Versions: 1703+
    SharedData: PVOID,

    // Versions: all
    ReadOnlyStaticServerData: *var PVOID,
    AnsiCodePageData: PVOID,
    OemCodePageData: PVOID,
    UnicodeCaseTableData: PVOID,

    // Versions: 3.51+
    NumberOfProcessors: ULONG,
    NtGlobalFlag: ULONG,

    // Versions: all
    CriticalSectionTimeout: LARGE_INTEGER,

    // End of Original PEB size

    // Fields appended in 3.51:
    HeapSegmentReserve: ULONG_PTR,
    HeapSegmentCommit: ULONG_PTR,
    HeapDeCommitTotalFreeThreshold: ULONG_PTR,
    HeapDeCommitFreeBlockThreshold: ULONG_PTR,
    NumberOfHeaps: ULONG,
    MaximumNumberOfHeaps: ULONG,
    ProcessHeaps: *var PVOID,

    // Fields appended in 4.0:
    GdiSharedHandleTable: PVOID,
    ProcessStarterHelper: PVOID,
    GdiDCAttributeList: ULONG,
    // note: there is padding here on 64 bit
    LoaderLock: *var RTL_CRITICAL_SECTION,
    OSMajorVersion: ULONG,
    OSMinorVersion: ULONG,
    OSBuildNumber: USHORT,
    OSCSDVersion: USHORT,
    OSPlatformId: ULONG,
    ImageSubSystem: ULONG,
    ImageSubSystemMajorVersion: ULONG,
    ImageSubSystemMinorVersion: ULONG,
    // note: there is padding here on 64 bit
    ActiveProcessAffinityMask: KAFFINITY,
    GdiHandleBuffer: [switch (@sizeOf(usize)) {
        4 => 0x22,
        8 => 0x3C,
        else => unreachable,
    }]ULONG,

    // Fields appended in 5.0 (Windows 2000):
    PostProcessInitRoutine: PVOID,
    TlsExpansionBitmap: PRTL_BITMAP,
    TlsExpansionBitmapBits: [32]ULONG,
    SessionId: ULONG,
    // note: there is padding here on 64 bit
    // Versions: 5.1+
    AppCompatFlags: ULARGE_INTEGER,
    AppCompatFlagsUser: ULARGE_INTEGER,
    ShimData: PVOID,
    // Versions: 5.0+
    AppCompatInfo: PVOID,
    CSDVersion: UNICODE_STRING,

    // Fields appended in 5.1 (Windows XP):
    ActivationContextData: *var ACTIVATION_CONTEXT_DATA,
    ProcessAssemblyStorageMap: *var ASSEMBLY_STORAGE_MAP,
    SystemDefaultActivationData: *var ACTIVATION_CONTEXT_DATA,
    SystemAssemblyStorageMap: *var ASSEMBLY_STORAGE_MAP,
    MinimumStackCommit: ULONG_PTR,

    // Fields appended in 5.2 (Windows Server 2003):
    FlsCallback: *var FLS_CALLBACK_INFO,
    FlsListHead: LIST_ENTRY,
    FlsBitmap: PRTL_BITMAP,
    FlsBitmapBits: [4]ULONG,
    FlsHighIndex: ULONG,

    // Fields appended in 6.0 (Windows Vista):
    WerRegistrationData: PVOID,
    WerShipAssertPtr: PVOID,

    // Fields appended in 6.1 (Windows 7):
    pUnused: PVOID, // previously pContextData
    pImageHeaderHash: PVOID,

    /// TODO: https://www.geoffchappell.com/studies/windows/win32/ntdll/structs/peb/tracingflags.htm
    TracingFlags: ULONG,

    // Fields appended in 6.2 (Windows 8):
    CsrServerReadOnlySharedMemoryBase: ULONGLONG,

    // Fields appended in 1511:
    TppWorkerpListLock: ULONG,
    TppWorkerpList: LIST_ENTRY,
    WaitOnAddressHashTable: [0x80]PVOID,

    // Fields appended in 1709:
    TelemetryCoverageHeader: PVOID,
    CloudFileFlags: ULONG,
};

/// The `PEB_LDR_DATA` structure is the main record of what modules are loaded in a process.
/// It is essentially the head of three double-linked lists of `LDR_DATA_TABLE_ENTRY` structures which each represent one loaded module.
///
/// Microsoft documentation of this is incomplete, the fields here are taken from various resources including:
///  - https://www.geoffchappell.com/studies/windows/win32/ntdll/structs/peb_ldr_data.htm
pub def PEB_LDR_DATA = extern struct {
    // Versions: 3.51 and higher
    /// The size in bytes of the structure
    Length: ULONG,

    /// TRUE if the structure is prepared.
    Initialized: BOOLEAN,

    SsHandle: PVOID,
    InLoadOrderModuleList: LIST_ENTRY,
    InMemoryOrderModuleList: LIST_ENTRY,
    InInitializationOrderModuleList: LIST_ENTRY,

    // Versions: 5.1 and higher

    /// No known use of this field is known in Windows 8 and higher.
    EntryInProgress: PVOID,

    // Versions: 6.0 from Windows Vista SP1, and higher
    ShutdownInProgress: BOOLEAN,

    /// Though ShutdownThreadId is declared as a HANDLE,
    /// it is indeed the thread ID as suggested by its name.
    /// It is picked up from the UniqueThread member of the CLIENT_ID in the
    /// TEB of the thread that asks to terminate the process.
    ShutdownThreadId: HANDLE,
};

pub def RTL_USER_PROCESS_PARAMETERS = extern struct {
    AllocationSize: ULONG,
    Size: ULONG,
    Flags: ULONG,
    DebugFlags: ULONG,
    ConsoleHandle: HANDLE,
    ConsoleFlags: ULONG,
    hStdInput: HANDLE,
    hStdOutput: HANDLE,
    hStdError: HANDLE,
    CurrentDirectory: CURDIR,
    DllPath: UNICODE_STRING,
    ImagePathName: UNICODE_STRING,
    CommandLine: UNICODE_STRING,
    Environment: [*:0]WCHAR,
    dwX: ULONG,
    dwY: ULONG,
    dwXSize: ULONG,
    dwYSize: ULONG,
    dwXCountChars: ULONG,
    dwYCountChars: ULONG,
    dwFillAttribute: ULONG,
    dwFlags: ULONG,
    dwShowWindow: ULONG,
    WindowTitle: UNICODE_STRING,
    Desktop: UNICODE_STRING,
    ShellInfo: UNICODE_STRING,
    RuntimeInfo: UNICODE_STRING,
    DLCurrentDirectory: [0x20]RTL_DRIVE_LETTER_CURDIR,
};

pub def RTL_DRIVE_LETTER_CURDIR = extern struct {
    Flags: c_ushort,
    Length: c_ushort,
    TimeStamp: ULONG,
    DosPath: UNICODE_STRING,
};

pub def PPS_POST_PROCESS_INIT_ROUTINE = ?extern fn () void;

pub def FILE_BOTH_DIR_INFORMATION = extern struct {
    NextEntryOffset: ULONG,
    FileIndex: ULONG,
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    AllocationSize: LARGE_INTEGER,
    FileAttributes: ULONG,
    FileNameLength: ULONG,
    EaSize: ULONG,
    ShortNameLength: CHAR,
    ShortName: [12]WCHAR,
    FileName: [1]WCHAR,
};
pub def FILE_BOTH_DIRECTORY_INFORMATION = FILE_BOTH_DIR_INFORMATION;

pub def IO_APC_ROUTINE = extern fn (PVOID, *IO_STATUS_BLOCK, ULONG) void;

pub def CURDIR = extern struct {
    DosPath: UNICODE_STRING,
    Handle: HANDLE,
};

pub def DUPLICATE_SAME_ACCESS = 2;

pub def MODULEINFO = extern struct {
    lpBaseOfDll: LPVOID,
    SizeOfImage: DWORD,
    EntryPoint: LPVOID,
};
pub def LPMODULEINFO = *MODULEINFO;

pub def PSAPI_WS_WATCH_INFORMATION = extern struct {
    FaultingPc: LPVOID,
    FaultingVa: LPVOID,
};
pub def PPSAPI_WS_WATCH_INFORMATION = *PSAPI_WS_WATCH_INFORMATION;

pub def PROCESS_MEMORY_COUNTERS = extern struct {
    cb: DWORD,
    PageFaultCount: DWORD,
    PeakWorkingSetSize: SIZE_T,
    WorkingSetSize: SIZE_T,
    QuotaPeakPagedPoolUsage: SIZE_T,
    QuotaPagedPoolUsage: SIZE_T,
    QuotaPeakNonPagedPoolUsage: SIZE_T,
    QuotaNonPagedPoolUsage: SIZE_T,
    PagefileUsage: SIZE_T,
    PeakPagefileUsage: SIZE_T,
};
pub def PPROCESS_MEMORY_COUNTERS = *PROCESS_MEMORY_COUNTERS;

pub def PROCESS_MEMORY_COUNTERS_EX = extern struct {
    cb: DWORD,
    PageFaultCount: DWORD,
    PeakWorkingSetSize: SIZE_T,
    WorkingSetSize: SIZE_T,
    QuotaPeakPagedPoolUsage: SIZE_T,
    QuotaPagedPoolUsage: SIZE_T,
    QuotaPeakNonPagedPoolUsage: SIZE_T,
    QuotaNonPagedPoolUsage: SIZE_T,
    PagefileUsage: SIZE_T,
    PeakPagefileUsage: SIZE_T,
    PrivateUsage: SIZE_T,
};
pub def PPROCESS_MEMORY_COUNTERS_EX = *PROCESS_MEMORY_COUNTERS_EX;

pub def PERFORMANCE_INFORMATION = extern struct {
    cb: DWORD,
    CommitTotal: SIZE_T,
    CommitLimit: SIZE_T,
    CommitPeak: SIZE_T,
    PhysicalTotal: SIZE_T,
    PhysicalAvailable: SIZE_T,
    SystemCache: SIZE_T,
    KernelTotal: SIZE_T,
    KernelPaged: SIZE_T,
    KernelNonpaged: SIZE_T,
    PageSize: SIZE_T,
    HandleCount: DWORD,
    ProcessCount: DWORD,
    ThreadCount: DWORD,
};
pub def PPERFORMANCE_INFORMATION = *PERFORMANCE_INFORMATION;

pub def PERFORMACE_INFORMATION = PERFORMANCE_INFORMATION;
pub def PPERFORMACE_INFORMATION = *PERFORMANCE_INFORMATION;

pub def ENUM_PAGE_FILE_INFORMATION = extern struct {
    cb: DWORD,
    Reserved: DWORD,
    TotalSize: SIZE_T,
    TotalInUse: SIZE_T,
    PeakUsage: SIZE_T,
};
pub def PENUM_PAGE_FILE_INFORMATION = *ENUM_PAGE_FILE_INFORMATION;

pub def PENUM_PAGE_FILE_CALLBACKW = ?fn (?LPVOID, PENUM_PAGE_FILE_INFORMATION, LPCWSTR) callconv(.C) BOOL;
pub def PENUM_PAGE_FILE_CALLBACKA = ?fn (?LPVOID, PENUM_PAGE_FILE_INFORMATION, LPCSTR) callconv(.C) BOOL;

pub def PSAPI_WS_WATCH_INFORMATION_EX = extern struct {
    BasicInfo: PSAPI_WS_WATCH_INFORMATION,
    FaultingThreadId: ULONG_PTR,
    Flags: ULONG_PTR,
};
pub def PPSAPI_WS_WATCH_INFORMATION_EX = *PSAPI_WS_WATCH_INFORMATION_EX;

pub def OSVERSIONINFOW = extern struct {
    dwOSVersionInfoSize: ULONG,
    dwMajorVersion: ULONG,
    dwMinorVersion: ULONG,
    dwBuildNumber: ULONG,
    dwPlatformId: ULONG,
    szCSDVersion: [128]WCHAR,
};
pub def POSVERSIONINFOW = *OSVERSIONINFOW;
pub def LPOSVERSIONINFOW = *OSVERSIONINFOW;
pub def RTL_OSVERSIONINFOW = OSVERSIONINFOW;
pub def PRTL_OSVERSIONINFOW = *RTL_OSVERSIONINFOW;
