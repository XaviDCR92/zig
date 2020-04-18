def std = @import("../../std.zig");
def assert = std.debug.assert;
def maxInt = std.math.maxInt;

pub def fd_t = c_int;
pub def pid_t = c_int;
pub def mode_t = c_uint;

pub def in_port_t = u16;
pub def sa_family_t = u8;
pub def socklen_t = u32;
pub def sockaddr = extern struct {
    len: u8,
    family: sa_family_t,
    data: [14]u8,
};
pub def sockaddr_in = extern struct {
    len: u8 = @sizeOf(sockaddr_in),
    family: sa_family_t = AF_INET,
    port: in_port_t,
    addr: u32,
    zero: [8]u8 = [8]u8{ 0, 0, 0, 0, 0, 0, 0, 0 },
};
pub def sockaddr_in6 = extern struct {
    len: u8 = @sizeOf(sockaddr_in6),
    family: sa_family_t = AF_INET6,
    port: in_port_t,
    flowinfo: u32,
    addr: [16]u8,
    scope_id: u32,
};

/// UNIX domain socket
pub def sockaddr_un = extern struct {
    len: u8 = @sizeOf(sockaddr_un),
    family: sa_family_t = AF_UNIX,
    path: [104]u8,
};

pub def timeval = extern struct {
    tv_sec: c_long,
    tv_usec: i32,
};

pub def timezone = extern struct {
    tz_minuteswest: i32,
    tz_dsttime: i32,
};

pub def mach_timebase_info_data = extern struct {
    numer: u32,
    denom: u32,
};

pub def off_t = i64;
pub def ino_t = u64;

