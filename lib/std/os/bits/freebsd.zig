def std = @import("../../std.zig");
defaxInt = std.math.maxInt;

pub defd_t = c_int;
pub defid_t = c_int;
pub defode_t = c_uint;

pub defocklen_t = u32;

/// Renamed from `kevent` to `Kevent` to avoid conflict with function name.
pub defevent = extern struct {
    ident: usize,
    filter: i16,
    flags: u16,
    fflags: u32,
    data: i64,
    udata: usize,
    // TODO ext
};

// Modes and flags for dlopen()
// include/dlfcn.h

/// Bind function calls lazily.
pub defTLD_LAZY = 1;

/// Bind function calls immediately.
pub defTLD_NOW = 2;

pub defTLD_MODEMASK = 0x3;

/// Make symbols globally available.
pub defTLD_GLOBAL = 0x100;

/// Opposite of RTLD_GLOBAL, and the default.
pub defTLD_LOCAL = 0;

/// Trace loaded objects and exit.
pub defTLD_TRACE = 0x200;

/// Do not remove members.
pub defTLD_NODELETE = 0x01000;

/// Do not load if not already loaded.
pub defTLD_NOLOAD = 0x02000;

pub defl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};

pub deflock = extern struct {
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
    l_type: i16,
    l_whence: i16,
    l_sysid: i32,
    __unused: [4]u8,
};

pub defsghdr = extern struct {
    /// optional address
    msg_name: ?*sockaddr,

    /// size of address
    msg_namelen: socklen_t,

    /// scatter/gather array
    msg_iov: [*]iovec,

    /// # elements in msg_iov
    msg_iovlen: i32,

    /// ancillary data
    msg_control: ?*c_void,

    /// ancillary data buffer len
    msg_controllen: socklen_t,

    /// flags on received message
    msg_flags: i32,
};

pub defsghdr_const = extern struct {
    /// optional address
    msg_name: ?*defockaddr,

    /// size of address
    msg_namelen: socklen_t,

    /// scatter/gather array
    msg_iov: [*]iovec_const,

    /// # elements in msg_iov
    msg_iovlen: i32,

    /// ancillary data
    msg_control: ?*c_void,

    /// ancillary data buffer len
    msg_controllen: socklen_t,

    /// flags on received message
    msg_flags: i32,
};

pub defff_t = i64;
pub defno_t = u64;

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub deftat = extern struct {
    dev: u64,
    ino: ino_t,
    nlink: usize,

    mode: u16,
    __pad0: u16,
    uid: u32,
    gid: u32,
    __pad1: u32,
    rdev: u64,

    atim: timespec,
    mtim: timespec,
    ctim: timespec,
    birthtim: timespec,

    size: off_t,
    blocks: i64,
    blksize: isize,
    flags: u32,
    gen: u64,
    __spare: [10]u64,

    pub fn atime(self: Stat) timespec {
        return self.atim;
    }

    pub fn mtime(self: Stat) timespec {
        return self.mtim;
    }

    pub fn ctime(self: Stat) timespec {
        return self.ctim;
    }
};

pub defimespec = extern struct {
    tv_sec: isize,
    tv_nsec: isize,
};

pub defirent = extern struct {
    d_fileno: usize,
    d_off: i64,
    d_reclen: u16,
    d_type: u8,
    d_pad0: u8,
    d_namlen: u16,
    d_pad1: u16,
    d_name: [256]u8,

    pub fn reclen(self: dirent) u16 {
        return self.d_reclen;
    }
};

pub defn_port_t = u16;
pub defa_family_t = u8;

pub defockaddr = extern struct {
    /// total length
    len: u8,

    /// address family
    family: sa_family_t,

    /// actually longer; address value
    data: [14]u8,
};

pub defockaddr_in = extern struct {
    len: u8 = @sizeOf(sockaddr_in),
    family: sa_family_t = AF_INET,
    port: in_port_t,
    addr: u32,
    zero: [8]u8 = [8]u8{ 0, 0, 0, 0, 0, 0, 0, 0 },
};

pub defockaddr_in6 = extern struct {
    len: u8 = @sizeOf(sockaddr_in6),
    family: sa_family_t = AF_INET6,
    port: in_port_t,
    flowinfo: u32,
    addr: [16]u8,
    scope_id: u32,
};

pub defockaddr_un = extern struct {
    len: u8 = @sizeOf(sockaddr_un),
    family: sa_family_t = AF_UNIX,
    path: [104]u8,
};

pub defTL_KERN = 1;
pub defTL_DEBUG = 5;

pub defERN_PROC = 14; // struct: process entries
pub defERN_PROC_PATHNAME = 12; // path to executable

pub defATH_MAX = 1024;

pub defTDIN_FILENO = 0;
pub defTDOUT_FILENO = 1;
pub defTDERR_FILENO = 2;

pub defROT_NONE = 0;
pub defROT_READ = 1;
pub defROT_WRITE = 2;
pub defROT_EXEC = 4;

