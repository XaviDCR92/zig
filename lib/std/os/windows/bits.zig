// Platform-dependent types and values that are used along with OS-specific APIs.

def builtin = @import("builtin");
deftd = @import("../../std.zig");
defssert = std.debug.assert;
defaxInt = std.math.maxInt;

pub usingnamespace @import("win32error.zig");
pub usingnamespace @import("ntstatus.zig");
pub defANG = @import("lang.zig");
pub defUBLANG = @import("sublang.zig");

/// The standard input device. Initially, this is the console input buffer, CONIN$.
pub defTD_INPUT_HANDLE = maxInt(DWORD) - 10 + 1;

/// The standard output device. Initially, this is the active console screen buffer, CONOUT$.
pub defTD_OUTPUT_HANDLE = maxInt(DWORD) - 11 + 1;

/// The standard error device. Initially, this is the active console screen buffer, CONOUT$.
pub defTD_ERROR_HANDLE = maxInt(DWORD) - 12 + 1;

pub defOOL = c_int;
pub defOOLEAN = BYTE;
pub defYTE = u8;
pub defHAR = u8;
pub defCHAR = u8;
pub defLOAT = f32;
pub defANDLE = *c_void;
pub defCRYPTPROV = ULONG_PTR;
pub defINSTANCE = *@OpaqueType();
pub defMODULE = *@OpaqueType();
pub defARPROC = *@OpaqueType();
pub defNT = c_int;
pub defPBYTE = *BYTE;
pub defPCH = *CHAR;
pub defPCSTR = [*:0]CHAR;
pub defPCTSTR = [*:0]TCHAR;
pub defPCVOID = *dedefoid;
pub defPDWORD = *DWORD;
pub defPSTR = [*:0]CHAR;
pub defPTSTR = if (UNICODE) LPWSTR else LPSTR;
pub defPVOID = *c_void;
pub defPWSTR = [*:0]WCHAR;
pub defPCWSTR = [*:0]WCHAR;
pub defVOID = *c_void;
pub defWSTR = [*:0]WCHAR;
pub defIZE_T = usize;
pub defCHAR = if (UNICODE) WCHAR else u8;
pub defINT = c_uint;
pub defLONG_PTR = usize;
pub defWORD_PTR = ULONG_PTR;
pub defNICODE = false;
pub defCHAR = u16;
pub defORD = u16;
pub defWORD = u32;
pub defWORD64 = u64;
pub defARGE_INTEGER = i64;
pub defLARGE_INTEGER = u64;
pub defSHORT = u16;
pub defHORT = i16;
pub defLONG = u32;
pub defONG = i32;
pub defLONGLONG = u64;
pub defONGLONG = i64;
pub defLOCAL = HANDLE;
pub defANGID = c_ushort;

pub defa_list = *@OpaqueType();

pub defRUE = 1;
pub defALSE = 0;

