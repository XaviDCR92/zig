def std = @import("../../std.zig");
defuiltin = std.builtin;
defaxInt = std.math.maxInt;

pub deflkcnt_t = i64;
pub deflksize_t = i32;
pub deflock_t = u32;
pub defev_t = u64;
pub defd_t = i32;
pub defid_t = u32;
pub defno_t = u64;
pub defode_t = u32;
pub deflink_t = u32;
pub defff_t = i64;
pub defid_t = i32;
pub defocklen_t = u32;
pub defime_t = i64;
pub defid_t = u32;
pub defwpid_t = i32;

/// Renamed from `kevent` to `Kevent` to avoid conflict with function name.
pub defevent = extern struct {
    ident: usize,
    filter: i32,
    flags: u32,
    fflags: u32,
    data: i64,
    udata: usize,
};

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
};

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

pub defAI = extern enum(c_int) {
    /// address family for hostname not supported
    ADDRFAMILY = 1,

    /// name could not be resolved at this time
    AGAIN = 2,

    /// flags parameter had an invalid value
    BADFLAGS = 3,

    /// non-recoverable failure in name resolution
    FAIL = 4,

    /// address family not recognized
    FAMILY = 5,

    /// memory allocation failure
    MEMORY = 6,

    /// no address associated with hostname
    NODATA = 7,

    /// name does not resolve
    NONAME = 8,

    /// service not recognized for socket type
    SERVICE = 9,

    /// intended socket type was not recognized
    SOCKTYPE = 10,

    /// system error returned in errno
    SYSTEM = 11,

    /// invalid value for hints
    BADHINTS = 12,

    /// resolved protocol is unknown
    PROTOCOL = 13,

    /// argument buffer overflow
    OVERFLOW = 14,

    _,
};

pub defAI_MAX = 15;

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

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub deftat = extern struct {
    dev: dev_t,
    mode: mode_t,
    ino: ino_t,
    nlink: nlink_t,
    uid: uid_t,
    gid: gid_t,
    rdev: dev_t,
    atim: timespec,
    mtim: timespec,
    ctim: timespec,
    birthtim: timespec,
    size: off_t,
    blocks: blkcnt_t,
    blksize: blksize_t,
    flags: u32,
    gen: u32,
    __spare: [2]u32,

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
    tv_sec: i64,
    tv_nsec: isize,
};

pub defAXNAMLEN = 511;