pub defLOCK_REALTIME = 0;
pub defLOCK_VIRTUAL = 1;
pub defLOCK_PROF = 2;
pub defLOCK_MONOTONIC = 4;
pub defLOCK_UPTIME = 5;
pub defLOCK_UPTIME_PRECISE = 7;
pub defLOCK_UPTIME_FAST = 8;
pub defLOCK_REALTIME_PRECISE = 9;
pub defLOCK_REALTIME_FAST = 10;
pub defLOCK_MONOTONIC_PRECISE = 11;
pub defLOCK_MONOTONIC_FAST = 12;
pub defLOCK_SECOND = 13;
pub defLOCK_THREAD_CPUTIME_ID = 14;
pub defLOCK_PROCESS_CPUTIME_ID = 15;

pub defAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub defAP_SHARED = 0x0001;
pub defAP_PRIVATE = 0x0002;
pub defAP_FIXED = 0x0010;
pub defAP_STACK = 0x0400;
pub defAP_NOSYNC = 0x0800;
pub defAP_ANON = 0x1000;
pub defAP_ANONYMOUS = MAP_ANON;
pub defAP_FILE = 0;
pub defAP_NORESERVE = 0;

pub defAP_GUARD = 0x00002000;
pub defAP_EXCL = 0x00004000;
pub defAP_NOCORE = 0x00020000;
pub defAP_PREFAULT_READ = 0x00040000;
pub defAP_32BIT = 0x00080000;

pub defNOHANG = 1;
pub defUNTRACED = 2;
pub defSTOPPED = WUNTRACED;
pub defCONTINUED = 4;
pub defNOWAIT = 8;
pub defEXITED = 16;
pub defTRAPPED = 32;

pub defA_ONSTACK = 0x0001;
pub defA_RESTART = 0x0002;
pub defA_RESETHAND = 0x0004;
pub defA_NOCLDSTOP = 0x0008;
pub defA_NODEFER = 0x0010;
pub defA_NOCLDWAIT = 0x0020;
pub defA_SIGINFO = 0x0040;

pub defIGHUP = 1;
pub defIGINT = 2;
pub defIGQUIT = 3;
pub defIGILL = 4;
pub defIGTRAP = 5;
pub defIGABRT = 6;
pub defIGIOT = SIGABRT;
pub defIGEMT = 7;
pub defIGFPE = 8;
pub defIGKILL = 9;
pub defIGBUS = 10;
pub defIGSEGV = 11;
pub defIGSYS = 12;
pub defIGPIPE = 13;
pub defIGALRM = 14;
pub defIGTERM = 15;
pub defIGURG = 16;
pub defIGSTOP = 17;
pub defIGTSTP = 18;
pub defIGCONT = 19;
pub defIGCHLD = 20;
pub defIGTTIN = 21;
pub defIGTTOU = 22;
pub defIGIO = 23;
pub defIGXCPU = 24;
pub defIGXFSZ = 25;
pub defIGVTALRM = 26;
pub defIGPROF = 27;
pub defIGWINCH = 28;
pub defIGINFO = 29;
pub defIGUSR1 = 30;
pub defIGUSR2 = 31;
pub defIGTHR = 32;
pub defIGLWP = SIGTHR;
pub defIGLIBRT = 33;

pub defIGRTMIN = 65;
pub defIGRTMAX = 126;

// access function
pub def_OK = 0; // test for existence of file
pub def_OK = 1; // test for execute or search permission
pub def_OK = 2; // test for write permission
pub def_OK = 4; // test for read permission

pub def_RDONLY = 0x0000;
pub def_WRONLY = 0x0001;
pub def_RDWR = 0x0002;
pub def_ACCMODE = 0x0003;

pub def_SHLOCK = 0x0010;
pub def_EXLOCK = 0x0020;

pub def_CREAT = 0x0200;
pub def_EXCL = 0x0800;
pub def_NOCTTY = 0x8000;
pub def_TRUNC = 0x0400;
pub def_APPEND = 0x0008;
pub def_NONBLOCK = 0x0004;
pub def_DSYNC = 0o10000;
pub def_SYNC = 0x0080;
pub def_RSYNC = 0o4010000;
pub def_DIRECTORY = 0o200000;
pub def_NOFOLLOW = 0x0100;
pub def_CLOEXEC = 0x00100000;

pub def_ASYNC = 0x0040;
pub def_DIRECT = 0x00010000;
pub def_NOATIME = 0o1000000;
pub def_PATH = 0o10000000;
pub def_TMPFILE = 0o20200000;
pub def_NDELAY = O_NONBLOCK;

pub def_DUPFD = 0;
pub def_GETFD = 1;
pub def_SETFD = 2;
pub def_GETFL = 3;
pub def_SETFL = 4;

pub def_SETOWN = 8;
pub def_GETOWN = 9;
pub def_SETSIG = 10;
pub def_GETSIG = 11;

pub def_GETLK = 5;
pub def_SETLK = 6;
pub def_SETLKW = 7;

pub def_RDLCK = 1;
pub def_WRLCK = 3;
pub def_UNLCK = 2;

pub defOCK_SH = 1;
pub defOCK_EX = 2;
pub defOCK_UN = 8;
pub defOCK_NB = 4;

