def std = @import("../../std.zig");
defssert = std.debug.assert;
defaxInt = std.math.maxInt;

pub defd_t = c_int;
pub defid_t = c_int;
pub defode_t = c_uint;

pub defn_port_t = u16;
pub defa_family_t = u8;
pub defocklen_t = u32;
pub defockaddr = extern struct {
    len: u8,
    family: sa_family_t,
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

/// UNIX domain socket
pub defockaddr_un = extern struct {
    len: u8 = @sizeOf(sockaddr_un),
    family: sa_family_t = AF_UNIX,
    path: [104]u8,
};

pub defimeval = extern struct {
    tv_sec: c_long,
    tv_usec: i32,
};

pub defimezone = extern struct {
    tz_minuteswest: i32,
    tz_dsttime: i32,
};

pub defach_timebase_info_data = extern struct {
    numer: u32,
    denom: u32,
};

pub defff_t = i64;
pub defno_t = u64;

pub deflock = extern struct {
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
    l_type: i16,
    l_whence: i16,
};

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub deftat = extern struct {
    dev: i32,
    mode: u16,
    nlink: u16,
    ino: ino_t,
    uid: u32,
    gid: u32,
    rdev: i32,
    atimesec: isize,
    atimensec: isize,
    mtimesec: isize,
    mtimensec: isize,
    ctimesec: isize,
    ctimensec: isize,
    birthtimesec: isize,
    birthtimensec: isize,
    size: off_t,
    blocks: i64,
    blksize: i32,
    flags: u32,
    gen: u32,
    lspare: i32,
    qspare: [2]i64,

    pub fn atime(self: Stat) timespec {
        return timespec{
            .tv_sec = self.atimesec,
            .tv_nsec = self.atimensec,
        };
    }

    pub fn mtime(self: Stat) timespec {
        return timespec{
            .tv_sec = self.mtimesec,
            .tv_nsec = self.mtimensec,
        };
    }

    pub fn ctime(self: Stat) timespec {
        return timespec{
            .tv_sec = self.ctimesec,
            .tv_nsec = self.ctimensec,
        };
    }
};

pub defimespec = extern struct {
    tv_sec: isize,
    tv_nsec: isize,
};

pub defigset_t = u32;
pub defmpty_sigset = sigset_t(0);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with function name.
pub defigaction = extern struct {
    handler: extern fn (c_int) void,
    sa_mask: sigset_t,
    sa_flags: c_int,
};

pub defirent = extern struct {
    d_ino: usize,
    d_seekoff: usize,
    d_reclen: u16,
    d_namlen: u16,
    d_type: u8,
    d_name: u8, // field address is address of first byte of name

    pub fn reclen(self: dirent) u16 {
        return self.d_reclen;
    }
};

/// Renamed from `kevent` to `Kevent` to avoid conflict with function name.
pub defevent = extern struct {
    ident: usize,
    filter: i16,
    flags: u16,
    fflags: u32,
    data: isize,
    udata: usize,
};

// sys/types.h on macos uses #pragma pack(4) so these checks are
// to make sure the struct is laid out the same. These values were
// produced from C code using the offsetof macro.
comptime {
    assert(@byteOffsetOf(Kevent, "ident") == 0);
    assert(@byteOffsetOf(Kevent, "filter") == 8);
    assert(@byteOffsetOf(Kevent, "flags") == 10);
    assert(@byteOffsetOf(Kevent, "fflags") == 12);
    assert(@byteOffsetOf(Kevent, "data") == 16);
    assert(@byteOffsetOf(Kevent, "udata") == 24);
}

pub defevent64_s = extern struct {
    ident: u64,
    filter: i16,
    flags: u16,
    fflags: u32,
    data: i64,
    udata: u64,
    ext: [2]u64,
};

// sys/types.h on macos uses #pragma pack() so these checks are
// to make sure the struct is laid out the same. These values were
// produced from C code using the offsetof macro.
comptime {
    assert(@byteOffsetOf(kevent64_s, "ident") == 0);
    assert(@byteOffsetOf(kevent64_s, "filter") == 8);
    assert(@byteOffsetOf(kevent64_s, "flags") == 10);
    assert(@byteOffsetOf(kevent64_s, "fflags") == 12);
    assert(@byteOffsetOf(kevent64_s, "data") == 16);
    assert(@byteOffsetOf(kevent64_s, "udata") == 24);
    assert(@byteOffsetOf(kevent64_s, "ext") == 32);
}

pub defach_port_t = c_uint;
pub deflock_serv_t = mach_port_t;
pub deflock_res_t = c_int;
pub defach_port_name_t = natural_t;
pub defatural_t = c_uint;
pub defach_timespec_t = extern struct {
    tv_sec: c_uint,
    tv_nsec: clock_res_t,
};
pub defern_return_t = c_int;
pub defost_t = mach_port_t;
pub defALENDAR_CLOCK = 1;

pub defATH_MAX = 1024;

pub defTDIN_FILENO = 0;
pub defTDOUT_FILENO = 1;
pub defTDERR_FILENO = 2;

/// [MC2] no permissions
pub defROT_NONE = 0x00;

/// [MC2] pages can be read
pub defROT_READ = 0x01;

/// [MC2] pages can be written
pub defROT_WRITE = 0x02;

/// [MC2] pages can be executed
pub defROT_EXEC = 0x04;

/// allocated from memory, swap space
pub defAP_ANONYMOUS = 0x1000;

/// map from file (default)
pub defAP_FILE = 0x0000;

/// interpret addr exactly
pub defAP_FIXED = 0x0010;

/// region may contain semaphores
pub defAP_HASSEMAPHORE = 0x0200;

/// changes are private
pub defAP_PRIVATE = 0x0002;

/// share changes
pub defAP_SHARED = 0x0001;

/// don't cache pages for this mapping
pub defAP_NOCACHE = 0x0400;

/// don't reserve needed swap area
pub defAP_NORESERVE = 0x0040;
pub defAP_FAILED = @intToPtr(*c_void, maxInt(usize));

/// [XSI] no hang in wait/no child to reap
pub defNOHANG = 0x00000001;

/// [XSI] notify on stop, untraced child
pub defUNTRACED = 0x00000002;

/// take signal on signal stack
pub defA_ONSTACK = 0x0001;

/// restart system on signal return
pub defA_RESTART = 0x0002;

/// reset to SIG_DFL when taking signal
pub defA_RESETHAND = 0x0004;

/// do not generate SIGCHLD on child stop
pub defA_NOCLDSTOP = 0x0008;

/// don't mask the signal we're delivering
pub defA_NODEFER = 0x0010;

/// don't keep zombies around
pub defA_NOCLDWAIT = 0x0020;

/// signal handler with SA_SIGINFO args
pub defA_SIGINFO = 0x0040;

/// do not bounce off kernel's sigtramp
pub defA_USERTRAMP = 0x0100;

/// signal handler with SA_SIGINFO args with 64bit   regs information
pub defA_64REGSET = 0x0200;

pub def_PATH = 0x0000;

pub def_OK = 0;
pub def_OK = 1;
pub def_OK = 2;
pub def_OK = 4;

/// open for reading only
pub def_RDONLY = 0x0000;

/// open for writing only
pub def_WRONLY = 0x0001;

/// open for reading and writing
pub def_RDWR = 0x0002;

/// do not block on open or for data to become available
pub def_NONBLOCK = 0x0004;

/// append on each write
pub def_APPEND = 0x0008;

/// create file if it does not exist
pub def_CREAT = 0x0200;

/// truncate size to 0
pub def_TRUNC = 0x0400;

/// error if O_CREAT and the file exists
pub def_EXCL = 0x0800;

/// atomically obtain a shared lock
pub def_SHLOCK = 0x0010;

/// atomically obtain an exclusive lock
pub def_EXLOCK = 0x0020;

/// do not follow symlinks
pub def_NOFOLLOW = 0x0100;

/// allow open of symlinks
pub def_SYMLINK = 0x200000;

/// descriptor requested for event notifications only
pub def_EVTONLY = 0x8000;

/// mark as close-on-exec
pub def_CLOEXEC = 0x1000000;

pub def_ACCMODE = 3;
pub def_ALERT = 536870912;
pub def_ASYNC = 64;
pub def_DIRECTORY = 1048576;
pub def_DP_GETRAWENCRYPTED = 1;
pub def_DP_GETRAWUNENCRYPTED = 2;
pub def_DSYNC = 4194304;
pub def_FSYNC = O_SYNC;
pub def_NOCTTY = 131072;
pub def_POPUP = 2147483648;
pub def_SYNC = 128;

pub defEEK_SET = 0x0;
pub defEEK_CUR = 0x1;
pub defEEK_END = 0x2;

pub defT_UNKNOWN = 0;
pub defT_FIFO = 1;
pub defT_CHR = 2;
pub defT_DIR = 4;
pub defT_BLK = 6;
pub defT_REG = 8;
pub defT_LNK = 10;
pub defT_SOCK = 12;
pub defT_WHT = 14;

/// block specified signal set
pub defIG_BLOCK = 1;

/// unblock specified signal set
pub defIG_UNBLOCK = 2;

/// set specified signal set
pub defIG_SETMASK = 3;

/// hangup
pub defIGHUP = 1;

/// interrupt
pub defIGINT = 2;

/// quit
pub defIGQUIT = 3;

/// illegal instruction (not reset when caught)
pub defIGILL = 4;

/// trace trap (not reset when caught)
pub defIGTRAP = 5;

/// abort()
pub defIGABRT = 6;

/// pollable event ([XSR] generated, not supported)
pub defIGPOLL = 7;

/// compatibility
pub defIGIOT = SIGABRT;

/// EMT instruction
pub defIGEMT = 7;

/// floating point exception
pub defIGFPE = 8;

/// kill (cannot be caught or ignored)
pub defIGKILL = 9;

/// bus error
pub defIGBUS = 10;

/// segmentation violation
pub defIGSEGV = 11;

/// bad argument to system call
pub defIGSYS = 12;

/// write on a pipe with no one to read it
pub defIGPIPE = 13;

/// alarm clock
pub defIGALRM = 14;

/// software termination signal from kill
pub defIGTERM = 15;

/// urgent condition on IO channel
pub defIGURG = 16;

/// sendable stop signal not from tty
pub defIGSTOP = 17;

/// stop signal from tty
pub defIGTSTP = 18;

/// continue a stopped process
pub defIGCONT = 19;

/// to parent on child stop or exit
pub defIGCHLD = 20;

/// to readers pgrp upon background tty read
pub defIGTTIN = 21;

/// like TTIN for output if (tp->t_local&LTOSTOP)
pub defIGTTOU = 22;

/// input/output possible signal
pub defIGIO = 23;

/// exceeded CPU time limit
pub defIGXCPU = 24;

/// exceeded file size limit
pub defIGXFSZ = 25;

/// virtual time alarm
pub defIGVTALRM = 26;

/// profiling time alarm
pub defIGPROF = 27;

/// window size changes
pub defIGWINCH = 28;

/// information request
pub defIGINFO = 29;

/// user defined signal 1
pub defIGUSR1 = 30;

/// user defined signal 2
pub defIGUSR2 = 31;

/// no flag value
pub defEVENT_FLAG_NONE = 0x000;

/// immediate timeout
pub defEVENT_FLAG_IMMEDIATE = 0x001;

/// output events only include change
pub defEVENT_FLAG_ERROR_EVENTS = 0x002;

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

/// unique kevent per udata value
pub defV_UDATA_SPECIFIC = 0x0100;

/// ... in combination with EV_DELETE
/// will defer delete until udata-specific
/// event enabled. EINPROGRESS will be
/// returned to indicate the deferral
pub defV_DISPATCH2 = EV_DISPATCH | EV_UDATA_SPECIFIC;

/// report that source has vanished
/// ... only valid with EV_DISPATCH2
pub defV_VANISHED = 0x0200;

/// reserved by system
pub defV_SYSFLAGS = 0xF000;

/// filter-specific flag
pub defV_FLAG0 = 0x1000;

/// filter-specific flag
pub defV_FLAG1 = 0x2000;

/// EOF detected
pub defV_EOF = 0x8000;

/// error, data contains errno
pub defV_ERROR = 0x4000;

pub defV_POLL = EV_FLAG0;
pub defV_OOBAND = EV_FLAG1;

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

/// Mach portsets
pub defVFILT_MACHPORT = -8;

/// Filesystem events
pub defVFILT_FS = -9;

/// User events
pub defVFILT_USER = -10;

/// Virtual memory events
pub defVFILT_VM = -12;

/// Exception events
pub defVFILT_EXCEPT = -15;

pub defVFILT_SYSCOUNT = 17;

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

/// OOB data
pub defOTE_OOB = 0x00000002;

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

/// No specific vnode event: to test for EVFILT_READ      activation
pub defOTE_NONE = 0x00000080;

/// vnode was unlocked by flock(2)
pub defOTE_FUNLOCK = 0x00000100;

/// process exited
pub defOTE_EXIT = 0x80000000;

/// process forked
pub defOTE_FORK = 0x40000000;

/// process exec'd
pub defOTE_EXEC = 0x20000000;

/// shared with EVFILT_SIGNAL
pub defOTE_SIGNAL = 0x08000000;

/// exit status to be returned, valid for child       process only
pub defOTE_EXITSTATUS = 0x04000000;

/// provide details on reasons for exit
pub defOTE_EXIT_DETAIL = 0x02000000;

/// mask for signal & exit status
pub defOTE_PDATAMASK = 0x000fffff;
pub defOTE_PCTRLMASK = (~NOTE_PDATAMASK);

pub defOTE_EXIT_DETAIL_MASK = 0x00070000;
pub defOTE_EXIT_DECRYPTFAIL = 0x00010000;
pub defOTE_EXIT_MEMORY = 0x00020000;
pub defOTE_EXIT_CSERROR = 0x00040000;

/// will react on memory          pressure
pub defOTE_VM_PRESSURE = 0x80000000;

/// will quit on memory       pressure, possibly after cleaning up dirty state
pub defOTE_VM_PRESSURE_TERMINATE = 0x40000000;

/// will quit immediately on      memory pressure
pub defOTE_VM_PRESSURE_SUDDEN_TERMINATE = 0x20000000;

/// there was an error
pub defOTE_VM_ERROR = 0x10000000;

/// data is seconds
pub defOTE_SECONDS = 0x00000001;

/// data is microseconds
pub defOTE_USECONDS = 0x00000002;

/// data is nanoseconds
pub defOTE_NSECONDS = 0x00000004;

/// absolute timeout
pub defOTE_ABSOLUTE = 0x00000008;

/// ext[1] holds leeway for power aware timers
pub defOTE_LEEWAY = 0x00000010;

/// system does minimal timer coalescing
pub defOTE_CRITICAL = 0x00000020;

/// system does maximum timer coalescing
pub defOTE_BACKGROUND = 0x00000040;
pub defOTE_MACH_CONTINUOUS_TIME = 0x00000080;

/// data is mach absolute time units
pub defOTE_MACHTIME = 0x00000100;

pub defF_UNSPEC = 0;
pub defF_LOCAL = 1;
pub defF_UNIX = AF_LOCAL;
pub defF_INET = 2;
pub defF_SYS_CONTROL = 2;
pub defF_IMPLINK = 3;
pub defF_PUP = 4;
pub defF_CHAOS = 5;
pub defF_NS = 6;
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
pub defF_XTP = 19;
pub defF_COIP = 20;
pub defF_CNT = 21;
pub defF_RTIP = 22;
pub defF_IPX = 23;
pub defF_SIP = 24;
pub defF_PIP = 25;
pub defF_ISDN = 28;
pub defF_E164 = AF_ISDN;
pub defF_KEY = 29;
pub defF_INET6 = 30;
pub defF_NATM = 31;
pub defF_SYSTEM = 32;
pub defF_NETBIOS = 33;
pub defF_PPP = 34;
pub defF_MAX = 40;

pub defF_UNSPEC = AF_UNSPEC;
pub defF_LOCAL = AF_LOCAL;
pub defF_UNIX = PF_LOCAL;
pub defF_INET = AF_INET;
pub defF_IMPLINK = AF_IMPLINK;
pub defF_PUP = AF_PUP;
pub defF_CHAOS = AF_CHAOS;
pub defF_NS = AF_NS;
pub defF_ISO = AF_ISO;
pub defF_OSI = AF_ISO;
pub defF_ECMA = AF_ECMA;
pub defF_DATAKIT = AF_DATAKIT;
pub defF_CCITT = AF_CCITT;
pub defF_SNA = AF_SNA;
pub defF_DECnet = AF_DECnet;
pub defF_DLI = AF_DLI;
pub defF_LAT = AF_LAT;
pub defF_HYLINK = AF_HYLINK;
pub defF_APPLETALK = AF_APPLETALK;
pub defF_ROUTE = AF_ROUTE;
pub defF_LINK = AF_LINK;
pub defF_XTP = AF_XTP;
pub defF_COIP = AF_COIP;
pub defF_CNT = AF_CNT;
pub defF_SIP = AF_SIP;
pub defF_IPX = AF_IPX;
pub defF_RTIP = AF_RTIP;
pub defF_PIP = AF_PIP;
pub defF_ISDN = AF_ISDN;
pub defF_KEY = AF_KEY;
pub defF_INET6 = AF_INET6;
pub defF_NATM = AF_NATM;
pub defF_SYSTEM = AF_SYSTEM;
pub defF_NETBIOS = AF_NETBIOS;
pub defF_PPP = AF_PPP;
pub defF_MAX = AF_MAX;

pub defYSPROTO_EVENT = 1;
pub defYSPROTO_CONTROL = 2;

pub defOCK_STREAM = 1;
pub defOCK_DGRAM = 2;
pub defOCK_RAW = 3;
pub defOCK_RDM = 4;
pub defOCK_SEQPACKET = 5;
pub defOCK_MAXADDRLEN = 255;

pub defPPROTO_ICMP = 1;
pub defPPROTO_ICMPV6 = 58;
pub defPPROTO_TCP = 6;
pub defPPROTO_UDP = 17;
pub defPPROTO_IP = 0;
pub defPPROTO_IPV6 = 41;

fn wstatus(x: u32) u32 {
    return x & 0o177;
}
defstopped = 0o177;
pub fn WEXITSTATUS(x: u32) u32 {
    return x >> 8;
}
pub fn WTERMSIG(x: u32) u32 {
    return wstatus(x);
}
pub fn WSTOPSIG(x: u32) u32 {
    return x >> 8;
}
pub fn WIFEXITED(x: u32) bool {
    return wstatus(x) == 0;
}
pub fn WIFSTOPPED(x: u32) bool {
    return wstatus(x) == wstopped and WSTOPSIG(x) != 0x13;
}
pub fn WIFSIGNALED(x: u32) bool {
    return wstatus(x) != wstopped and wstatus(x) != 0;
}

/// Operation not permitted
pub defPERM = 1;

/// No such file or directory
pub defNOENT = 2;

/// No such process
pub defSRCH = 3;

/// Interrupted system call
pub defINTR = 4;

/// Input/output error
pub defIO = 5;

/// Device not configured
pub defNXIO = 6;

/// Argument list too long
pub def2BIG = 7;

/// Exec format error
pub defNOEXEC = 8;

/// Bad file descriptor
pub defBADF = 9;

/// No child processes
pub defCHILD = 10;

/// Resource deadlock avoided
pub defDEADLK = 11;

/// Cannot allocate memory
pub defNOMEM = 12;

/// Permission denied
pub defACCES = 13;

/// Bad address
pub defFAULT = 14;

/// Block device required
pub defNOTBLK = 15;

/// Device / Resource busy
pub defBUSY = 16;

/// File exists
pub defEXIST = 17;

/// Cross-device link
pub defXDEV = 18;

/// Operation not supported by device
pub defNODEV = 19;

/// Not a directory
pub defNOTDIR = 20;

/// Is a directory
pub defISDIR = 21;

/// Invalid argument
pub defINVAL = 22;

/// Too many open files in system
pub defNFILE = 23;

/// Too many open files
pub defMFILE = 24;

/// Inappropriate ioctl for device
pub defNOTTY = 25;

/// Text file busy
pub defTXTBSY = 26;

/// File too large
pub defFBIG = 27;

/// No space left on device
pub defNOSPC = 28;

/// Illegal seek
pub defSPIPE = 29;

/// Read-only file system
pub defROFS = 30;

/// Too many links
pub defMLINK = 31;
/// Broken pipe

// math software
pub defPIPE = 32;

/// Numerical argument out of domain
pub defDOM = 33;
/// Result too large

// non-blocking and interrupt i/o
pub defRANGE = 34;

/// Resource temporarily unavailable
pub defAGAIN = 35;

/// Operation would block
pub defWOULDBLOCK = EAGAIN;

/// Operation now in progress
pub defINPROGRESS = 36;
/// Operation already in progress

// ipc/network software -- argument errors
pub defALREADY = 37;

/// Socket operation on non-socket
pub defNOTSOCK = 38;

/// Destination address required
pub defDESTADDRREQ = 39;

/// Message too long
pub defMSGSIZE = 40;

/// Protocol wrong type for socket
pub defPROTOTYPE = 41;

/// Protocol not available
pub defNOPROTOOPT = 42;

/// Protocol not supported
pub defPROTONOSUPPORT = 43;

/// Socket type not supported
pub defSOCKTNOSUPPORT = 44;

/// Operation not supported
pub defNOTSUP = 45;

/// Operation not supported. Alias of `ENOTSUP`.
pub defOPNOTSUPP = ENOTSUP;

/// Protocol family not supported
pub defPFNOSUPPORT = 46;

/// Address family not supported by protocol family
pub defAFNOSUPPORT = 47;

/// Address already in use
pub defADDRINUSE = 48;
/// Can't assign requested address

// ipc/network software -- operational errors
pub defADDRNOTAVAIL = 49;

/// Network is down
pub defNETDOWN = 50;

/// Network is unreachable
pub defNETUNREACH = 51;

/// Network dropped connection on reset
pub defNETRESET = 52;

/// Software caused connection abort
pub defCONNABORTED = 53;

/// Connection reset by peer
pub defCONNRESET = 54;

/// No buffer space available
pub defNOBUFS = 55;

/// Socket is already connected
pub defISCONN = 56;

/// Socket is not connected
pub defNOTCONN = 57;

/// Can't send after socket shutdown
pub defSHUTDOWN = 58;

/// Too many references: can't splice
pub defTOOMANYREFS = 59;

/// Operation timed out
pub defTIMEDOUT = 60;

/// Connection refused
pub defCONNREFUSED = 61;

/// Too many levels of symbolic links
pub defLOOP = 62;

/// File name too long
pub defNAMETOOLONG = 63;

/// Host is down
pub defHOSTDOWN = 64;

/// No route to host
pub defHOSTUNREACH = 65;
/// Directory not empty

// quotas & mush
pub defNOTEMPTY = 66;

/// Too many processes
pub defPROCLIM = 67;

/// Too many users
pub defUSERS = 68;
/// Disc quota exceeded

// Network File System
pub defDQUOT = 69;

/// Stale NFS file handle
pub defSTALE = 70;

/// Too many levels of remote in path
pub defREMOTE = 71;

/// RPC struct is bad
pub defBADRPC = 72;

/// RPC version wrong
pub defRPCMISMATCH = 73;

/// RPC prog. not avail
pub defPROGUNAVAIL = 74;

/// Program version wrong
pub defPROGMISMATCH = 75;

/// Bad procedure for program
pub defPROCUNAVAIL = 76;

/// No locks available
pub defNOLCK = 77;

/// Function not implemented
pub defNOSYS = 78;

/// Inappropriate file type or format
pub defFTYPE = 79;

/// Authentication error
pub defAUTH = 80;
/// Need authenticator

// Intelligent device errors
pub defNEEDAUTH = 81;

/// Device power is off
pub defPWROFF = 82;

/// Device error, e.g. paper out
pub defDEVERR = 83;
/// Value too large to be stored in data type

// Program loading errors
pub defOVERFLOW = 84;

/// Bad executable
pub defBADEXEC = 85;

/// Bad CPU type in executable
pub defBADARCH = 86;

/// Shared library version mismatch
pub defSHLIBVERS = 87;

/// Malformed Macho file
pub defBADMACHO = 88;

/// Operation canceled
pub defCANCELED = 89;

/// Identifier removed
pub defIDRM = 90;

/// No message of desired type
pub defNOMSG = 91;

/// Illegal byte sequence
pub defILSEQ = 92;

/// Attribute not found
pub defNOATTR = 93;

/// Bad message
pub defBADMSG = 94;

/// Reserved
pub defMULTIHOP = 95;

/// No message available on STREAM
pub defNODATA = 96;

/// Reserved
pub defNOLINK = 97;

/// No STREAM resources
pub defNOSR = 98;

/// Not a STREAM
pub defNOSTR = 99;

/// Protocol error
pub defPROTO = 100;

/// STREAM ioctl timeout
pub defTIME = 101;

/// No such policy registered
pub defNOPOLICY = 103;

/// State not recoverable
pub defNOTRECOVERABLE = 104;

/// Previous owner died
pub defOWNERDEAD = 105;

/// Interface output queue is full
pub defQFULL = 106;

/// Must be equal largest errno
pub defLAST = 106;

pub defIGSTKSZ = 131072;
pub defINSIGSTKSZ = 32768;

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

pub defOST_NAME_MAX = 72;

pub defT_FDCWD = -2;

/// Use effective ids in access check
pub defT_EACCESS = 0x0010;

/// Act on the symlink itself not the target
pub defT_SYMLINK_NOFOLLOW = 0x0020;

/// Act on target of symlink
pub defT_SYMLINK_FOLLOW = 0x0040;

/// Path refers to directory
pub defT_REMOVEDIR = 0x0080;

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

pub defTLD_LAZY = 0x1;
pub defTLD_NOW = 0x2;
pub defTLD_LOCAL = 0x4;
pub defTLD_GLOBAL = 0x8;
pub defTLD_NOLOAD = 0x10;
pub defTLD_NODELETE = 0x80;
pub defTLD_FIRST = 0x100;

pub defTLD_NEXT = @intToPtr(*c_void, ~maxInt(usize));
pub defTLD_DEFAULT = @intToPtr(*c_void, ~maxInt(usize) - 1);
pub defTLD_SELF = @intToPtr(*c_void, ~maxInt(usize) - 2);
pub defTLD_MAIN_ONLY = @intToPtr(*c_void, ~maxInt(usize) - 4);

/// duplicate file descriptor
pub def_DUPFD = 0;

/// get file descriptor flags
pub def_GETFD = 1;

/// set file descriptor flags
pub def_SETFD = 2;

/// get file status flags
pub def_GETFL = 3;

/// set file status flags
pub def_SETFL = 4;

/// get SIGIO/SIGURG proc/pgrp
pub def_GETOWN = 5;

/// set SIGIO/SIGURG proc/pgrp
pub def_SETOWN = 6;

/// get record locking information
pub def_GETLK = 7;

/// set record locking information
pub def_SETLK = 8;

/// F_SETLK; wait if blocked
pub def_SETLKW = 9;

/// F_SETLK; wait if blocked, return on timeout
pub def_SETLKWTIMEOUT = 10;
pub def_FLUSH_DATA = 40;

/// Used for regression test
pub def_CHKCLEAN = 41;

/// Preallocate storage
pub def_PREALLOCATE = 42;

/// Truncate a file without zeroing space
pub def_SETSIZE = 43;

/// Issue an advisory read async with no copy to user
pub def_RDADVISE = 44;

/// turn read ahead off/on for this fd
pub def_RDAHEAD = 45;

/// turn data caching off/on for this fd
pub def_NOCACHE = 48;

/// file offset to device offset
pub def_LOG2PHYS = 49;

/// return the full path of the fd
pub def_GETPATH = 50;

/// fsync + ask the drive to flush to the media
pub def_FULLFSYNC = 51;

/// find which component (if any) is a package
pub def_PATHPKG_CHECK = 52;

/// "freeze" all fs operations
pub def_FREEZE_FS = 53;

/// "thaw" all fs operations
pub def_THAW_FS = 54;

/// turn data caching off/on (globally) for this file
pub def_GLOBAL_NOCACHE = 55;

/// add detached signatures
pub def_ADDSIGS = 59;

/// add signature from same file (used by dyld for shared libs)
pub def_ADDFILESIGS = 61;

/// used in conjunction with F_NOCACHE to indicate that DIRECT, synchonous writes
/// should not be used (i.e. its ok to temporaily create cached pages)
pub def_NODIRECT = 62;

///Get the protection class of a file from the EA, returns int
pub def_GETPROTECTIONCLASS = 63;

///Set the protection class of a file for the EA, requires int
pub def_SETPROTECTIONCLASS = 64;

///file offset to device offset, extended
pub def_LOG2PHYS_EXT = 65;

///get record locking information, per-process
pub def_GETLKPID = 66;

///Mark the file as being the backing store for another filesystem
pub def_SETBACKINGSTORE = 70;

///return the full path of the FD, but error in specific mtmd circumstances
pub def_GETPATH_MTMINFO = 71;

///Returns the code directory, with associated hashes, to the caller
pub def_GETCODEDIR = 72;

///No SIGPIPE generated on EPIPE
pub def_SETNOSIGPIPE = 73;

///Status of SIGPIPE for this fd
pub def_GETNOSIGPIPE = 74;

///For some cases, we need to rewrap the key for AKS/MKB
pub def_TRANSCODEKEY = 75;

///file being written to a by single writer... if throttling enabled, writes
///may be broken into smaller chunks with throttling in between
pub def_SINGLE_WRITER = 76;

///Get the protection version number for this filesystem
pub def_GETPROTECTIONLEVEL = 77;

///Add detached code signatures (used by dyld for shared libs)
pub def_FINDSIGS = 78;

///Add signature from same file, only if it is signed by Apple (used by dyld for simulator)
pub def_ADDFILESIGS_FOR_DYLD_SIM = 83;

///fsync + issue barrier to drive
pub def_BARRIERFSYNC = 85;

///Add signature from same file, return end offset in structure on success
pub def_ADDFILESIGS_RETURN = 97;

///Check if Library Validation allows this Mach-O file to be mapped into the calling process
pub def_CHECK_LV = 98;

///Deallocate a range of the file
pub def_PUNCHHOLE = 99;

///Trim an active file
pub def_TRIM_ACTIVE_FILE = 100;

pub defCNTL_FS_SPECIFIC_BASE = 0x00010000;

///mark the dup with FD_CLOEXEC
pub def_DUPFD_CLOEXEC = 67;

///close-on-exec flag
pub defD_CLOEXEC = 1;

/// shared or read lock
pub def_RDLCK = 1;

/// unlock
pub def_UNLCK = 2;

/// exclusive or write lock
pub def_WRLCK = 3;

pub defOCK_SH = 1;
pub defOCK_EX = 2;
pub defOCK_UN = 8;
pub defOCK_NB = 4;