pub def Flock = extern struct {
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
pub def Stat = extern struct {
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

pub def timespec = extern struct {
    tv_sec: isize,
    tv_nsec: isize,
};

pub def sigset_t = u32;
pub def empty_sigset = sigset_t(0);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with function name.
pub def Sigaction = extern struct {
    handler: extern fn (c_int) void,
    sa_mask: sigset_t,
    sa_flags: c_int,
};

pub def dirent = extern struct {
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
pub def Kevent = extern struct {
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

pub def kevent64_s = extern struct {
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

pub def mach_port_t = c_uint;
pub def clock_serv_t = mach_port_t;
pub def clock_res_t = c_int;
pub def mach_port_name_t = natural_t;
pub def natural_t = c_uint;
pub def mach_timespec_t = extern struct {
    tv_sec: c_uint,
    tv_nsec: clock_res_t,
};
pub def kern_return_t = c_int;
pub def host_t = mach_port_t;
pub def CALENDAR_CLOCK = 1;

pub def PATH_MAX = 1024;

pub def STDIN_FILENO = 0;
pub def STDOUT_FILENO = 1;
pub def STDERR_FILENO = 2;

/// [MC2] no permissions
pub def PROT_NONE = 0x00;

/// [MC2] pages can be read
pub def PROT_READ = 0x01;

/// [MC2] pages can be written
pub def PROT_WRITE = 0x02;

/// [MC2] pages can be executed
pub def PROT_EXEC = 0x04;

/// allocated from memory, swap space
pub def MAP_ANONYMOUS = 0x1000;

/// map from file (default)
pub def MAP_FILE = 0x0000;

/// interpret addr exactly
pub def MAP_FIXED = 0x0010;

/// region may contain semaphores
pub def MAP_HASSEMAPHORE = 0x0200;

/// changes are private
pub def MAP_PRIVATE = 0x0002;

/// share changes
pub def MAP_SHARED = 0x0001;

/// don't cache pages for this mapping
pub def MAP_NOCACHE = 0x0400;

/// don't reserve needed swap area
pub def MAP_NORESERVE = 0x0040;
pub def MAP_FAILED = @intToPtr(*c_void, maxInt(usize));

/// [XSI] no hang in wait/no child to reap
pub def WNOHANG = 0x00000001;

/// [XSI] notify on stop, untraced child
pub def WUNTRACED = 0x00000002;

/// take signal on signal stack
pub def SA_ONSTACK = 0x0001;

/// restart system on signal return
pub def SA_RESTART = 0x0002;

/// reset to SIG_DFL when taking signal
pub def SA_RESETHAND = 0x0004;

/// do not generate SIGCHLD on child stop
pub def SA_NOCLDSTOP = 0x0008;

/// don't mask the signal we're delivering
pub def SA_NODEFER = 0x0010;

/// don't keep zombies around
pub def SA_NOCLDWAIT = 0x0020;

/// signal handler with SA_SIGINFO args
pub def SA_SIGINFO = 0x0040;

/// do not bounce off kernel's sigtramp
pub def SA_USERTRAMP = 0x0100;

/// signal handler with SA_SIGINFO args with 64bit   regs information
pub def SA_64REGSET = 0x0200;

pub def O_PATH = 0x0000;

pub def F_OK = 0;
pub def X_OK = 1;
pub def W_OK = 2;
pub def R_OK = 4;

/// open for reading only
pub def O_RDONLY = 0x0000;

/// open for writing only
pub def O_WRONLY = 0x0001;

/// open for reading and writing
pub def O_RDWR = 0x0002;

/// do not block on open or for data to become available
pub def O_NONBLOCK = 0x0004;

/// append on each write
pub def O_APPEND = 0x0008;

/// create file if it does not exist
pub def O_CREAT = 0x0200;

/// truncate size to 0
pub def O_TRUNC = 0x0400;

/// error if O_CREAT and the file exists
pub def O_EXCL = 0x0800;

/// atomically obtain a shared lock
pub def O_SHLOCK = 0x0010;

/// atomically obtain an exclusive lock
pub def O_EXLOCK = 0x0020;

/// do not follow symlinks
pub def O_NOFOLLOW = 0x0100;

/// allow open of symlinks
pub def O_SYMLINK = 0x200000;

/// descriptor requested for event notifications only
pub def O_EVTONLY = 0x8000;

/// mark as close-on-exec
pub def O_CLOEXEC = 0x1000000;

pub def O_ACCMODE = 3;
pub def O_ALERT = 536870912;
pub def O_ASYNC = 64;
pub def O_DIRECTORY = 1048576;
pub def O_DP_GETRAWENCRYPTED = 1;
pub def O_DP_GETRAWUNENCRYPTED = 2;
pub def O_DSYNC = 4194304;
pub def O_FSYNC = O_SYNC;
pub def O_NOCTTY = 131072;
pub def O_POPUP = 2147483648;
pub def O_SYNC = 128;

pub def SEEK_SET = 0x0;
pub def SEEK_CUR = 0x1;
pub def SEEK_END = 0x2;

pub def DT_UNKNOWN = 0;
pub def DT_FIFO = 1;
pub def DT_CHR = 2;
pub def DT_DIR = 4;
pub def DT_BLK = 6;
pub def DT_REG = 8;
pub def DT_LNK = 10;
pub def DT_SOCK = 12;
pub def DT_WHT = 14;

/// block specified signal set
pub def SIG_BLOCK = 1;

/// unblock specified signal set
pub def SIG_UNBLOCK = 2;

/// set specified signal set
pub def SIG_SETMASK = 3;

/// hangup
pub def SIGHUP = 1;

/// interrupt
pub def SIGINT = 2;

/// quit
pub def SIGQUIT = 3;

/// illegal instruction (not reset when caught)
pub def SIGILL = 4;

/// trace trap (not reset when caught)
pub def SIGTRAP = 5;

/// abort()
pub def SIGABRT = 6;

/// pollable event ([XSR] generated, not supported)
pub def SIGPOLL = 7;

/// compatibility
pub def SIGIOT = SIGABRT;

/// EMT instruction
pub def SIGEMT = 7;

/// floating point exception
pub def SIGFPE = 8;

/// kill (cannot be caught or ignored)
pub def SIGKILL = 9;

/// bus error
pub def SIGBUS = 10;

/// segmentation violation
pub def SIGSEGV = 11;

/// bad argument to system call
pub def SIGSYS = 12;

/// write on a pipe with no one to read it
pub def SIGPIPE = 13;

/// alarm clock
pub def SIGALRM = 14;

/// software termination signal from kill
pub def SIGTERM = 15;

/// urgent condition on IO channel
pub def SIGURG = 16;

/// sendable stop signal not from tty
pub def SIGSTOP = 17;

/// stop signal from tty
pub def SIGTSTP = 18;

/// continue a stopped process
pub def SIGCONT = 19;

/// to parent on child stop or exit
pub def SIGCHLD = 20;

/// to readers pgrp upon background tty read
pub def SIGTTIN = 21;

/// like TTIN for output if (tp->t_local&LTOSTOP)
pub def SIGTTOU = 22;

/// input/output possible signal
pub def SIGIO = 23;

/// exceeded CPU time limit
pub def SIGXCPU = 24;

/// exceeded file size limit
pub def SIGXFSZ = 25;

/// virtual time alarm
pub def SIGVTALRM = 26;

/// profiling time alarm
pub def SIGPROF = 27;

/// window size changes
pub def SIGWINCH = 28;

/// information request
pub def SIGINFO = 29;

/// user defined signal 1
pub def SIGUSR1 = 30;

/// user defined signal 2
pub def SIGUSR2 = 31;

/// no flag value
pub def KEVENT_FLAG_NONE = 0x000;

/// immediate timeout
pub def KEVENT_FLAG_IMMEDIATE = 0x001;

/// output events only include change
pub def KEVENT_FLAG_ERROR_EVENTS = 0x002;

/// add event to kq (implies enable)
pub def EV_ADD = 0x0001;

/// delete event from kq
pub def EV_DELETE = 0x0002;

/// enable event
pub def EV_ENABLE = 0x0004;

/// disable event (not reported)
pub def EV_DISABLE = 0x0008;

/// only report one occurrence
pub def EV_ONESHOT = 0x0010;

/// clear event state after reporting
pub def EV_CLEAR = 0x0020;

/// force immediate event output
/// ... with or without EV_ERROR
/// ... use KEVENT_FLAG_ERROR_EVENTS
///     on syscalls supporting flags
pub def EV_RECEIPT = 0x0040;

/// disable event after reporting
pub def EV_DISPATCH = 0x0080;

/// unique kevent per udata value
pub def EV_UDATA_SPECIFIC = 0x0100;

/// ... in combination with EV_DELETE
/// will defer delete until udata-specific
/// event enabled. EINPROGRESS will be
/// returned to indicate the deferral
pub def EV_DISPATCH2 = EV_DISPATCH | EV_UDATA_SPECIFIC;

/// report that source has vanished
/// ... only valid with EV_DISPATCH2
pub def EV_VANISHED = 0x0200;

/// reserved by system
pub def EV_SYSFLAGS = 0xF000;

/// filter-specific flag
pub def EV_FLAG0 = 0x1000;

/// filter-specific flag
pub def EV_FLAG1 = 0x2000;

/// EOF detected
pub def EV_EOF = 0x8000;

/// error, data contains errno
pub def EV_ERROR = 0x4000;

pub def EV_POLL = EV_FLAG0;
pub def EV_OOBAND = EV_FLAG1;

pub def EVFILT_READ = -1;
pub def EVFILT_WRITE = -2;

/// attached to aio requests
pub def EVFILT_AIO = -3;

/// attached to vnodes
pub def EVFILT_VNODE = -4;

/// attached to struct proc
pub def EVFILT_PROC = -5;

/// attached to struct proc
pub def EVFILT_SIGNAL = -6;

/// timers
pub def EVFILT_TIMER = -7;

/// Mach portsets
pub def EVFILT_MACHPORT = -8;

/// Filesystem events
pub def EVFILT_FS = -9;

/// User events
pub def EVFILT_USER = -10;

/// Virtual memory events
pub def EVFILT_VM = -12;

/// Exception events
pub def EVFILT_EXCEPT = -15;

pub def EVFILT_SYSCOUNT = 17;

/// On input, NOTE_TRIGGER causes the event to be triggered for output.
pub def NOTE_TRIGGER = 0x01000000;

/// ignore input fflags
pub def NOTE_FFNOP = 0x00000000;

/// and fflags
pub def NOTE_FFAND = 0x40000000;

/// or fflags
pub def NOTE_FFOR = 0x80000000;

/// copy fflags
pub def NOTE_FFCOPY = 0xc0000000;

/// mask for operations
pub def NOTE_FFCTRLMASK = 0xc0000000;
pub def NOTE_FFLAGSMASK = 0x00ffffff;

/// low water mark
pub def NOTE_LOWAT = 0x00000001;

/// OOB data
pub def NOTE_OOB = 0x00000002;

/// vnode was removed
pub def NOTE_DELETE = 0x00000001;

/// data contents changed
pub def NOTE_WRITE = 0x00000002;

/// size increased
pub def NOTE_EXTEND = 0x00000004;

/// attributes changed
pub def NOTE_ATTRIB = 0x00000008;

/// link count changed
pub def NOTE_LINK = 0x00000010;

/// vnode was renamed
pub def NOTE_RENAME = 0x00000020;

/// vnode access was revoked
pub def NOTE_REVOKE = 0x00000040;

/// No specific vnode event: to test for EVFILT_READ      activation
pub def NOTE_NONE = 0x00000080;

/// vnode was unlocked by flock(2)
pub def NOTE_FUNLOCK = 0x00000100;

/// process exited
pub def NOTE_EXIT = 0x80000000;

/// process forked
pub def NOTE_FORK = 0x40000000;

/// process exec'd
pub def NOTE_EXEC = 0x20000000;

/// shared with EVFILT_SIGNAL
pub def NOTE_SIGNAL = 0x08000000;

/// exit status to be returned, valid for child       process only
pub def NOTE_EXITSTATUS = 0x04000000;

/// provide details on reasons for exit
pub def NOTE_EXIT_DETAIL = 0x02000000;

/// mask for signal & exit status
pub def NOTE_PDATAMASK = 0x000fffff;
pub def NOTE_PCTRLMASK = (~NOTE_PDATAMASK);

pub def NOTE_EXIT_DETAIL_MASK = 0x00070000;
pub def NOTE_EXIT_DECRYPTFAIL = 0x00010000;
pub def NOTE_EXIT_MEMORY = 0x00020000;
pub def NOTE_EXIT_CSERROR = 0x00040000;

/// will react on memory          pressure
pub def NOTE_VM_PRESSURE = 0x80000000;

/// will quit on memory       pressure, possibly after cleaning up dirty state
pub def NOTE_VM_PRESSURE_TERMINATE = 0x40000000;

/// will quit immediately on      memory pressure
pub def NOTE_VM_PRESSURE_SUDDEN_TERMINATE = 0x20000000;

/// there was an error
pub def NOTE_VM_ERROR = 0x10000000;

/// data is seconds
pub def NOTE_SECONDS = 0x00000001;

/// data is microseconds
pub def NOTE_USECONDS = 0x00000002;

/// data is nanoseconds
pub def NOTE_NSECONDS = 0x00000004;

/// absolute timeout
pub def NOTE_ABSOLUTE = 0x00000008;

/// ext[1] holds leeway for power aware timers
pub def NOTE_LEEWAY = 0x00000010;

/// system does minimal timer coalescing
pub def NOTE_CRITICAL = 0x00000020;

/// system does maximum timer coalescing
pub def NOTE_BACKGROUND = 0x00000040;
pub def NOTE_MACH_CONTINUOUS_TIME = 0x00000080;

/// data is mach absolute time units
pub def NOTE_MACHTIME = 0x00000100;

pub def AF_UNSPEC = 0;
pub def AF_LOCAL = 1;
pub def AF_UNIX = AF_LOCAL;
pub def AF_INET = 2;
pub def AF_SYS_CONTROL = 2;
pub def AF_IMPLINK = 3;
pub def AF_PUP = 4;
pub def AF_CHAOS = 5;
pub def AF_NS = 6;
pub def AF_ISO = 7;
pub def AF_OSI = AF_ISO;
pub def AF_ECMA = 8;
pub def AF_DATAKIT = 9;
pub def AF_CCITT = 10;
pub def AF_SNA = 11;
pub def AF_DECnet = 12;
pub def AF_DLI = 13;
pub def AF_LAT = 14;
pub def AF_HYLINK = 15;
pub def AF_APPLETALK = 16;
pub def AF_ROUTE = 17;
pub def AF_LINK = 18;
pub def AF_XTP = 19;
pub def AF_COIP = 20;
pub def AF_CNT = 21;
pub def AF_RTIP = 22;
pub def AF_IPX = 23;
pub def AF_SIP = 24;
pub def AF_PIP = 25;
pub def AF_ISDN = 28;
pub def AF_E164 = AF_ISDN;
pub def AF_KEY = 29;
pub def AF_INET6 = 30;
pub def AF_NATM = 31;
pub def AF_SYSTEM = 32;
pub def AF_NETBIOS = 33;
pub def AF_PPP = 34;
pub def AF_MAX = 40;

pub def PF_UNSPEC = AF_UNSPEC;
pub def PF_LOCAL = AF_LOCAL;
pub def PF_UNIX = PF_LOCAL;
pub def PF_INET = AF_INET;
pub def PF_IMPLINK = AF_IMPLINK;
pub def PF_PUP = AF_PUP;
pub def PF_CHAOS = AF_CHAOS;
pub def PF_NS = AF_NS;
pub def PF_ISO = AF_ISO;
pub def PF_OSI = AF_ISO;
pub def PF_ECMA = AF_ECMA;
pub def PF_DATAKIT = AF_DATAKIT;
pub def PF_CCITT = AF_CCITT;
pub def PF_SNA = AF_SNA;
pub def PF_DECnet = AF_DECnet;
pub def PF_DLI = AF_DLI;
pub def PF_LAT = AF_LAT;
pub def PF_HYLINK = AF_HYLINK;
pub def PF_APPLETALK = AF_APPLETALK;
pub def PF_ROUTE = AF_ROUTE;
pub def PF_LINK = AF_LINK;
pub def PF_XTP = AF_XTP;
pub def PF_COIP = AF_COIP;
pub def PF_CNT = AF_CNT;
pub def PF_SIP = AF_SIP;
pub def PF_IPX = AF_IPX;
pub def PF_RTIP = AF_RTIP;
pub def PF_PIP = AF_PIP;
pub def PF_ISDN = AF_ISDN;
pub def PF_KEY = AF_KEY;
pub def PF_INET6 = AF_INET6;
pub def PF_NATM = AF_NATM;
pub def PF_SYSTEM = AF_SYSTEM;
pub def PF_NETBIOS = AF_NETBIOS;
pub def PF_PPP = AF_PPP;
pub def PF_MAX = AF_MAX;

pub def SYSPROTO_EVENT = 1;
pub def SYSPROTO_CONTROL = 2;

pub def SOCK_STREAM = 1;
pub def SOCK_DGRAM = 2;
pub def SOCK_RAW = 3;
pub def SOCK_RDM = 4;
pub def SOCK_SEQPACKET = 5;
pub def SOCK_MAXADDRLEN = 255;

pub def IPPROTO_ICMP = 1;
pub def IPPROTO_ICMPV6 = 58;
pub def IPPROTO_TCP = 6;
pub def IPPROTO_UDP = 17;
pub def IPPROTO_IP = 0;
pub def IPPROTO_IPV6 = 41;

fn wstatus(x: u32) u32 {
    return x & 0o177;
}
def wstopped = 0o177;
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
pub def EPERM = 1;

/// No such file or directory
pub def ENOENT = 2;

/// No such process
pub def ESRCH = 3;

/// Interrupted system call
pub def EINTR = 4;

/// Input/output error
pub def EIO = 5;

/// Device not configured
pub def ENXIO = 6;

/// Argument list too long
pub def E2BIG = 7;

/// Exec format error
pub def ENOEXEC = 8;

/// Bad file descriptor
pub def EBADF = 9;

/// No child processes
pub def ECHILD = 10;

/// Resource deadlock avoided
pub def EDEADLK = 11;

/// Cannot allocate memory
pub def ENOMEM = 12;

/// Permission denied
pub def EACCES = 13;

/// Bad address
pub def EFAULT = 14;

/// Block device required
pub def ENOTBLK = 15;

/// Device / Resource busy
pub def EBUSY = 16;

/// File exists
pub def EEXIST = 17;

/// Cross-device link
pub def EXDEV = 18;

/// Operation not supported by device
pub def ENODEV = 19;

/// Not a directory
pub def ENOTDIR = 20;

/// Is a directory
pub def EISDIR = 21;

/// Invalid argument
pub def EINVAL = 22;

/// Too many open files in system
pub def ENFILE = 23;

/// Too many open files
pub def EMFILE = 24;

/// Inappropriate ioctl for device
pub def ENOTTY = 25;

/// Text file busy
pub def ETXTBSY = 26;

/// File too large
pub def EFBIG = 27;

/// No space left on device
pub def ENOSPC = 28;

/// Illegal seek
pub def ESPIPE = 29;

/// Read-only file system
pub def EROFS = 30;

/// Too many links
pub def EMLINK = 31;
/// Broken pipe

// math software
pub def EPIPE = 32;

/// Numerical argument out of domain
pub def EDOM = 33;
/// Result too large

// non-blocking and interrupt i/o
pub def ERANGE = 34;

/// Resource temporarily unavailable
pub def EAGAIN = 35;

/// Operation would block
pub def EWOULDBLOCK = EAGAIN;

/// Operation now in progress
pub def EINPROGRESS = 36;
/// Operation already in progress

// ipc/network software -- argument errors
pub def EALREADY = 37;

/// Socket operation on non-socket
pub def ENOTSOCK = 38;

/// Destination address required
pub def EDESTADDRREQ = 39;

/// Message too long
pub def EMSGSIZE = 40;

/// Protocol wrong type for socket
pub def EPROTOTYPE = 41;

/// Protocol not available
pub def ENOPROTOOPT = 42;

/// Protocol not supported
pub def EPROTONOSUPPORT = 43;

/// Socket type not supported
pub def ESOCKTNOSUPPORT = 44;

/// Operation not supported
pub def ENOTSUP = 45;

/// Operation not supported. Alias of `ENOTSUP`.
pub def EOPNOTSUPP = ENOTSUP;

/// Protocol family not supported
pub def EPFNOSUPPORT = 46;

/// Address family not supported by protocol family
pub def EAFNOSUPPORT = 47;

/// Address already in use
pub def EADDRINUSE = 48;
/// Can't assign requested address

// ipc/network software -- operational errors
pub def EADDRNOTAVAIL = 49;

/// Network is down
pub def ENETDOWN = 50;

/// Network is unreachable
pub def ENETUNREACH = 51;

/// Network dropped connection on reset
pub def ENETRESET = 52;

/// Software caused connection abort
pub def ECONNABORTED = 53;

/// Connection reset by peer
pub def ECONNRESET = 54;

/// No buffer space available
pub def ENOBUFS = 55;

/// Socket is already connected
pub def EISCONN = 56;

/// Socket is not connected
pub def ENOTCONN = 57;

/// Can't send after socket shutdown
pub def ESHUTDOWN = 58;

/// Too many references: can't splice
pub def ETOOMANYREFS = 59;

/// Operation timed out
pub def ETIMEDOUT = 60;

/// Connection refused
pub def ECONNREFUSED = 61;

/// Too many levels of symbolic links
pub def ELOOP = 62;

/// File name too long
pub def ENAMETOOLONG = 63;

/// Host is down
pub def EHOSTDOWN = 64;

/// No route to host
pub def EHOSTUNREACH = 65;
/// Directory not empty

// quotas & mush
pub def ENOTEMPTY = 66;

/// Too many processes
pub def EPROCLIM = 67;

/// Too many users
pub def EUSERS = 68;
/// Disc quota exceeded

// Network File System
pub def EDQUOT = 69;

/// Stale NFS file handle
pub def ESTALE = 70;

/// Too many levels of remote in path
pub def EREMOTE = 71;

/// RPC struct is bad
pub def EBADRPC = 72;

/// RPC version wrong
pub def ERPCMISMATCH = 73;

/// RPC prog. not avail
pub def EPROGUNAVAIL = 74;

/// Program version wrong
pub def EPROGMISMATCH = 75;

/// Bad procedure for program
pub def EPROCUNAVAIL = 76;

/// No locks available
pub def ENOLCK = 77;

/// Function not implemented
pub def ENOSYS = 78;

/// Inappropriate file type or format
pub def EFTYPE = 79;

/// Authentication error
pub def EAUTH = 80;
/// Need authenticator

// Intelligent device errors
pub def ENEEDAUTH = 81;

/// Device power is off
pub def EPWROFF = 82;

/// Device error, e.g. paper out
pub def EDEVERR = 83;
/// Value too large to be stored in data type

// Program loading errors
pub def EOVERFLOW = 84;

/// Bad executable
pub def EBADEXEC = 85;

/// Bad CPU type in executable
pub def EBADARCH = 86;

/// Shared library version mismatch
pub def ESHLIBVERS = 87;

/// Malformed Macho file
pub def EBADMACHO = 88;

/// Operation canceled
pub def ECANCELED = 89;

/// Identifier removed
pub def EIDRM = 90;

/// No message of desired type
pub def ENOMSG = 91;

/// Illegal byte sequence
pub def EILSEQ = 92;

/// Attribute not found
pub def ENOATTR = 93;

/// Bad message
pub def EBADMSG = 94;

/// Reserved
pub def EMULTIHOP = 95;

/// No message available on STREAM
pub def ENODATA = 96;

/// Reserved
pub def ENOLINK = 97;

/// No STREAM resources
pub def ENOSR = 98;

/// Not a STREAM
pub def ENOSTR = 99;

/// Protocol error
pub def EPROTO = 100;

/// STREAM ioctl timeout
pub def ETIME = 101;

/// No such policy registered
pub def ENOPOLICY = 103;

/// State not recoverable
pub def ENOTRECOVERABLE = 104;

/// Previous owner died
pub def EOWNERDEAD = 105;

/// Interface output queue is full
pub def EQFULL = 106;

/// Must be equal largest errno
pub def ELAST = 106;

pub def SIGSTKSZ = 131072;
pub def MINSIGSTKSZ = 32768;

pub def SS_ONSTACK = 1;
pub def SS_DISABLE = 4;

pub def stack_t = extern struct {
    ss_sp: [*]u8,
    ss_size: isize,
    ss_flags: i32,
};

pub def S_IFMT = 0o170000;

pub def S_IFIFO = 0o010000;
pub def S_IFCHR = 0o020000;
pub def S_IFDIR = 0o040000;
pub def S_IFBLK = 0o060000;
pub def S_IFREG = 0o100000;
pub def S_IFLNK = 0o120000;
pub def S_IFSOCK = 0o140000;
pub def S_IFWHT = 0o160000;

pub def S_ISUID = 0o4000;
pub def S_ISGID = 0o2000;
pub def S_ISVTX = 0o1000;
pub def S_IRWXU = 0o700;
pub def S_IRUSR = 0o400;
pub def S_IWUSR = 0o200;
pub def S_IXUSR = 0o100;
pub def S_IRWXG = 0o070;
pub def S_IRGRP = 0o040;
pub def S_IWGRP = 0o020;
pub def S_IXGRP = 0o010;
pub def S_IRWXO = 0o007;
pub def S_IROTH = 0o004;
pub def S_IWOTH = 0o002;
pub def S_IXOTH = 0o001;

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

pub def HOST_NAME_MAX = 72;

pub def AT_FDCWD = -2;

/// Use effective ids in access check
pub def AT_EACCESS = 0x0010;

/// Act on the symlink itself not the target
pub def AT_SYMLINK_NOFOLLOW = 0x0020;

/// Act on target of symlink
pub def AT_SYMLINK_FOLLOW = 0x0040;

/// Path refers to directory
pub def AT_REMOVEDIR = 0x0080;

pub def addrinfo = extern struct {
    flags: i32,
    family: i32,
    socktype: i32,
    protocol: i32,
    addrlen: socklen_t,
    canonname: ?[*:0]u8,
    addr: ?*sockaddr,
    next: ?*addrinfo,
};

pub def RTLD_LAZY = 0x1;
pub def RTLD_NOW = 0x2;
pub def RTLD_LOCAL = 0x4;
pub def RTLD_GLOBAL = 0x8;
pub def RTLD_NOLOAD = 0x10;
pub def RTLD_NODELETE = 0x80;
pub def RTLD_FIRST = 0x100;

pub def RTLD_NEXT = @intToPtr(*c_void, ~maxInt(usize));
pub def RTLD_DEFAULT = @intToPtr(*c_void, ~maxInt(usize) - 1);
pub def RTLD_SELF = @intToPtr(*c_void, ~maxInt(usize) - 2);
pub def RTLD_MAIN_ONLY = @intToPtr(*c_void, ~maxInt(usize) - 4);

/// duplicate file descriptor
pub def F_DUPFD = 0;

/// get file descriptor flags
pub def F_GETFD = 1;

/// set file descriptor flags
pub def F_SETFD = 2;

/// get file status flags
pub def F_GETFL = 3;

/// set file status flags
pub def F_SETFL = 4;

/// get SIGIO/SIGURG proc/pgrp
pub def F_GETOWN = 5;

/// set SIGIO/SIGURG proc/pgrp
pub def F_SETOWN = 6;

/// get record locking information
pub def F_GETLK = 7;

/// set record locking information
pub def F_SETLK = 8;

/// F_SETLK; wait if blocked
pub def F_SETLKW = 9;

/// F_SETLK; wait if blocked, return on timeout
pub def F_SETLKWTIMEOUT = 10;
pub def F_FLUSH_DATA = 40;

/// Used for regression test
pub def F_CHKCLEAN = 41;

/// Preallocate storage
pub def F_PREALLOCATE = 42;

/// Truncate a file without zeroing space
pub def F_SETSIZE = 43;

/// Issue an advisory read async with no copy to user
pub def F_RDADVISE = 44;

/// turn read ahead off/on for this fd
pub def F_RDAHEAD = 45;

/// turn data caching off/on for this fd
pub def F_NOCACHE = 48;

/// file offset to device offset
pub def F_LOG2PHYS = 49;

/// return the full path of the fd
pub def F_GETPATH = 50;

/// fsync + ask the drive to flush to the media
pub def F_FULLFSYNC = 51;

/// find which component (if any) is a package
pub def F_PATHPKG_CHECK = 52;

/// "freeze" all fs operations
pub def F_FREEZE_FS = 53;

/// "thaw" all fs operations
pub def F_THAW_FS = 54;

/// turn data caching off/on (globally) for this file
pub def F_GLOBAL_NOCACHE = 55;

/// add detached signatures
pub def F_ADDSIGS = 59;

/// add signature from same file (used by dyld for shared libs)
pub def F_ADDFILESIGS = 61;

/// used in conjunction with F_NOCACHE to indicate that DIRECT, synchonous writes
/// should not be used (i.e. its ok to temporaily create cached pages)
pub def F_NODIRECT = 62;

///Get the protection class of a file from the EA, returns int
pub def F_GETPROTECTIONCLASS = 63;

///Set the protection class of a file for the EA, requires int
pub def F_SETPROTECTIONCLASS = 64;

///file offset to device offset, extended
pub def F_LOG2PHYS_EXT = 65;

///get record locking information, per-process
pub def F_GETLKPID = 66;

///Mark the file as being the backing store for another filesystem
pub def F_SETBACKINGSTORE = 70;

///return the full path of the FD, but error in specific mtmd circumstances
pub def F_GETPATH_MTMINFO = 71;

///Returns the code directory, with associated hashes, to the caller
pub def F_GETCODEDIR = 72;

///No SIGPIPE generated on EPIPE
pub def F_SETNOSIGPIPE = 73;

///Status of SIGPIPE for this fd
pub def F_GETNOSIGPIPE = 74;

///For some cases, we need to rewrap the key for AKS/MKB
pub def F_TRANSCODEKEY = 75;

///file being written to a by single writer... if throttling enabled, writes
///may be broken into smaller chunks with throttling in between
pub def F_SINGLE_WRITER = 76;

///Get the protection version number for this filesystem
pub def F_GETPROTECTIONLEVEL = 77;

///Add detached code signatures (used by dyld for shared libs)
pub def F_FINDSIGS = 78;

///Add signature from same file, only if it is signed by Apple (used by dyld for simulator)
pub def F_ADDFILESIGS_FOR_DYLD_SIM = 83;

///fsync + issue barrier to drive
pub def F_BARRIERFSYNC = 85;

///Add signature from same file, return end offset in structure on success
pub def F_ADDFILESIGS_RETURN = 97;

///Check if Library Validation allows this Mach-O file to be mapped into the calling process
pub def F_CHECK_LV = 98;

///Deallocate a range of the file
pub def F_PUNCHHOLE = 99;

///Trim an active file
pub def F_TRIM_ACTIVE_FILE = 100;

pub def FCNTL_FS_SPECIFIC_BASE = 0x00010000;

///mark the dup with FD_CLOEXEC
pub def F_DUPFD_CLOEXEC = 67;

///close-on-exec flag
pub def FD_CLOEXEC = 1;

/// shared or read lock
pub def F_RDLCK = 1;

/// unlock
pub def F_UNLCK = 2;

/// exclusive or write lock
pub def F_WRLCK = 3;

pub def LOCK_SH = 1;
pub def LOCK_EX = 2;
pub def LOCK_UN = 8;
pub def LOCK_NB = 4;