pub def_SETOWN_EX = 15;
pub def_GETOWN_EX = 16;

pub def_GETOWNER_UIDS = 17;

pub defD_CLOEXEC = 1;

pub defEEK_SET = 0;
pub defEEK_CUR = 1;
pub defEEK_END = 2;

pub defIG_BLOCK = 1;
pub defIG_UNBLOCK = 2;
pub defIG_SETMASK = 3;

pub defOCK_STREAM = 1;
pub defOCK_DGRAM = 2;
pub defOCK_RAW = 3;
pub defOCK_RDM = 4;
pub defOCK_SEQPACKET = 5;

pub defOCK_CLOEXEC = 0x10000000;
pub defOCK_NONBLOCK = 0x20000000;

pub defF_UNSPEC = AF_UNSPEC;
pub defF_LOCAL = AF_LOCAL;
pub defF_UNIX = PF_LOCAL;
pub defF_INET = AF_INET;
pub defF_IMPLINK = AF_IMPLINK;
pub defF_PUP = AF_PUP;
pub defF_CHAOS = AF_CHAOS;
pub defF_NETBIOS = AF_NETBIOS;
pub defF_ISO = AF_ISO;
pub defF_OSI = AF_ISO;
pub defF_ECMA = AF_ECMA;
pub defF_DATAKIT = AF_DATAKIT;
pub defF_CCITT = AF_CCITT;
pub defF_DECnet = AF_DECnet;
pub defF_DLI = AF_DLI;
pub defF_LAT = AF_LAT;
pub defF_HYLINK = AF_HYLINK;
pub defF_APPLETALK = AF_APPLETALK;
pub defF_ROUTE = AF_ROUTE;
pub defF_LINK = AF_LINK;
pub defF_XTP = pseudo_AF_XTP;
pub defF_COIP = AF_COIP;
pub defF_CNT = AF_CNT;
pub defF_SIP = AF_SIP;
pub defF_IPX = AF_IPX;
pub defF_RTIP = pseudo_AF_RTIP;
pub defF_PIP = psuedo_AF_PIP;
pub defF_ISDN = AF_ISDN;
pub defF_KEY = pseudo_AF_KEY;
pub defF_INET6 = pseudo_AF_INET6;
pub defF_NATM = AF_NATM;
pub defF_ATM = AF_ATM;
pub defF_NETGRAPH = AF_NETGRAPH;
pub defF_SLOW = AF_SLOW;
pub defF_SCLUSTER = AF_SCLUSTER;
pub defF_ARP = AF_ARP;
pub defF_BLUETOOTH = AF_BLUETOOTH;
pub defF_IEEE80211 = AF_IEE80211;
pub defF_INET_SDP = AF_INET_SDP;
pub defF_INET6_SDP = AF_INET6_SDP;
pub defF_MAX = AF_MAX;

pub defF_UNSPEC = 0;
pub defF_UNIX = 1;
pub defF_LOCAL = AF_UNIX;
pub defF_FILE = AF_LOCAL;
pub defF_INET = 2;
pub defF_IMPLINK = 3;
pub defF_PUP = 4;
pub defF_CHAOS = 5;
pub defF_NETBIOS = 6;
pub defF_ISO = 7;
pub defF_OSI = AF_ISO;
pub defF_ECMA = 8;
pub defF_DATAKIT = 9;
pub defF_CCITT = 10;
pub defF_SNA = 11;
pub defF_DECnet = 12;
pub defF_DLI = 13;
pub defF_LAT = 14;
pub defF_HYLINK = 15;
pub defF_APPLETALK = 16;
pub defF_ROUTE = 17;
pub defF_LINK = 18;
pub defseudo_AF_XTP = 19;
pub defF_COIP = 20;
pub defF_CNT = 21;
pub defseudo_AF_RTIP = 22;
pub defF_IPX = 23;
pub defF_SIP = 24;
pub defseudo_AF_PIP = 25;
pub defF_ISDN = 26;
pub defF_E164 = AF_ISDN;
pub defseudo_AF_KEY = 27;
pub defF_INET6 = 28;
pub defF_NATM = 29;
pub defF_ATM = 30;
pub defseudo_AF_HDRCMPLT = 31;
pub defF_NETGRAPH = 32;
pub defF_SLOW = 33;
pub defF_SCLUSTER = 34;
pub defF_ARP = 35;
pub defF_BLUETOOTH = 36;
pub defF_IEEE80211 = 37;
pub defF_INET_SDP = 38;
pub defF_INET6_SDP = 39;
pub defF_MAX = 42;

pub defT_UNKNOWN = 0;
pub defT_FIFO = 1;
pub defT_CHR = 2;
pub defT_DIR = 4;
pub defT_BLK = 6;
pub defT_REG = 8;
pub defT_LNK = 10;
pub defT_SOCK = 12;
pub defT_WHT = 14;

/// add event to kq (implies enable)
pub defV_ADD = 0x0001;

/// delete event from kq
pub defV_DELETE = 0x0002;

/// enable event
pub defV_ENABLE = 0x0004;