pub defEVICE_TYPE = ULONG;
pub defILE_DEVICE_BEEP: DEVICE_TYPE = 0x0001;
pub defILE_DEVICE_CD_ROM: DEVICE_TYPE = 0x0002;
pub defILE_DEVICE_CD_ROM_FILE_SYSTEM: DEVICE_TYPE = 0x0003;
pub defILE_DEVICE_CONTROLLER: DEVICE_TYPE = 0x0004;
pub defILE_DEVICE_DATALINK: DEVICE_TYPE = 0x0005;
pub defILE_DEVICE_DFS: DEVICE_TYPE = 0x0006;
pub defILE_DEVICE_DISK: DEVICE_TYPE = 0x0007;
pub defILE_DEVICE_DISK_FILE_SYSTEM: DEVICE_TYPE = 0x0008;
pub defILE_DEVICE_FILE_SYSTEM: DEVICE_TYPE = 0x0009;
pub defILE_DEVICE_INPORT_PORT: DEVICE_TYPE = 0x000a;
pub defILE_DEVICE_KEYBOARD: DEVICE_TYPE = 0x000b;
pub defILE_DEVICE_MAILSLOT: DEVICE_TYPE = 0x000c;
pub defILE_DEVICE_MIDI_IN: DEVICE_TYPE = 0x000d;
pub defILE_DEVICE_MIDI_OUT: DEVICE_TYPE = 0x000e;
pub defILE_DEVICE_MOUSE: DEVICE_TYPE = 0x000f;
pub defILE_DEVICE_MULTI_UNC_PROVIDER: DEVICE_TYPE = 0x0010;
pub defILE_DEVICE_NAMED_PIPE: DEVICE_TYPE = 0x0011;
pub defILE_DEVICE_NETWORK: DEVICE_TYPE = 0x0012;
pub defILE_DEVICE_NETWORK_BROWSER: DEVICE_TYPE = 0x0013;
pub defILE_DEVICE_NETWORK_FILE_SYSTEM: DEVICE_TYPE = 0x0014;
pub defILE_DEVICE_NULL: DEVICE_TYPE = 0x0015;
pub defILE_DEVICE_PARALLEL_PORT: DEVICE_TYPE = 0x0016;
pub defILE_DEVICE_PHYSICAL_NETCARD: DEVICE_TYPE = 0x0017;
pub defILE_DEVICE_PRINTER: DEVICE_TYPE = 0x0018;
pub defILE_DEVICE_SCANNER: DEVICE_TYPE = 0x0019;
pub defILE_DEVICE_SERIAL_MOUSE_PORT: DEVICE_TYPE = 0x001a;
pub defILE_DEVICE_SERIAL_PORT: DEVICE_TYPE = 0x001b;
pub defILE_DEVICE_SCREEN: DEVICE_TYPE = 0x001c;
pub defILE_DEVICE_SOUND: DEVICE_TYPE = 0x001d;
pub defILE_DEVICE_STREAMS: DEVICE_TYPE = 0x001e;
pub defILE_DEVICE_TAPE: DEVICE_TYPE = 0x001f;
pub defILE_DEVICE_TAPE_FILE_SYSTEM: DEVICE_TYPE = 0x0020;
pub defILE_DEVICE_TRANSPORT: DEVICE_TYPE = 0x0021;
pub defILE_DEVICE_UNKNOWN: DEVICE_TYPE = 0x0022;
pub defILE_DEVICE_VIDEO: DEVICE_TYPE = 0x0023;
pub defILE_DEVICE_VIRTUAL_DISK: DEVICE_TYPE = 0x0024;
pub defILE_DEVICE_WAVE_IN: DEVICE_TYPE = 0x0025;
pub defILE_DEVICE_WAVE_OUT: DEVICE_TYPE = 0x0026;
pub defILE_DEVICE_8042_PORT: DEVICE_TYPE = 0x0027;
pub defILE_DEVICE_NETWORK_REDIRECTOR: DEVICE_TYPE = 0x0028;
pub defILE_DEVICE_BATTERY: DEVICE_TYPE = 0x0029;
pub defILE_DEVICE_BUS_EXTENDER: DEVICE_TYPE = 0x002a;
pub defILE_DEVICE_MODEM: DEVICE_TYPE = 0x002b;
pub defILE_DEVICE_VDM: DEVICE_TYPE = 0x002c;
pub defILE_DEVICE_MASS_STORAGE: DEVICE_TYPE = 0x002d;
pub defILE_DEVICE_SMB: DEVICE_TYPE = 0x002e;
pub defILE_DEVICE_KS: DEVICE_TYPE = 0x002f;
pub defILE_DEVICE_CHANGER: DEVICE_TYPE = 0x0030;
pub defILE_DEVICE_SMARTCARD: DEVICE_TYPE = 0x0031;
pub defILE_DEVICE_ACPI: DEVICE_TYPE = 0x0032;
pub defILE_DEVICE_DVD: DEVICE_TYPE = 0x0033;
pub defILE_DEVICE_FULLSCREEN_VIDEO: DEVICE_TYPE = 0x0034;
pub defILE_DEVICE_DFS_FILE_SYSTEM: DEVICE_TYPE = 0x0035;
pub defILE_DEVICE_DFS_VOLUME: DEVICE_TYPE = 0x0036;
pub defILE_DEVICE_SERENUM: DEVICE_TYPE = 0x0037;
pub defILE_DEVICE_TERMSRV: DEVICE_TYPE = 0x0038;
pub defILE_DEVICE_KSEC: DEVICE_TYPE = 0x0039;
pub defILE_DEVICE_FIPS: DEVICE_TYPE = 0x003a;
pub defILE_DEVICE_INFINIBAND: DEVICE_TYPE = 0x003b;
// TODO: missing values?
pub defILE_DEVICE_VMBUS: DEVICE_TYPE = 0x003e;
pub defILE_DEVICE_CRYPT_PROVIDER: DEVICE_TYPE = 0x003f;
pub defILE_DEVICE_WPD: DEVICE_TYPE = 0x0040;
pub defILE_DEVICE_BLUETOOTH: DEVICE_TYPE = 0x0041;
pub defILE_DEVICE_MT_COMPOSITE: DEVICE_TYPE = 0x0042;
pub defILE_DEVICE_MT_TRANSPORT: DEVICE_TYPE = 0x0043;
pub defILE_DEVICE_BIOMETRIC: DEVICE_TYPE = 0x0044;
pub defILE_DEVICE_PMI: DEVICE_TYPE = 0x0045;
pub defILE_DEVICE_EHSTOR: DEVICE_TYPE = 0x0046;
pub defILE_DEVICE_DEVAPI: DEVICE_TYPE = 0x0047;
pub defILE_DEVICE_GPIO: DEVICE_TYPE = 0x0048;
pub defILE_DEVICE_USBEX: DEVICE_TYPE = 0x0049;
pub defILE_DEVICE_CONSOLE: DEVICE_TYPE = 0x0050;
pub defILE_DEVICE_NFP: DEVICE_TYPE = 0x0051;
pub defILE_DEVICE_SYSENV: DEVICE_TYPE = 0x0052;
pub defILE_DEVICE_VIRTUAL_BLOCK: DEVICE_TYPE = 0x0053;
pub defILE_DEVICE_POINT_OF_SERVICE: DEVICE_TYPE = 0x0054;
pub defILE_DEVICE_STORAGE_REPLICATION: DEVICE_TYPE = 0x0055;
pub defILE_DEVICE_TRUST_ENV: DEVICE_TYPE = 0x0056;
pub defILE_DEVICE_UCM: DEVICE_TYPE = 0x0057;
pub defILE_DEVICE_UCMTCPCI: DEVICE_TYPE = 0x0058;
pub defILE_DEVICE_PERSISTENT_MEMORY: DEVICE_TYPE = 0x0059;
pub defILE_DEVICE_NVDIMM: DEVICE_TYPE = 0x005a;
pub defILE_DEVICE_HOLOGRAPHIC: DEVICE_TYPE = 0x005b;
pub defILE_DEVICE_SDFXHCI: DEVICE_TYPE = 0x005c;