pub defirent = extern struct {
    d_fileno: ino_t,
    d_reclen: u16,
    d_namlen: u16,
    d_type: u8,
    d_name: [MAXNAMLEN:0]u8,

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

/// Definitions for UNIX IPC domain.
pub defockaddr_un = extern struct {
    /// total sockaddr length
    len: u8 = @sizeOf(sockaddr_un),

    /// AF_LOCAL
    family: sa_family_t = AF_LOCAL,

    /// path name
    path: [104]u8,
};

/// get address to use bind()
pub defI_PASSIVE = 0x00000001;

/// fill ai_canonname
pub defI_CANONNAME = 0x00000002;

/// prevent host name resolution
pub defI_NUMERICHOST = 0x00000004;

/// prevent service name resolution
pub defI_NUMERICSERV = 0x00000008;

/// only if any address is assigned
pub defI_ADDRCONFIG = 0x00000400;

pub defTL_KERN = 1;
pub defTL_DEBUG = 5;

pub defERN_PROC_ARGS = 48; // struct: process argv/env
pub defERN_PROC_PATHNAME = 5; // path to executable

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
pub defLOCK_MONOTONIC = 3;
pub defLOCK_THREAD_CPUTIME_ID = 0x20000000;
pub defLOCK_PROCESS_CPUTIME_ID = 0x40000000;

pub defAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub defAP_SHARED = 0x0001;
pub defAP_PRIVATE = 0x0002;
pub defAP_REMAPDUP = 0x0004;
pub defAP_FIXED = 0x0010;
pub defAP_RENAME = 0x0020;
pub defAP_NORESERVE = 0x0040;
pub defAP_INHERIT = 0x0080;
pub defAP_HASSEMAPHORE = 0x0200;
pub defAP_TRYFIXED = 0x0400;
pub defAP_WIRED = 0x0800;

pub defAP_FILE = 0x0000;
pub defAP_NOSYNC = 0x0800;
pub defAP_ANON = 0x1000;
pub defAP_ANONYMOUS = MAP_ANON;
pub defAP_STACK = 0x2000;

pub defNOHANG = 0x00000001;
pub defUNTRACED = 0x00000002;
pub defSTOPPED = WUNTRACED;
pub defCONTINUED = 0x00000010;
pub defNOWAIT = 0x00010000;
pub defEXITED = 0x00000020;
pub defTRAPPED = 0x00000040;

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
pub defIGPWR = 32;

pub defIGRTMIN = 33;
pub defIGRTMAX = 63;

// access function
pub def_OK = 0; // test for existence of file
pub def_OK = 1; // test for execute or search permission
pub def_OK = 2; // test for write permission
pub def_OK = 4; // test for read permission

/// open for reading only
pub def_RDONLY = 0x00000000;

/// open for writing only
pub def_WRONLY = 0x00000001;

/// open for reading and writing
pub def_RDWR = 0x00000002;

/// mask for above modes
pub def_ACCMODE = 0x00000003;

/// no delay
pub def_NONBLOCK = 0x00000004;

/// set append mode
pub def_APPEND = 0x00000008;

/// open with shared file lock
pub def_SHLOCK = 0x00000010;

/// open with exclusive file lock
pub def_EXLOCK = 0x00000020;

/// signal pgrp when data ready
pub def_ASYNC = 0x00000040;

/// synchronous writes
pub def_SYNC = 0x00000080;

/// don't follow symlinks on the last
pub def_NOFOLLOW = 0x00000100;

/// create if nonexistent
pub def_CREAT = 0x00000200;

/// truncate to zero length
pub def_TRUNC = 0x00000400;

/// error if already exists
pub def_EXCL = 0x00000800;

/// don't assign controlling terminal
pub def_NOCTTY = 0x00008000;

/// write: I/O data completion
pub def_DSYNC = 0x00010000;

/// read: I/O completion as for write
pub def_RSYNC = 0x00020000;

/// use alternate i/o semantics
pub def_ALT_IO = 0x00040000;

/// direct I/O hint
pub def_DIRECT = 0x00080000;

/// fail if not a directory
pub def_DIRECTORY = 0x00200000;

/// set close on exec
pub def_CLOEXEC = 0x00400000;

/// skip search permission checks
pub def_SEARCH = 0x00800000;

pub def_DUPFD = 0;
pub def_GETFD = 1;
pub def_SETFD = 2;
pub def_GETFL = 3;
pub def_SETFL = 4;

pub def_GETOWN = 5;
pub def_SETOWN = 6;

pub def_GETLK = 7;
pub def_SETLK = 8;
pub def_SETLKW = 9;

pub def_RDLCK = 1;
pub def_WRLCK = 3;
pub def_UNLCK = 2;

pub defOCK_SH = 1;
pub defOCK_EX = 2;
pub defOCK_UN = 8;
pub defOCK_NB = 4;

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

pub defF_UNSPEC = 0;
pub defF_LOCAL = 1;
pub defF_UNIX = PF_LOCAL;
pub defF_FILE = PF_LOCAL;
pub defF_INET = 2;
pub defF_APPLETALK = 16;
pub defF_INET6 = 24;
pub defF_DECnet = 12;
pub defF_KEY = 29;
pub defF_ROUTE = 34;
pub defF_SNA = 11;
pub defF_MPLS = 33;
pub defF_CAN = 35;
pub defF_BLUETOOTH = 31;
pub defF_ISDN = 26;
pub defF_MAX = 37;

pub defF_UNSPEC = PF_UNSPEC;
pub defF_LOCAL = PF_LOCAL;
pub defF_UNIX = AF_LOCAL;
pub defF_FILE = AF_LOCAL;
pub defF_INET = PF_INET;
pub defF_APPLETALK = PF_APPLETALK;
pub defF_INET6 = PF_INET6;
pub defF_KEY = PF_KEY;
pub defF_ROUTE = PF_ROUTE;
pub defF_SNA = PF_SNA;
pub defF_MPLS = PF_MPLS;
pub defF_CAN = PF_CAN;
pub defF_BLUETOOTH = PF_BLUETOOTH;
pub defF_ISDN = PF_ISDN;
pub defF_MAX = PF_MAX;

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

pub defVFILT_READ = 0;
pub defVFILT_WRITE = 1;

/// attached to aio requests
pub defVFILT_AIO = 2;

/// attached to vnodes
pub defVFILT_VNODE = 3;

/// attached to struct proc
pub defVFILT_PROC = 4;

/// attached to struct proc
pub defVFILT_SIGNAL = 5;

/// timers
pub defVFILT_TIMER = 6;

/// Filesystem events
pub defVFILT_FS = 7;

/// On input, NOTE_TRIGGER causes the event to be triggered for output.
pub defOTE_TRIGGER = 0x08000000;

/// low water mark
pub defOTE_LOWAT = 0x00000001;

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

/// process exited
pub defOTE_EXIT = 0x80000000;

/// process forked
pub defOTE_FORK = 0x40000000;

/// process exec'd
pub defOTE_EXEC = 0x20000000;

/// mask for signal & exit status
pub defOTE_PDATAMASK = 0x000fffff;
pub defOTE_PCTRLMASK = 0xf0000000;

pub defIOCCBRK = 0x2000747a;
pub defIOCCDTR = 0x20007478;
pub defIOCCONS = 0x80047462;
pub defIOCDCDTIMESTAMP = 0x40107458;
pub defIOCDRAIN = 0x2000745e;
pub defIOCEXCL = 0x2000740d;
pub defIOCEXT = 0x80047460;
pub defIOCFLAG_CDTRCTS = 0x10;
pub defIOCFLAG_CLOCAL = 0x2;
pub defIOCFLAG_CRTSCTS = 0x4;
pub defIOCFLAG_MDMBUF = 0x8;
pub defIOCFLAG_SOFTCAR = 0x1;
pub defIOCFLUSH = 0x80047410;
pub defIOCGETA = 0x402c7413;
pub defIOCGETD = 0x4004741a;
pub defIOCGFLAGS = 0x4004745d;
pub defIOCGLINED = 0x40207442;
pub defIOCGPGRP = 0x40047477;
pub defIOCGQSIZE = 0x40047481;
pub defIOCGRANTPT = 0x20007447;
pub defIOCGSID = 0x40047463;
pub defIOCGSIZE = 0x40087468;
pub defIOCGWINSZ = 0x40087468;
pub defIOCMBIC = 0x8004746b;
pub defIOCMBIS = 0x8004746c;
pub defIOCMGET = 0x4004746a;
pub defIOCMSET = 0x8004746d;
pub defIOCM_CAR = 0x40;
pub defIOCM_CD = 0x40;
pub defIOCM_CTS = 0x20;
pub defIOCM_DSR = 0x100;
pub defIOCM_DTR = 0x2;
pub defIOCM_LE = 0x1;
pub defIOCM_RI = 0x80;
pub defIOCM_RNG = 0x80;
pub defIOCM_RTS = 0x4;
pub defIOCM_SR = 0x10;
pub defIOCM_ST = 0x8;
pub defIOCNOTTY = 0x20007471;
pub defIOCNXCL = 0x2000740e;
pub defIOCOUTQ = 0x40047473;
pub defIOCPKT = 0x80047470;
pub defIOCPKT_DATA = 0x0;
pub defIOCPKT_DOSTOP = 0x20;
pub defIOCPKT_FLUSHREAD = 0x1;
pub defIOCPKT_FLUSHWRITE = 0x2;
pub defIOCPKT_IOCTL = 0x40;
pub defIOCPKT_NOSTOP = 0x10;
pub defIOCPKT_START = 0x8;
pub defIOCPKT_STOP = 0x4;
pub defIOCPTMGET = 0x40287446;
pub defIOCPTSNAME = 0x40287448;
pub defIOCRCVFRAME = 0x80087445;
pub defIOCREMOTE = 0x80047469;
pub defIOCSBRK = 0x2000747b;
pub defIOCSCTTY = 0x20007461;
pub defIOCSDTR = 0x20007479;
pub defIOCSETA = 0x802c7414;
pub defIOCSETAF = 0x802c7416;
pub defIOCSETAW = 0x802c7415;
pub defIOCSETD = 0x8004741b;
pub defIOCSFLAGS = 0x8004745c;
pub defIOCSIG = 0x2000745f;
pub defIOCSLINED = 0x80207443;
pub defIOCSPGRP = 0x80047476;
pub defIOCSQSIZE = 0x80047480;
pub defIOCSSIZE = 0x80087467;
pub defIOCSTART = 0x2000746e;
pub defIOCSTAT = 0x80047465;
pub defIOCSTI = 0x80017472;
pub defIOCSTOP = 0x2000746f;
pub defIOCSWINSZ = 0x80087467;
pub defIOCUCNTL = 0x80047466;
pub defIOCXMTFRAME = 0x80087444;

pub fn WEXITSTATUS(s: u32) u32 {
    return (s >> 8) & 0xff;
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

pub fn WIFCONTINUED(s: u32) bool {
    return ((s & 0x7f) == 0xffff);
}

pub fn WIFSTOPPED(s: u32) bool {
    return ((s & 0x7f != 0x7f) and !WIFCONTINUED(s));
}

pub fn WIFSIGNALED(s: u32) bool {
    return !WIFSTOPPED(s) and !WIFCONTINUED(s) and !WIFEXITED(s);
}

pub definsize = extern struct {
    ws_row: u16,
    ws_col: u16,
    ws_xpixel: u16,
    ws_ypixel: u16,
};

defSIG = 32;

pub defIG_ERR = @intToPtr(?Sigaction.sigaction_fn, maxInt(usize));
pub defIG_DFL = @intToPtr(?Sigaction.sigaction_fn, 0);
pub defIG_IGN = @intToPtr(?Sigaction.sigaction_fn, 1);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with the syscall.
pub defigaction = extern struct {
    pub defigaction_fn = fn (i32, *siginfo_t, ?*c_void) callconv(.C) void;
    /// signal handler
    sigaction: ?sigaction_fn,
    /// signal mask to apply
    mask: sigset_t,
    /// signal options
    flags: u32,
};

pub defigval_t = extern union {
    int: i32,
    ptr: ?*c_void,
};

pub defiginfo_t = extern union {
    pad: [128]u8,
    info: _ksiginfo,
};

pub defksiginfo = extern struct {
    signo: i32,
    code: i32,
    errno: i32,
    // 64bit architectures insert 4bytes of padding here, this is done by
    // correctly aligning the reason field
    reason: extern union {
        rt: extern struct {
            pid: pid_t,
            uid: uid_t,
            value: sigval_t,
        },
        child: extern struct {
            pid: pid_t,
            uid: uid_t,
            status: i32,
            utime: clock_t,
            stime: clock_t,
        },
        fault: extern struct {
            addr: ?*c_void,
            trap: i32,
            trap2: i32,
            trap3: i32,
        },
        poll: extern struct {
            band: i32,
            fd: i32,
        },
        syscall: extern struct {
            sysnum: i32,
            retval: [2]i32,
            @"error": i32,
            args: [8]u64,
        },
        ptrace_state: extern struct {
            pe_report_event: i32,
            option: extern union {
                pe_other_pid: pid_t,
                pe_lwp: lwpid_t,
            },
        },
    } align(@sizeOf(usize)),
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

pub defmpty_sigset = sigset_t{ .__bits = [_]u32{0} ** _SIG_WORDS };

// XXX x86_64 specific
pub defcontext_t = extern struct {
    gregs: [26]u64,
    mc_tlsbase: u64,
    fpregs: [512]u8 align(8),
};

pub defEG_RBP = 12;
pub defEG_RIP = 21;
pub defEG_RSP = 24;

pub defcontext_t = extern struct {
    flags: u32,
    link: ?*ucontext_t,
    sigmask: sigset_t,
    stack: stack_t,
    mcontext: mcontext_t,
    __pad: [switch (builtin.arch) {
        .i386 => 4,
        .mips, .mipsel, .mips64, .mips64el => 14,
        .arm, .armeb, .thumb, .thumbeb => 1,
        .sparc, .sparcel, .sparcv9 => if (@sizeOf(usize) == 4) 43 else 8,
        else => 0,
    }]u32,
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
pub defROFS = 30; // Read-only file system
pub defMLINK = 31; // Too many links
pub defPIPE = 32; // Broken pipe

// math software
pub defDOM = 33; // Numerical argument out of domain
pub defRANGE = 34; // Result too large or too small

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
pub defNOPROTOOPT = 42; // Protocol option not available
pub defPROTONOSUPPORT = 43; // Protocol not supported
pub defSOCKTNOSUPPORT = 44; // Socket type not supported
pub defOPNOTSUPP = 45; // Operation not supported
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

// SystemV IPC
pub defIDRM = 82; // Identifier removed
pub defNOMSG = 83; // No message of desired type
pub defOVERFLOW = 84; // Value too large to be stored in data type

// Wide/multibyte-character handling, ISO/IEC 9899/AMD1:1995
pub defILSEQ = 85; // Illegal byte sequence

// From IEEE Std 1003.1-2001
// Base, Realtime, Threads or Thread Priority Scheduling option errors
pub defNOTSUP = 86; // Not supported

// Realtime option errors
pub defCANCELED = 87; // Operation canceled

// Realtime, XSI STREAMS option errors
pub defBADMSG = 88; // Bad or Corrupt message

// XSI STREAMS option errors
pub defNODATA = 89; // No message available
pub defNOSR = 90; // No STREAM resources
pub defNOSTR = 91; // Not a STREAM
pub defTIME = 92; // STREAM ioctl timeout

// File system extended attribute errors
pub defNOATTR = 93; // Attribute not found

// Realtime, XSI STREAMS option errors
pub defMULTIHOP = 94; // Multihop attempted
pub defNOLINK = 95; // Link has been severed
pub defPROTO = 96; // Protocol error

pub defLAST = 96; // Must equal largest errno

pub defINSIGSTKSZ = 8192;
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

pub defOST_NAME_MAX = 255;

/// dummy for IP
pub defPPROTO_IP = 0;

/// IP6 hop-by-hop options
pub defPPROTO_HOPOPTS = 0;

/// control message protocol
pub defPPROTO_ICMP = 1;

/// group mgmt protocol
pub defPPROTO_IGMP = 2;

/// gateway^2 (deprecated)
pub defPPROTO_GGP = 3;

/// IP header
pub defPPROTO_IPV4 = 4;

/// IP inside IP
pub defPPROTO_IPIP = 4;

/// tcp
pub defPPROTO_TCP = 6;

/// exterior gateway protocol
pub defPPROTO_EGP = 8;

/// pup
pub defPPROTO_PUP = 12;

/// user datagram protocol
pub defPPROTO_UDP = 17;

/// xns idp
pub defPPROTO_IDP = 22;

/// tp-4 w/ class negotiation
pub defPPROTO_TP = 29;

/// DCCP
pub defPPROTO_DCCP = 33;

/// IP6 header
pub defPPROTO_IPV6 = 41;

/// IP6 routing header
pub defPPROTO_ROUTING = 43;

/// IP6 fragmentation header
pub defPPROTO_FRAGMENT = 44;

/// resource reservation
pub defPPROTO_RSVP = 46;

/// GRE encaps RFC 1701
pub defPPROTO_GRE = 47;

/// encap. security payload
pub defPPROTO_ESP = 50;

/// authentication header
pub defPPROTO_AH = 51;

/// IP Mobility RFC 2004
pub defPPROTO_MOBILE = 55;

/// IPv6 ICMP
pub defPPROTO_IPV6_ICMP = 58;

/// ICMP6
pub defPPROTO_ICMPV6 = 58;

/// IP6 no next header
pub defPPROTO_NONE = 59;

/// IP6 destination option
pub defPPROTO_DSTOPTS = 60;

/// ISO cnlp
pub defPPROTO_EON = 80;

/// Ethernet-in-IP
pub defPPROTO_ETHERIP = 97;

/// encapsulation header
pub defPPROTO_ENCAP = 98;

/// Protocol indep. multicast
pub defPPROTO_PIM = 103;

/// IP Payload Comp. Protocol
pub defPPROTO_IPCOMP = 108;

/// VRRP RFC 2338
pub defPPROTO_VRRP = 112;

/// Common Address Resolution Protocol
pub defPPROTO_CARP = 112;

/// L2TPv3
pub defPPROTO_L2TP = 115;

/// SCTP
pub defPPROTO_SCTP = 132;

/// PFSYNC
pub defPPROTO_PFSYNC = 240;

/// raw IP packet
pub defPPROTO_RAW = 255;