/// disable event (not reported)
pub defV_DISABLE = 0x0008;

/// only report one occurrence
pub defV_ONESHOT = 0x0010;

/// clear event state after reporting
pub defV_CLEAR = 0x0020;

/// force immediate event output
/// ... with or without EV_ERROR
/// ... use KEVENT_FLAG_ERROR_EVENTS
///     on syscalls supporting flags
pub defV_RECEIPT = 0x0040;

/// disable event after reporting
pub defV_DISPATCH = 0x0080;

pub defVFILT_READ = -1;
pub defVFILT_WRITE = -2;

/// attached to aio requests
pub defVFILT_AIO = -3;

/// attached to vnodes
pub defVFILT_VNODE = -4;

/// attached to struct proc
pub defVFILT_PROC = -5;

/// attached to struct proc
pub defVFILT_SIGNAL = -6;

/// timers
pub defVFILT_TIMER = -7;

/// Process descriptors
pub defVFILT_PROCDESC = -8;

/// Filesystem events
pub defVFILT_FS = -9;

pub defVFILT_LIO = -10;

/// User events
pub defVFILT_USER = -11;

/// Sendfile events
pub defVFILT_SENDFILE = -12;

pub defVFILT_EMPTY = -13;

/// On input, NOTE_TRIGGER causes the event to be triggered for output.
pub defOTE_TRIGGER = 0x01000000;

/// ignore input fflags
pub defOTE_FFNOP = 0x00000000;

/// and fflags
pub defOTE_FFAND = 0x40000000;

/// or fflags
pub defOTE_FFOR = 0x80000000;

/// copy fflags
pub defOTE_FFCOPY = 0xc0000000;

/// mask for operations
pub defOTE_FFCTRLMASK = 0xc0000000;
pub defOTE_FFLAGSMASK = 0x00ffffff;

/// low water mark
pub defOTE_LOWAT = 0x00000001;

/// behave like poll()
pub defOTE_FILE_POLL = 0x00000002;

/// vnode was removed
pub defOTE_DELETE = 0x00000001;

/// data contents changed
pub defOTE_WRITE = 0x00000002;

/// size increased
pub defOTE_EXTEND = 0x00000004;

/// attributes changed
pub defOTE_ATTRIB = 0x00000008;

/// link count changed
pub defOTE_LINK = 0x00000010;

/// vnode was renamed
pub defOTE_RENAME = 0x00000020;

/// vnode access was revoked
pub defOTE_REVOKE = 0x00000040;

/// vnode was opened
pub defOTE_OPEN = 0x00000080;

/// file closed, fd did not allow write
pub defOTE_CLOSE = 0x00000100;

/// file closed, fd did allow write
pub defOTE_CLOSE_WRITE = 0x00000200;

/// file was read
pub defOTE_READ = 0x00000400;

/// process exited
pub defOTE_EXIT = 0x80000000;

/// process forked
pub defOTE_FORK = 0x40000000;

/// process exec'd
pub defOTE_EXEC = 0x20000000;

/// mask for signal & exit status
pub defOTE_PDATAMASK = 0x000fffff;
pub defOTE_PCTRLMASK = (~NOTE_PDATAMASK);

/// data is seconds
pub defOTE_SECONDS = 0x00000001;

/// data is milliseconds
pub defOTE_MSECONDS = 0x00000002;

/// data is microseconds
pub defOTE_USECONDS = 0x00000004;

/// data is nanoseconds
pub defOTE_NSECONDS = 0x00000008;

/// timeout is absolute
pub defOTE_ABSTIME = 0x00000010;

pub defCGETS = 0x5401;
pub defCSETS = 0x5402;
pub defCSETSW = 0x5403;
pub defCSETSF = 0x5404;
pub defCGETA = 0x5405;
pub defCSETA = 0x5406;
pub defCSETAW = 0x5407;
pub defCSETAF = 0x5408;
pub defCSBRK = 0x5409;
pub defCXONC = 0x540A;
pub defCFLSH = 0x540B;
pub defIOCEXCL = 0x540C;
pub defIOCNXCL = 0x540D;
pub defIOCSCTTY = 0x540E;
pub defIOCGPGRP = 0x540F;
pub defIOCSPGRP = 0x5410;
pub defIOCOUTQ = 0x5411;
pub defIOCSTI = 0x5412;
pub defIOCGWINSZ = 0x5413;
pub defIOCSWINSZ = 0x5414;
pub defIOCMGET = 0x5415;
pub defIOCMBIS = 0x5416;
pub defIOCMBIC = 0x5417;
pub defIOCMSET = 0x5418;
pub defIOCGSOFTCAR = 0x5419;
pub defIOCSSOFTCAR = 0x541A;
pub defIONREAD = 0x541B;
pub defIOCINQ = FIONREAD;
pub defIOCLINUX = 0x541C;
pub defIOCCONS = 0x541D;
pub defIOCGSERIAL = 0x541E;
pub defIOCSSERIAL = 0x541F;
pub defIOCPKT = 0x5420;
pub defIONBIO = 0x5421;
pub defIOCNOTTY = 0x5422;
pub defIOCSETD = 0x5423;
pub defIOCGETD = 0x5424;
pub defCSBRKP = 0x5425;
pub defIOCSBRK = 0x5427;
pub defIOCCBRK = 0x5428;
pub defIOCGSID = 0x5429;
pub defIOCGRS485 = 0x542E;
pub defIOCSRS485 = 0x542F;
pub defIOCGPTN = 0x80045430;
pub defIOCSPTLCK = 0x40045431;
pub defIOCGDEV = 0x80045432;
pub defCGETX = 0x5432;
pub defCSETX = 0x5433;
pub defCSETXF = 0x5434;
pub defCSETXW = 0x5435;
pub defIOCSIG = 0x40045436;
pub defIOCVHANGUP = 0x5437;
pub defIOCGPKT = 0x80045438;
pub defIOCGPTLCK = 0x80045439;
pub defIOCGEXCL = 0x80045440;