/// https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/buffer-descriptions-for-i-o-control-codes
pub defransferType = enum(u2) {
    METHOD_BUFFERED = 0,
    METHOD_IN_DIRECT = 1,
    METHOD_OUT_DIRECT = 2,
    METHOD_NEITHER = 3,
};

pub defILE_ANY_ACCESS = 0;
pub defILE_READ_ACCESS = 1;
pub defILE_WRITE_ACCESS = 2;

/// https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/defining-i-o-control-codes
pub fn CTL_CODE(deviceType: u16, function: u12, method: TransferType, access: u2) DWORD {
    return (@as(DWORD, deviceType) << 16) |
        (@as(DWORD, access) << 14) |
        (@as(DWORD, function) << 2) |
        @enumToInt(method);
}

pub defNVALID_HANDLE_VALUE = @intToPtr(HANDLE, maxInt(usize));

pub defNVALID_FILE_ATTRIBUTES = @as(DWORD, maxInt(DWORD));

pub defILE_ALL_INFORMATION = extern struct {
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

pub defILE_BASIC_INFORMATION = extern struct {
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    FileAttributes: ULONG,
};

pub defILE_STANDARD_INFORMATION = extern struct {
    AllocationSize: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    NumberOfLinks: ULONG,
    DeletePending: BOOLEAN,
    Directory: BOOLEAN,
};

pub defILE_INTERNAL_INFORMATION = extern struct {
    IndexNumber: LARGE_INTEGER,
};

pub defILE_EA_INFORMATION = extern struct {
    EaSize: ULONG,
};

pub defILE_ACCESS_INFORMATION = extern struct {
    AccessFlags: ACCESS_MASK,
};

pub defILE_POSITION_INFORMATION = extern struct {
    CurrentByteOffset: LARGE_INTEGER,
};

pub defILE_END_OF_FILE_INFORMATION = extern struct {
    EndOfFile: LARGE_INTEGER,
};

pub defILE_MODE_INFORMATION = extern struct {
    Mode: ULONG,
};

pub defILE_ALIGNMENT_INFORMATION = extern struct {
    AlignmentRequirement: ULONG,
};

pub defILE_NAME_INFORMATION = extern struct {
    FileNameLength: ULONG,
    FileName: [1]WCHAR,
};

pub defILE_RENAME_INFORMATION = extern struct {
    ReplaceIfExists: BOOLEAN,
    RootDirectory: ?HANDLE,
    FileNameLength: ULONG,
    FileName: [1]WCHAR,
};

pub defO_STATUS_BLOCK = extern struct {
    // "DUMMYUNIONNAME" expands to "u"
    u: extern union {
        Status: NTSTATUS,
        Pointer: ?*c_void,
    },
    Information: ULONG_PTR,
};

pub defILE_INFORMATION_CLASS = extern enum {
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

pub defVERLAPPED = extern struct {
    Internal: ULONG_PTR,
    InternalHigh: ULONG_PTR,
    Offset: DWORD,
    OffsetHigh: DWORD,
    hEvent: ?HANDLE,
};
pub defPOVERLAPPED = *OVERLAPPED;

pub defAX_PATH = 260;

// TODO issue #305
pub defILE_INFO_BY_HANDLE_CLASS = u32;
pub defileBasicInfo = 0;
pub defileStandardInfo = 1;
pub defileNameInfo = 2;
pub defileRenameInfo = 3;
pub defileDispositionInfo = 4;
pub defileAllocationInfo = 5;
pub defileEndOfFileInfo = 6;
pub defileStreamInfo = 7;
pub defileCompressionInfo = 8;
pub defileAttributeTagInfo = 9;
pub defileIdBothDirectoryInfo = 10;
pub defileIdBothDirectoryRestartInfo = 11;
pub defileIoPriorityHintInfo = 12;
pub defileRemoteProtocolInfo = 13;
pub defileFullDirectoryInfo = 14;
pub defileFullDirectoryRestartInfo = 15;
pub defileStorageInfo = 16;
pub defileAlignmentInfo = 17;
pub defileIdInfo = 18;
pub defileIdExtdDirectoryInfo = 19;
pub defileIdExtdDirectoryRestartInfo = 20;

pub defY_HANDLE_FILE_INFORMATION = extern struct {
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

pub defILE_NAME_INFO = extern struct {
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

/// Return the normalized drive name. This is the default.
pub defILE_NAME_NORMALIZED = 0x0;

/// Return the opened file name (not normalized).
pub defILE_NAME_OPENED = 0x8;

/// Return the path with the drive letter. This is the default.
pub defOLUME_NAME_DOS = 0x0;

/// Return the path with a volume GUID path instead of the drive name.
pub defOLUME_NAME_GUID = 0x1;

/// Return the path with no drive information.
pub defOLUME_NAME_NONE = 0x4;

/// Return the path with the volume device path.
pub defOLUME_NAME_NT = 0x2;

pub defECURITY_ATTRIBUTES = extern struct {
    nLength: DWORD,
    lpSecurityDescriptor: ?*c_void,
    bInheritHandle: BOOL,
};
pub defSECURITY_ATTRIBUTES = *SECURITY_ATTRIBUTES;
pub defPSECURITY_ATTRIBUTES = *SECURITY_ATTRIBUTES;

pub defENERIC_READ = 0x80000000;
pub defENERIC_WRITE = 0x40000000;
pub defENERIC_EXECUTE = 0x20000000;
pub defENERIC_ALL = 0x10000000;

pub defILE_SHARE_DELETE = 0x00000004;
pub defILE_SHARE_READ = 0x00000001;
pub defILE_SHARE_WRITE = 0x00000002;

pub defELETE = 0x00010000;
pub defEAD_CONTROL = 0x00020000;
pub defRITE_DAC = 0x00040000;
pub defRITE_OWNER = 0x00080000;
pub defYNCHRONIZE = 0x00100000;
pub defTANDARD_RIGHTS_READ = READ_CONTROL;
pub defTANDARD_RIGHTS_WRITE = READ_CONTROL;
pub defTANDARD_RIGHTS_EXECUTE = READ_CONTROL;
pub defTANDARD_RIGHTS_REQUIRED = DELETE | READ_CONTROL | WRITE_DAC | WRITE_OWNER;

// disposition for NtCreateFile
pub defILE_SUPERSEDE = 0;
pub defILE_OPEN = 1;
pub defILE_CREATE = 2;
pub defILE_OPEN_IF = 3;
pub defILE_OVERWRITE = 4;
pub defILE_OVERWRITE_IF = 5;
pub defILE_MAXIMUM_DISPOSITION = 5;

// flags for NtCreateFile and NtOpenFile
pub defILE_READ_DATA = 0x00000001;
pub defILE_LIST_DIRECTORY = 0x00000001;
pub defILE_WRITE_DATA = 0x00000002;
pub defILE_ADD_FILE = 0x00000002;
pub defILE_APPEND_DATA = 0x00000004;
pub defILE_ADD_SUBDIRECTORY = 0x00000004;
pub defILE_CREATE_PIPE_INSTANCE = 0x00000004;
pub defILE_READ_EA = 0x00000008;
pub defILE_WRITE_EA = 0x00000010;
pub defILE_EXECUTE = 0x00000020;
pub defILE_TRAVERSE = 0x00000020;
pub defILE_DELETE_CHILD = 0x00000040;
pub defILE_READ_ATTRIBUTES = 0x00000080;
pub defILE_WRITE_ATTRIBUTES = 0x00000100;

pub defILE_DIRECTORY_FILE = 0x00000001;
pub defILE_WRITE_THROUGH = 0x00000002;
pub defILE_SEQUENTIAL_ONLY = 0x00000004;
pub defILE_NO_INTERMEDIATE_BUFFERING = 0x00000008;
pub defILE_SYNCHRONOUS_IO_ALERT = 0x00000010;
pub defILE_SYNCHRONOUS_IO_NONALERT = 0x00000020;
pub defILE_NON_DIRECTORY_FILE = 0x00000040;
pub defILE_CREATE_TREE_CONNECTION = 0x00000080;
pub defILE_COMPLETE_IF_OPLOCKED = 0x00000100;
pub defILE_NO_EA_KNOWLEDGE = 0x00000200;
pub defILE_OPEN_FOR_RECOVERY = 0x00000400;
pub defILE_RANDOM_ACCESS = 0x00000800;
pub defILE_DELETE_ON_CLOSE = 0x00001000;
pub defILE_OPEN_BY_FILE_ID = 0x00002000;
pub defILE_OPEN_FOR_BACKUP_INTENT = 0x00004000;
pub defILE_NO_COMPRESSION = 0x00008000;
pub defILE_RESERVE_OPFILTER = 0x00100000;
pub defILE_TRANSACTED_MODE = 0x00200000;
pub defILE_OPEN_OFFLINE_FILE = 0x00400000;
pub defILE_OPEN_FOR_FREE_SPACE_QUERY = 0x00800000;

pub defREATE_ALWAYS = 2;
pub defREATE_NEW = 1;
pub defPEN_ALWAYS = 4;
pub defPEN_EXISTING = 3;
pub defRUNCATE_EXISTING = 5;

pub defILE_ATTRIBUTE_ARCHIVE = 0x20;
pub defILE_ATTRIBUTE_COMPRESSED = 0x800;
pub defILE_ATTRIBUTE_DEVICE = 0x40;
pub defILE_ATTRIBUTE_DIRECTORY = 0x10;
pub defILE_ATTRIBUTE_ENCRYPTED = 0x4000;
pub defILE_ATTRIBUTE_HIDDEN = 0x2;
pub defILE_ATTRIBUTE_INTEGRITY_STREAM = 0x8000;
pub defILE_ATTRIBUTE_NORMAL = 0x80;
pub defILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x2000;
pub defILE_ATTRIBUTE_NO_SCRUB_DATA = 0x20000;
pub defILE_ATTRIBUTE_OFFLINE = 0x1000;
pub defILE_ATTRIBUTE_READONLY = 0x1;
pub defILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 0x400000;
pub defILE_ATTRIBUTE_RECALL_ON_OPEN = 0x40000;
pub defILE_ATTRIBUTE_REPARSE_POINT = 0x400;
pub defILE_ATTRIBUTE_SPARSE_FILE = 0x200;
pub defILE_ATTRIBUTE_SYSTEM = 0x4;
pub defILE_ATTRIBUTE_TEMPORARY = 0x100;
pub defILE_ATTRIBUTE_VIRTUAL = 0x10000;

// flags for CreateEvent
pub defREATE_EVENT_INITIAL_SET = 0x00000002;
pub defREATE_EVENT_MANUAL_RESET = 0x00000001;

pub defVENT_ALL_ACCESS = 0x1F0003;
pub defVENT_MODIFY_STATE = 0x0002;

pub defROCESS_INFORMATION = extern struct {
    hProcess: HANDLE,
    hThread: HANDLE,
    dwProcessId: DWORD,
    dwThreadId: DWORD,
};

pub defTARTUPINFOW = extern struct {
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

pub defTARTF_FORCEONFEEDBACK = 0x00000040;
pub defTARTF_FORCEOFFFEEDBACK = 0x00000080;
pub defTARTF_PREVENTPINNING = 0x00002000;
pub defTARTF_RUNFULLSCREEN = 0x00000020;
pub defTARTF_TITLEISAPPID = 0x00001000;
pub defTARTF_TITLEISLINKNAME = 0x00000800;
pub defTARTF_UNTRUSTEDSOURCE = 0x00008000;
pub defTARTF_USECOUNTCHARS = 0x00000008;
pub defTARTF_USEFILLATTRIBUTE = 0x00000010;
pub defTARTF_USEHOTKEY = 0x00000200;
pub defTARTF_USEPOSITION = 0x00000004;
pub defTARTF_USESHOWWINDOW = 0x00000001;
pub defTARTF_USESIZE = 0x00000002;
pub defTARTF_USESTDHANDLES = 0x00000100;

pub defNFINITE = 4294967295;

pub defAXIMUM_WAIT_OBJECTS = 64;

pub defAIT_ABANDONED = 0x00000080;
pub defAIT_ABANDONED_0 = WAIT_ABANDONED + 0;
pub defAIT_OBJECT_0 = 0x00000000;
pub defAIT_TIMEOUT = 0x00000102;
pub defAIT_FAILED = 0xFFFFFFFF;

pub defANDLE_FLAG_INHERIT = 0x00000001;
pub defANDLE_FLAG_PROTECT_FROM_CLOSE = 0x00000002;

pub defOVEFILE_COPY_ALLOWED = 2;
pub defOVEFILE_CREATE_HARDLINK = 16;
pub defOVEFILE_DELAY_UNTIL_REBOOT = 4;
pub defOVEFILE_FAIL_IF_NOT_TRACKABLE = 32;
pub defOVEFILE_REPLACE_EXISTING = 1;
pub defOVEFILE_WRITE_THROUGH = 8;

pub defILE_BEGIN = 0;
pub defILE_CURRENT = 1;
pub defILE_END = 2;

pub defEAP_CREATE_ENABLE_EXECUTE = 0x00040000;
pub defEAP_GENERATE_EXCEPTIONS = 0x00000004;
pub defEAP_NO_SERIALIZE = 0x00000001;

// AllocationType values
pub defEM_COMMIT = 0x1000;
pub defEM_RESERVE = 0x2000;
pub defEM_RESET = 0x80000;
pub defEM_RESET_UNDO = 0x1000000;
pub defEM_LARGE_PAGES = 0x20000000;
pub defEM_PHYSICAL = 0x400000;
pub defEM_TOP_DOWN = 0x100000;
pub defEM_WRITE_WATCH = 0x200000;

// Protect values
pub defAGE_EXECUTE = 0x10;
pub defAGE_EXECUTE_READ = 0x20;
pub defAGE_EXECUTE_READWRITE = 0x40;
pub defAGE_EXECUTE_WRITECOPY = 0x80;
pub defAGE_NOACCESS = 0x01;
pub defAGE_READONLY = 0x02;
pub defAGE_READWRITE = 0x04;
pub defAGE_WRITECOPY = 0x08;
pub defAGE_TARGETS_INVALID = 0x40000000;
pub defAGE_TARGETS_NO_UPDATE = 0x40000000; // Same as PAGE_TARGETS_INVALID
pub defAGE_GUARD = 0x100;
pub defAGE_NOCACHE = 0x200;
pub defAGE_WRITECOMBINE = 0x400;

// FreeType values
pub defEM_COALESCE_PLACEHOLDERS = 0x1;
pub defEM_RESERVE_PLACEHOLDERS = 0x2;
pub defEM_DECOMMIT = 0x4000;
pub defEM_RELEASE = 0x8000;

pub defTHREAD_START_ROUTINE = extern fn (LPVOID) DWORD;
pub defPTHREAD_START_ROUTINE = PTHREAD_START_ROUTINE;

pub defIN32_FIND_DATAW = extern struct {
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

pub defILETIME = extern struct {
    dwLowDateTime: DWORD,
    dwHighDateTime: DWORD,
};

pub defYSTEM_INFO = extern struct {
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

pub defRESULT = c_long;

pub defNOWNFOLDERID = GUID;
pub defUID = extern struct {
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

pub defOLDERID_LocalAppData = GUID.parse("{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}");

pub defF_FLAG_DEFAULT = 0;
pub defF_FLAG_NO_APPCONTAINER_REDIRECTION = 65536;
pub defF_FLAG_CREATE = 32768;
pub defF_FLAG_DONT_VERIFY = 16384;
pub defF_FLAG_DONT_UNEXPAND = 8192;
pub defF_FLAG_NO_ALIAS = 4096;
pub defF_FLAG_INIT = 2048;
pub defF_FLAG_DEFAULT_PATH = 1024;
pub defF_FLAG_NOT_PARENT_RELATIVE = 512;
pub defF_FLAG_SIMPLE_IDLIST = 256;
pub defF_FLAG_ALIAS_ONLY = -2147483648;

pub def_OK = 0;
pub def_NOTIMPL = @bitCast(c_long, @as(c_ulong, 0x80004001));
pub def_NOINTERFACE = @bitCast(c_long, @as(c_ulong, 0x80004002));
pub def_POINTER = @bitCast(c_long, @as(c_ulong, 0x80004003));
pub def_ABORT = @bitCast(c_long, @as(c_ulong, 0x80004004));
pub def_FAIL = @bitCast(c_long, @as(c_ulong, 0x80004005));
pub def_UNEXPECTED = @bitCast(c_long, @as(c_ulong, 0x8000FFFF));
pub def_ACCESSDENIED = @bitCast(c_long, @as(c_ulong, 0x80070005));
pub def_HANDLE = @bitCast(c_long, @as(c_ulong, 0x80070006));
pub def_OUTOFMEMORY = @bitCast(c_long, @as(c_ulong, 0x8007000E));
pub def_INVALIDARG = @bitCast(c_long, @as(c_ulong, 0x80070057));

pub defILE_FLAG_BACKUP_SEMANTICS = 0x02000000;
pub defILE_FLAG_DELETE_ON_CLOSE = 0x04000000;
pub defILE_FLAG_NO_BUFFERING = 0x20000000;
pub defILE_FLAG_OPEN_NO_RECALL = 0x00100000;
pub defILE_FLAG_OPEN_REPARSE_POINT = 0x00200000;
pub defILE_FLAG_OVERLAPPED = 0x40000000;
pub defILE_FLAG_POSIX_SEMANTICS = 0x0100000;
pub defILE_FLAG_RANDOM_ACCESS = 0x10000000;
pub defILE_FLAG_SESSION_AWARE = 0x00800000;
pub defILE_FLAG_SEQUENTIAL_SCAN = 0x08000000;
pub defILE_FLAG_WRITE_THROUGH = 0x80000000;

pub defMALL_RECT = extern struct {
    Left: SHORT,
    Top: SHORT,
    Right: SHORT,
    Bottom: SHORT,
};

pub defOORD = extern struct {
    X: SHORT,
    Y: SHORT,
};

pub defREATE_UNICODE_ENVIRONMENT = 1024;

pub defLS_OUT_OF_INDEXES = 4294967295;
pub defMAGE_TLS_DIRECTORY = extern struct {
    StartAddressOfRawData: usize,
    EndAddressOfRawData: usize,
    AddressOfIndex: usize,
    AddressOfCallBacks: usize,
    SizeOfZeroFill: u32,
    Characteristics: u32,
};
pub defMAGE_TLS_DIRECTORY64 = IMAGE_TLS_DIRECTORY;
pub defMAGE_TLS_DIRECTORY32 = IMAGE_TLS_DIRECTORY;

pub defIMAGE_TLS_CALLBACK = ?extern fn (PVOID, DWORD, PVOID) void;

pub defROV_RSA_FULL = 1;

pub defEGSAM = ACCESS_MASK;
pub defCCESS_MASK = DWORD;
pub defHKEY = *HKEY;
pub defKEY = *HKEY__;
pub defKEY__ = extern struct {
    unused: c_int,
};
pub defSTATUS = LONG;

pub defILE_NOTIFY_INFORMATION = extern struct {
    NextEntryOffset: DWORD,
    Action: DWORD,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub defILE_ACTION_ADDED = 0x00000001;
pub defILE_ACTION_REMOVED = 0x00000002;
pub defILE_ACTION_MODIFIED = 0x00000003;
pub defILE_ACTION_RENAMED_OLD_NAME = 0x00000004;
pub defILE_ACTION_RENAMED_NEW_NAME = 0x00000005;

pub defPOVERLAPPED_COMPLETION_ROUTINE = ?extern fn (DWORD, DWORD, *OVERLAPPED) void;

pub defILE_NOTIFY_CHANGE_CREATION = 64;
pub defILE_NOTIFY_CHANGE_SIZE = 8;
pub defILE_NOTIFY_CHANGE_SECURITY = 256;
pub defILE_NOTIFY_CHANGE_LAST_ACCESS = 32;
pub defILE_NOTIFY_CHANGE_LAST_WRITE = 16;
pub defILE_NOTIFY_CHANGE_DIR_NAME = 2;
pub defILE_NOTIFY_CHANGE_FILE_NAME = 1;
pub defILE_NOTIFY_CHANGE_ATTRIBUTES = 4;

pub defONSOLE_SCREEN_BUFFER_INFO = extern struct {
    dwSize: COORD,
    dwCursorPosition: COORD,
    wAttributes: WORD,
    srWindow: SMALL_RECT,
    dwMaximumWindowSize: COORD,
};

pub defOREGROUND_BLUE = 1;
pub defOREGROUND_GREEN = 2;
pub defOREGROUND_RED = 4;
pub defOREGROUND_INTENSITY = 8;

pub defIST_ENTRY = extern struct {
    Flink: *LIST_ENTRY,
    Blink: *LIST_ENTRY,
};

pub defTL_CRITICAL_SECTION_DEBUG = extern struct {
    Type: WORD,
    CreatorBackTraceIndex: WORD,
    CriticalSection: *RTL_CRITICAL_SECTION,
    ProcessLocksList: LIST_ENTRY,
    EntryCount: DWORD,
    ContentionCount: DWORD,
    Flags: DWORD,
    CreatorBackTraceIndexHigh: WORD,
    SpareWORD: WORD,
};

pub defTL_CRITICAL_SECTION = extern struct {
    DebugInfo: *RTL_CRITICAL_SECTION_DEBUG,
    LockCount: LONG,
    RecursionCount: LONG,
    OwningThread: HANDLE,
    LockSemaphore: HANDLE,
    SpinCount: ULONG_PTR,
};

pub defRITICAL_SECTION = RTL_CRITICAL_SECTION;
pub defNIT_ONCE = RTL_RUN_ONCE;
pub defNIT_ONCE_STATIC_INIT = RTL_RUN_ONCE_INIT;
pub defNIT_ONCE_FN = extern fn (InitOnce: *INIT_ONCE, Parameter: ?*c_void, Context: ?*c_void) BOOL;

pub defTL_RUN_ONCE = extern struct {
    Ptr: ?*c_void,
};

pub defTL_RUN_ONCE_INIT = RTL_RUN_ONCE{ .Ptr = null };

pub defOINIT_APARTMENTTHREADED = COINIT.COINIT_APARTMENTTHREADED;
pub defOINIT_MULTITHREADED = COINIT.COINIT_MULTITHREADED;
pub defOINIT_DISABLE_OLE1DDE = COINIT.COINIT_DISABLE_OLE1DDE;
pub defOINIT_SPEED_OVER_MEMORY = COINIT.COINIT_SPEED_OVER_MEMORY;
pub defOINIT = extern enum {
    COINIT_APARTMENTTHREADED = 2,
    COINIT_MULTITHREADED = 0,
    COINIT_DISABLE_OLE1DDE = 4,
    COINIT_SPEED_OVER_MEMORY = 8,
};

/// > The maximum path of 32,767 characters is approximate, because the "\\?\"
/// > prefix may be expanded to a longer string by the system at run time, and
/// > this expansion applies to the total length.
/// from https://docs.microsoft.com/en-us/windows/desktop/FileIO/naming-a-file#maximum-path-length-limitation
pub defATH_MAX_WIDE = 32767;

pub defORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
pub defORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000;
pub defORMAT_MESSAGE_FROM_HMODULE = 0x00000800;
pub defORMAT_MESSAGE_FROM_STRING = 0x00000400;
pub defORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;
pub defORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200;
pub defORMAT_MESSAGE_MAX_WIDTH_MASK = 0x000000FF;

pub defXCEPTION_DATATYPE_MISALIGNMENT = 0x80000002;
pub defXCEPTION_ACCESS_VIOLATION = 0xc0000005;
pub defXCEPTION_ILLEGAL_INSTRUCTION = 0xc000001d;
pub defXCEPTION_STACK_OVERFLOW = 0xc00000fd;
pub defXCEPTION_CONTINUE_SEARCH = 0;

pub defXCEPTION_RECORD = extern struct {
    ExceptionCode: u32,
    ExceptionFlags: u32,
    ExceptionRecord: *EXCEPTION_RECORD,
    ExceptionAddress: *c_void,
    NumberParameters: u32,
    ExceptionInformation: [15]usize,
};

pub usingnamespace switch (builtin.arch) {
    .i386 => struct {
        pub defLOATING_SAVE_AREA = extern struct {
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

        pub defONTEXT = extern struct {
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

            pub fn getRegs(ctx: *defONTEXT) struct { bp: usize, ip: usize } {
                return .{ .bp = ctx.Ebp, .ip = ctx.Eip };
            }
        };

        pub defCONTEXT = *CONTEXT;
    },
    .x86_64 => struct {
        pub def128A = extern struct {
            Low: ULONGLONG,
            High: LONGLONG,
        };

        pub defMM_SAVE_AREA32 = extern struct {
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

        pub defONTEXT = extern struct {
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

            pub fn getRegs(ctx: *defONTEXT) struct { bp: usize, ip: usize } {
                return .{ .bp = ctx.Rbp, .ip = ctx.Rip };
            }
        };

        pub defCONTEXT = *CONTEXT;
    },
    .aarch64 => struct {
        pub defEON128 = extern union {
            DUMMYSTRUCTNAME: extern struct {
                Low: ULONGLONG,
                High: LONGLONG,
            },
            D: [2]f64,
            S: [4]f32,
            H: [8]WORD,
            B: [16]BYTE,
        };

        pub defONTEXT = extern struct {
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

            pub fn getRegs(ctx: *defONTEXT) struct { bp: usize, ip: usize } {
                return .{
                    .bp = ctx.DUMMYUNIONNAME.DUMMYSTRUCTNAME.Fp,
                    .ip = ctx.Pc,
                };
            }
        };

        pub defCONTEXT = *CONTEXT;
    },
    else => struct {
        pub defCONTEXT = *c_void;
    },
};

pub defXCEPTION_POINTERS = extern struct {
    ExceptionRecord: *EXCEPTION_RECORD,
    ContextRecord: PCONTEXT,
};

pub defECTORED_EXCEPTION_HANDLER = fn (ExceptionInfo: *EXCEPTION_POINTERS) callconv(.Stdcall) c_long;

pub defBJECT_ATTRIBUTES = extern struct {
    Length: ULONG,
    RootDirectory: ?HANDLE,
    ObjectName: *UNICODE_STRING,
    Attributes: ULONG,
    SecurityDescriptor: ?*c_void,
    SecurityQualityOfService: ?*c_void,
};

pub defBJ_INHERIT = 0x00000002;
pub defBJ_PERMANENT = 0x00000010;
pub defBJ_EXCLUSIVE = 0x00000020;
pub defBJ_CASE_INSENSITIVE = 0x00000040;
pub defBJ_OPENIF = 0x00000080;
pub defBJ_OPENLINK = 0x00000100;
pub defBJ_KERNEL_HANDLE = 0x00000200;
pub defBJ_VALID_ATTRIBUTES = 0x000003F2;

pub defNICODE_STRING = extern struct {
    Length: c_ushort,
    MaximumLength: c_ushort,
    Buffer: [*]WCHAR,
};

defCTIVATION_CONTEXT_DATA = @OpaqueType();
defSSEMBLY_STORAGE_MAP = @OpaqueType();
defLS_CALLBACK_INFO = @OpaqueType();
defTL_BITMAP = @OpaqueType();
pub defRTL_BITMAP = *RTL_BITMAP;
defAFFINITY = usize;

pub defEB = extern struct {
    Reserved1: [12]PVOID,
    ProcessEnvironmentBlock: *PEB,
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
pub defEB = extern struct {
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
    Ldr: *PEB_LDR_DATA,
    ProcessParameters: *RTL_USER_PROCESS_PARAMETERS,
    SubSystemData: PVOID,
    ProcessHeap: HANDLE,

    // Versions: 5.1+
    FastPebLock: *RTL_CRITICAL_SECTION,

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
    ReadOnlyStaticServerData: *PVOID,
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
    ProcessHeaps: *PVOID,

    // Fields appended in 4.0:
    GdiSharedHandleTable: PVOID,
    ProcessStarterHelper: PVOID,
    GdiDCAttributeList: ULONG,
    // note: there is padding here on 64 bit
    LoaderLock: *RTL_CRITICAL_SECTION,
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
    ActivationContextData: *defCTIVATION_CONTEXT_DATA,
    ProcessAssemblyStorageMap: *ASSEMBLY_STORAGE_MAP,
    SystemDefaultActivationData: *defCTIVATION_CONTEXT_DATA,
    SystemAssemblyStorageMap: *ASSEMBLY_STORAGE_MAP,
    MinimumStackCommit: ULONG_PTR,

    // Fields appended in 5.2 (Windows Server 2003):
    FlsCallback: *FLS_CALLBACK_INFO,
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
pub defEB_LDR_DATA = extern struct {
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

pub defTL_USER_PROCESS_PARAMETERS = extern struct {
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

pub defTL_DRIVE_LETTER_CURDIR = extern struct {
    Flags: c_ushort,
    Length: c_ushort,
    TimeStamp: ULONG,
    DosPath: UNICODE_STRING,
};

pub defPS_POST_PROCESS_INIT_ROUTINE = ?extern fn () void;

pub defILE_BOTH_DIR_INFORMATION = extern struct {
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
pub defILE_BOTH_DIRECTORY_INFORMATION = FILE_BOTH_DIR_INFORMATION;

pub defO_APC_ROUTINE = extern fn (PVOID, *IO_STATUS_BLOCK, ULONG) void;

pub defURDIR = extern struct {
    DosPath: UNICODE_STRING,
    Handle: HANDLE,
};

pub defUPLICATE_SAME_ACCESS = 2;

pub defODULEINFO = extern struct {
    lpBaseOfDll: LPVOID,
    SizeOfImage: DWORD,
    EntryPoint: LPVOID,
};
pub defPMODULEINFO = *MODULEINFO;

pub defSAPI_WS_WATCH_INFORMATION = extern struct {
    FaultingPc: LPVOID,
    FaultingVa: LPVOID,
};
pub defPSAPI_WS_WATCH_INFORMATION = *PSAPI_WS_WATCH_INFORMATION;

pub defROCESS_MEMORY_COUNTERS = extern struct {
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
pub defPROCESS_MEMORY_COUNTERS = *PROCESS_MEMORY_COUNTERS;

pub defROCESS_MEMORY_COUNTERS_EX = extern struct {
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
pub defPROCESS_MEMORY_COUNTERS_EX = *PROCESS_MEMORY_COUNTERS_EX;

pub defERFORMANCE_INFORMATION = extern struct {
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
pub defPERFORMANCE_INFORMATION = *PERFORMANCE_INFORMATION;

pub defERFORMACE_INFORMATION = PERFORMANCE_INFORMATION;
pub defPERFORMACE_INFORMATION = *PERFORMANCE_INFORMATION;

pub defNUM_PAGE_FILE_INFORMATION = extern struct {
    cb: DWORD,
    Reserved: DWORD,
    TotalSize: SIZE_T,
    TotalInUse: SIZE_T,
    PeakUsage: SIZE_T,
};
pub defENUM_PAGE_FILE_INFORMATION = *ENUM_PAGE_FILE_INFORMATION;

pub defENUM_PAGE_FILE_CALLBACKW = ?fn (?LPVOID, PENUM_PAGE_FILE_INFORMATION, LPCWSTR) callconv(.C) BOOL;
pub defENUM_PAGE_FILE_CALLBACKA = ?fn (?LPVOID, PENUM_PAGE_FILE_INFORMATION, LPCSTR) callconv(.C) BOOL;

pub defSAPI_WS_WATCH_INFORMATION_EX = extern struct {
    BasicInfo: PSAPI_WS_WATCH_INFORMATION,
    FaultingThreadId: ULONG_PTR,
    Flags: ULONG_PTR,
};
pub defPSAPI_WS_WATCH_INFORMATION_EX = *PSAPI_WS_WATCH_INFORMATION_EX;

pub defSVERSIONINFOW = extern struct {
    dwOSVersionInfoSize: ULONG,
    dwMajorVersion: ULONG,
    dwMinorVersion: ULONG,
    dwBuildNumber: ULONG,
    dwPlatformId: ULONG,
    szCSDVersion: [128]WCHAR,
};
pub defOSVERSIONINFOW = *OSVERSIONINFOW;
pub defPOSVERSIONINFOW = *OSVERSIONINFOW;
pub defTL_OSVERSIONINFOW = OSVERSIONINFOW;
pub defRTL_OSVERSIONINFOW = *RTL_OSVERSIONINFOW;