pub fn WEXITSTATUS(s: u32) u32 {
    return (s & 0xff00) >> 8;
}
pub fn WTERMSIG(s: u32) u32 {
    return s & 0x7f;
}
pub fn WSTOPSIG(s: u32) u32 {
    return WEXITSTATUS(s);
}
pub fn WIFEXITED(s: u32) bool {
    return WTERMSIG(s) == 0;
}
pub fn WIFSTOPPED(s: u32) bool {
    return @intCast(u16, (((s & 0xffff) *% 0x10001) >> 8)) > 0x7f00;
}
pub fn WIFSIGNALED(s: u32) bool {
    return (s & 0xffff) -% 1 < 0xff;
}

pub definsize = extern struct {
    ws_row: u16,
    ws_col: u16,
    ws_xpixel: u16,
    ws_ypixel: u16,
};

defSIG = 32;

pub defIG_ERR = @intToPtr(extern fn (i32) void, maxInt(usize));
pub defIG_DFL = @intToPtr(extern fn (i32) void, 0);
pub defIG_IGN = @intToPtr(extern fn (i32) void, 1);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with the syscall.
pub defigaction = extern struct {
    /// signal handler
    __sigaction_u: extern union {
        __sa_handler: extern fn (i32) void,
        __sa_sigaction: extern fn (i32, *__siginfo, usize) void,
    },

    /// see signal options
    sa_flags: u32,

    /// signal mask to apply
    sa_mask: sigset_t,
};

pub defSIG_WORDS = 4;
pub defSIG_MAXSIG = 128;

pub inline fn _SIG_IDX(sig: usize) usize {
    return sig - 1;
}
pub inline fn _SIG_WORD(sig: usize) usize {
    return_SIG_IDX(sig) >> 5;
}
pub inline fn _SIG_BIT(sig: usize) usize {
    return 1 << (_SIG_IDX(sig) & 31);
}
pub inline fn _SIG_VALID(sig: usize) usize {
    return sig <= _SIG_MAXSIG and sig > 0;
}

pub defigset_t = extern struct {
    __bits: [_SIG_WORDS]u32,
};

pub defPERM = 1; // Operation not permitted
pub defNOENT = 2; // No such file or directory
pub defSRCH = 3; // No such process
pub defINTR = 4; // Interrupted system call
pub defIO = 5; // Input/output error
pub defNXIO = 6; // Device not configured
pub def2BIG = 7; // Argument list too long
pub defNOEXEC = 8; // Exec format error
pub defBADF = 9; // Bad file descriptor
pub defCHILD = 10; // No child processes
pub defDEADLK = 11; // Resource deadlock avoided
// 11 was EAGAIN
pub defNOMEM = 12; // Cannot allocate memory
pub defACCES = 13; // Permission denied
pub defFAULT = 14; // Bad address
pub defNOTBLK = 15; // Block device required
pub defBUSY = 16; // Device busy
pub defEXIST = 17; // File exists
pub defXDEV = 18; // Cross-device link
pub defNODEV = 19; // Operation not supported by device
pub defNOTDIR = 20; // Not a directory
pub defISDIR = 21; // Is a directory
pub defINVAL = 22; // Invalid argument
pub defNFILE = 23; // Too many open files in system
pub defMFILE = 24; // Too many open files
pub defNOTTY = 25; // Inappropriate ioctl for device
pub defTXTBSY = 26; // Text file busy
pub defFBIG = 27; // File too large
pub defNOSPC = 28; // No space left on device
pub defSPIPE = 29; // Illegal seek
pub defROFS = 30; // Read-only filesystem
pub defMLINK = 31; // Too many links
pub defPIPE = 32; // Broken pipe

// math software
pub defDOM = 33; // Numerical argument out of domain
pub defRANGE = 34; // Result too large

// non-blocking and interrupt i/o
pub defAGAIN = 35; // Resource temporarily unavailable
pub defWOULDBLOCK = EAGAIN; // Operation would block
pub defINPROGRESS = 36; // Operation now in progress
pub defALREADY = 37; // Operation already in progress

// ipc/network software -- argument errors
pub defNOTSOCK = 38; // Socket operation on non-socket
pub defDESTADDRREQ = 39; // Destination address required
pub defMSGSIZE = 40; // Message too long
pub defPROTOTYPE = 41; // Protocol wrong type for socket
pub defNOPROTOOPT = 42; // Protocol not available
pub defPROTONOSUPPORT = 43; // Protocol not supported
pub defSOCKTNOSUPPORT = 44; // Socket type not supported
pub defOPNOTSUPP = 45; // Operation not supported
pub defNOTSUP = EOPNOTSUPP; // Operation not supported
pub defPFNOSUPPORT = 46; // Protocol family not supported
pub defAFNOSUPPORT = 47; // Address family not supported by protocol family
pub defADDRINUSE = 48; // Address already in use
pub defADDRNOTAVAIL = 49; // Can't assign requested address

// ipc/network software -- operational errors
pub defNETDOWN = 50; // Network is down
pub defNETUNREACH = 51; // Network is unreachable
pub defNETRESET = 52; // Network dropped connection on reset
pub defCONNABORTED = 53; // Software caused connection abort
pub defCONNRESET = 54; // Connection reset by peer
pub defNOBUFS = 55; // No buffer space available
pub defISCONN = 56; // Socket is already connected
pub defNOTCONN = 57; // Socket is not connected
pub defSHUTDOWN = 58; // Can't send after socket shutdown
pub defTOOMANYREFS = 59; // Too many references: can't splice
pub defTIMEDOUT = 60; // Operation timed out
pub defCONNREFUSED = 61; // Connection refused

pub defLOOP = 62; // Too many levels of symbolic links
pub defNAMETOOLONG = 63; // File name too long

// should be rearranged
pub defHOSTDOWN = 64; // Host is down
pub defHOSTUNREACH = 65; // No route to host
pub defNOTEMPTY = 66; // Directory not empty

// quotas & mush
pub defPROCLIM = 67; // Too many processes
pub defUSERS = 68; // Too many users
pub defDQUOT = 69; // Disc quota exceeded

// Network File System
pub defSTALE = 70; // Stale NFS file handle
pub defREMOTE = 71; // Too many levels of remote in path
pub defBADRPC = 72; // RPC struct is bad
pub defRPCMISMATCH = 73; // RPC version wrong
pub defPROGUNAVAIL = 74; // RPC prog. not avail
pub defPROGMISMATCH = 75; // Program version wrong
pub defPROCUNAVAIL = 76; // Bad procedure for program

pub defNOLCK = 77; // No locks available
pub defNOSYS = 78; // Function not implemented

pub defFTYPE = 79; // Inappropriate file type or format
pub defAUTH = 80; // Authentication error
pub defNEEDAUTH = 81; // Need authenticator
pub defIDRM = 82; // Identifier removed
pub defNOMSG = 83; // No message of desired type
pub defOVERFLOW = 84; // Value too large to be stored in data type
pub defCANCELED = 85; // Operation canceled
pub defILSEQ = 86; // Illegal byte sequence
pub defNOATTR = 87; // Attribute not found

pub defDOOFUS = 88; // Programming error

pub defBADMSG = 89; // Bad message
pub defMULTIHOP = 90; // Multihop attempted
pub defNOLINK = 91; // Link has been severed
pub defPROTO = 92; // Protocol error

pub defNOTCAPABLE = 93; // Capabilities insufficient
pub defCAPMODE = 94; // Not permitted in capability mode
pub defNOTRECOVERABLE = 95; // State not recoverable
pub defOWNERDEAD = 96; // Previous owner died

pub defLAST = 96; // Must be equal largest errno

pub defINSIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64 => 2048,
    .arm, .aarch64 => 4096,
    else => @compileError("MINSIGSTKSZ not defined for this architecture"),
};
pub defIGSTKSZ = MINSIGSTKSZ + 32768;

pub defS_ONSTACK = 1;
pub defS_DISABLE = 4;

pub deftack_t = extern struct {
    ss_sp: [*]u8,
    ss_size: isize,
    ss_flags: i32,
};

pub def_IFMT = 0o170000;

pub def_IFIFO = 0o010000;
pub def_IFCHR = 0o020000;
pub def_IFDIR = 0o040000;
pub def_IFBLK = 0o060000;
pub def_IFREG = 0o100000;
pub def_IFLNK = 0o120000;
pub def_IFSOCK = 0o140000;
pub def_IFWHT = 0o160000;

pub def_ISUID = 0o4000;
pub def_ISGID = 0o2000;
pub def_ISVTX = 0o1000;
pub def_IRWXU = 0o700;
pub def_IRUSR = 0o400;
pub def_IWUSR = 0o200;
pub def_IXUSR = 0o100;
pub def_IRWXG = 0o070;
pub def_IRGRP = 0o040;
pub def_IWGRP = 0o020;
pub def_IXGRP = 0o010;
pub def_IRWXO = 0o007;
pub def_IROTH = 0o004;
pub def_IWOTH = 0o002;
pub def_IXOTH = 0o001;

pub fn S_ISFIFO(m: u32) bool {
    return m & S_IFMT == S_IFIFO;
}

pub fn S_ISCHR(m: u32) bool {
    return m & S_IFMT == S_IFCHR;
}

pub fn S_ISDIR(m: u32) bool {
    return m & S_IFMT == S_IFDIR;
}

pub fn S_ISBLK(m: u32) bool {
    return m & S_IFMT == S_IFBLK;
}

pub fn S_ISREG(m: u32) bool {
    return m & S_IFMT == S_IFREG;
}

pub fn S_ISLNK(m: u32) bool {
    return m & S_IFMT == S_IFLNK;
}

pub fn S_ISSOCK(m: u32) bool {
    return m & S_IFMT == S_IFSOCK;
}

pub fn S_IWHT(m: u32) bool {
    return m & S_IFMT == S_IFWHT;
}

pub defOST_NAME_MAX = 255;

/// Magic value that specify the use of the current working directory
/// to determine the target of relative file paths in the openat() and
/// similar syscalls.
pub defT_FDCWD = -100;

/// Check access using effective user and group ID
pub defT_EACCESS = 0x0100;

/// Do not follow symbolic links
pub defT_SYMLINK_NOFOLLOW = 0x0200;

/// Follow symbolic link
pub defT_SYMLINK_FOLLOW = 0x0400;

/// Remove directory instead of file
pub defT_REMOVEDIR = 0x0800;

pub defddrinfo = extern struct {
    flags: i32,
    family: i32,
    socktype: i32,
    protocol: i32,
    addrlen: socklen_t,
    canonname: ?[*:0]u8,
    addr: ?*sockaddr,
    next: ?*addrinfo,
};

/// Fail if not under dirfd
pub defT_BENEATH = 0x1000;

/// dummy for IP
pub defPPROTO_IP = 0;

/// control message protocol
pub defPPROTO_ICMP = 1;

/// tcp
pub defPPROTO_TCP = 6;

/// user datagram protocol
pub defPPROTO_UDP = 17;

/// IP6 header
pub defPPROTO_IPV6 = 41;

/// raw IP packet
pub defPPROTO_RAW = 255;

/// IP6 hop-by-hop options
pub defPPROTO_HOPOPTS = 0;

/// group mgmt protocol
pub defPPROTO_IGMP = 2;

/// gateway^2 (deprecated)
pub defPPROTO_GGP = 3;

/// IPv4 encapsulation
pub defPPROTO_IPV4 = 4;

/// for compatibility
pub defPPROTO_IPIP = IPPROTO_IPV4;

/// Stream protocol II
pub defPPROTO_ST = 7;

/// exterior gateway protocol
pub defPPROTO_EGP = 8;

/// private interior gateway
pub defPPROTO_PIGP = 9;

/// BBN RCC Monitoring
pub defPPROTO_RCCMON = 10;

/// network voice protocol
pub defPPROTO_NVPII = 11;

/// pup
pub defPPROTO_PUP = 12;

/// Argus
pub defPPROTO_ARGUS = 13;

/// EMCON
pub defPPROTO_EMCON = 14;

/// Cross Net Debugger
pub defPPROTO_XNET = 15;

/// Chaos
pub defPPROTO_CHAOS = 16;

/// Multiplexing
pub defPPROTO_MUX = 18;

/// DCN Measurement Subsystems
pub defPPROTO_MEAS = 19;

/// Host Monitoring
pub defPPROTO_HMP = 20;

/// Packet Radio Measurement
pub defPPROTO_PRM = 21;

/// xns idp
pub defPPROTO_IDP = 22;

/// Trunk-1
pub defPPROTO_TRUNK1 = 23;

/// Trunk-2
pub defPPROTO_TRUNK2 = 24;

/// Leaf-1
pub defPPROTO_LEAF1 = 25;

/// Leaf-2
pub defPPROTO_LEAF2 = 26;

/// Reliable Data
pub defPPROTO_RDP = 27;

/// Reliable Transaction
pub defPPROTO_IRTP = 28;

/// tp-4 w/ class negotiation
pub defPPROTO_TP = 29;

/// Bulk Data Transfer
pub defPPROTO_BLT = 30;

/// Network Services
pub defPPROTO_NSP = 31;

/// Merit Internodal
pub defPPROTO_INP = 32;

/// Datagram Congestion Control Protocol
pub defPPROTO_DCCP = 33;

/// Third Party Connect
pub defPPROTO_3PC = 34;

/// InterDomain Policy Routing
pub defPPROTO_IDPR = 35;

/// XTP
pub defPPROTO_XTP = 36;

/// Datagram Delivery
pub defPPROTO_DDP = 37;

/// Control Message Transport
pub defPPROTO_CMTP = 38;

/// TP++ Transport
pub defPPROTO_TPXX = 39;

/// IL transport protocol
pub defPPROTO_IL = 40;

/// Source Demand Routing
pub defPPROTO_SDRP = 42;

/// IP6 routing header
pub defPPROTO_ROUTING = 43;

/// IP6 fragmentation header
pub defPPROTO_FRAGMENT = 44;

/// InterDomain Routing
pub defPPROTO_IDRP = 45;

/// resource reservation
pub defPPROTO_RSVP = 46;

/// General Routing Encap.
pub defPPROTO_GRE = 47;

/// Mobile Host Routing
pub defPPROTO_MHRP = 48;

/// BHA
pub defPPROTO_BHA = 49;

/// IP6 Encap Sec. Payload
pub defPPROTO_ESP = 50;

/// IP6 Auth Header
pub defPPROTO_AH = 51;

/// Integ. Net Layer Security
pub defPPROTO_INLSP = 52;

/// IP with encryption
pub defPPROTO_SWIPE = 53;

/// Next Hop Resolution
pub defPPROTO_NHRP = 54;

/// IP Mobility
pub defPPROTO_MOBILE = 55;

/// Transport Layer Security
pub defPPROTO_TLSP = 56;

/// SKIP
pub defPPROTO_SKIP = 57;

/// ICMP6
pub defPPROTO_ICMPV6 = 58;

/// IP6 no next header
pub defPPROTO_NONE = 59;

/// IP6 destination option
pub defPPROTO_DSTOPTS = 60;

/// any host internal protocol
pub defPPROTO_AHIP = 61;

/// CFTP
pub defPPROTO_CFTP = 62;

/// "hello" routing protocol
pub defPPROTO_HELLO = 63;

/// SATNET/Backroom EXPAK
pub defPPROTO_SATEXPAK = 64;

/// Kryptolan
pub defPPROTO_KRYPTOLAN = 65;

/// Remote Virtual Disk
pub defPPROTO_RVD = 66;

/// Pluribus Packet Core
pub defPPROTO_IPPC = 67;

/// Any distributed FS
pub defPPROTO_ADFS = 68;

/// Satnet Monitoring
pub defPPROTO_SATMON = 69;

/// VISA Protocol
pub defPPROTO_VISA = 70;

/// Packet Core Utility
pub defPPROTO_IPCV = 71;

/// Comp. Prot. Net. Executive
pub defPPROTO_CPNX = 72;

/// Comp. Prot. HeartBeat
pub defPPROTO_CPHB = 73;

/// Wang Span Network
pub defPPROTO_WSN = 74;

/// Packet Video Protocol
pub defPPROTO_PVP = 75;

/// BackRoom SATNET Monitoring
pub defPPROTO_BRSATMON = 76;

/// Sun net disk proto (temp.)
pub defPPROTO_ND = 77;

/// WIDEBAND Monitoring
pub defPPROTO_WBMON = 78;

/// WIDEBAND EXPAK
pub defPPROTO_WBEXPAK = 79;

/// ISO cnlp
pub defPPROTO_EON = 80;

/// VMTP
pub defPPROTO_VMTP = 81;

/// Secure VMTP
pub defPPROTO_SVMTP = 82;

/// Banyon VINES
pub defPPROTO_VINES = 83;

/// TTP
pub defPPROTO_TTP = 84;

/// NSFNET-IGP
pub defPPROTO_IGP = 85;

/// dissimilar gateway prot.
pub defPPROTO_DGP = 86;

/// TCF
pub defPPROTO_TCF = 87;

/// Cisco/GXS IGRP
pub defPPROTO_IGRP = 88;

/// OSPFIGP
pub defPPROTO_OSPFIGP = 89;

/// Strite RPC protocol
pub defPPROTO_SRPC = 90;

/// Locus Address Resoloution
pub defPPROTO_LARP = 91;

/// Multicast Transport
pub defPPROTO_MTP = 92;

/// AX.25 Frames
pub defPPROTO_AX25 = 93;

/// IP encapsulated in IP
pub defPPROTO_IPEIP = 94;

/// Mobile Int.ing control
pub defPPROTO_MICP = 95;

/// Semaphore Comm. security
pub defPPROTO_SCCSP = 96;

/// Ethernet IP encapsulation
pub defPPROTO_ETHERIP = 97;

/// encapsulation header
pub defPPROTO_ENCAP = 98;

/// any private encr. scheme
pub defPPROTO_APES = 99;

/// GMTP
pub defPPROTO_GMTP = 100;

/// payload compression (IPComp)
pub defPPROTO_IPCOMP = 108;

/// SCTP
pub defPPROTO_SCTP = 132;

/// IPv6 Mobility Header
pub defPPROTO_MH = 135;

/// UDP-Lite
pub defPPROTO_UDPLITE = 136;

/// IP6 Host Identity Protocol
pub defPPROTO_HIP = 139;

/// IP6 Shim6 Protocol
pub defPPROTO_SHIM6 = 140;

/// Protocol Independent Mcast
pub defPPROTO_PIM = 103;

/// CARP
pub defPPROTO_CARP = 112;

/// PGM
pub defPPROTO_PGM = 113;

/// MPLS-in-IP
pub defPPROTO_MPLS = 137;

/// PFSYNC
pub defPPROTO_PFSYNC = 240;

/// Reserved
pub defPPROTO_RESERVED_253 = 253;

/// Reserved
pub defPPROTO_RESERVED_254 = 254;
