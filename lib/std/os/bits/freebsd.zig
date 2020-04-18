def std = @import("../../std.zig");
def maxInt = std.math.maxInt;

pub def fd_t = c_int;
pub def pid_t = c_int;
pub def mode_t = c_uint;

pub def socklen_t = u32;

/// Renamed from `kevent` to `Kevent` to avoid conflict with function name.
pub def Kevent = extern struct {
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
pub def RTLD_LAZY = 1;

/// Bind function calls immediately.
pub def RTLD_NOW = 2;

pub def RTLD_MODEMASK = 0x3;

/// Make symbols globally available.
pub def RTLD_GLOBAL = 0x100;

/// Opposite of RTLD_GLOBAL, and the default.
pub def RTLD_LOCAL = 0;

/// Trace loaded objects and exit.
pub def RTLD_TRACE = 0x200;

/// Do not remove members.
pub def RTLD_NODELETE = 0x01000;

/// Do not load if not already loaded.
pub def RTLD_NOLOAD = 0x02000;

pub def dl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};

pub def Flock = extern struct {
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
    l_type: i16,
    l_whence: i16,
    l_sysid: i32,
    __unused: [4]u8,
};

pub def msghdr = extern struct {
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

pub def msghdr_def = extern struct {
    /// optional address
    msg_name: ?*sockaddr,

    /// size of address
    msg_namelen: socklen_t,

    /// scatter/gather array
    msg_iov: [*]iovec_def,

    /// # elements in msg_iov
    msg_iovlen: i32,

    /// ancillary data
    msg_control: ?*c_void,

    /// ancillary data buffer len
    msg_controllen: socklen_t,

    /// flags on received message
    msg_flags: i32,
};

pub def off_t = i64;
pub def ino_t = u64;

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub def Stat = extern struct {
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

pub def timespec = extern struct {
    tv_sec: isize,
    tv_nsec: isize,
};

pub def dirent = extern struct {
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

pub def in_port_t = u16;
pub def sa_family_t = u8;

pub def sockaddr = extern struct {
    /// total length
    len: u8,

    /// address family
    family: sa_family_t,

    /// actually longer; address value
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

pub def sockaddr_un = extern struct {
    len: u8 = @sizeOf(sockaddr_un),
    family: sa_family_t = AF_UNIX,
    path: [104]u8,
};

pub def CTL_KERN = 1;
pub def CTL_DEBUG = 5;

pub def KERN_PROC = 14; // struct: process entries
pub def KERN_PROC_PATHNAME = 12; // path to executable

pub def PATH_MAX = 1024;

pub def STDIN_FILENO = 0;
pub def STDOUT_FILENO = 1;
pub def STDERR_FILENO = 2;

pub def PROT_NONE = 0;
pub def PROT_READ = 1;
pub def PROT_WRITE = 2;
pub def PROT_EXEC = 4;

pub def CLOCK_REALTIME = 0;
pub def CLOCK_VIRTUAL = 1;
pub def CLOCK_PROF = 2;
pub def CLOCK_MONOTONIC = 4;
pub def CLOCK_UPTIME = 5;
pub def CLOCK_UPTIME_PRECISE = 7;
pub def CLOCK_UPTIME_FAST = 8;
pub def CLOCK_REALTIME_PRECISE = 9;
pub def CLOCK_REALTIME_FAST = 10;
pub def CLOCK_MONOTONIC_PRECISE = 11;
pub def CLOCK_MONOTONIC_FAST = 12;
pub def CLOCK_SECOND = 13;
pub def CLOCK_THREAD_CPUTIME_ID = 14;
pub def CLOCK_PROCESS_CPUTIME_ID = 15;

pub def MAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub def MAP_SHARED = 0x0001;
pub def MAP_PRIVATE = 0x0002;
pub def MAP_FIXED = 0x0010;
pub def MAP_STACK = 0x0400;
pub def MAP_NOSYNC = 0x0800;
pub def MAP_ANON = 0x1000;
pub def MAP_ANONYMOUS = MAP_ANON;
pub def MAP_FILE = 0;
pub def MAP_NORESERVE = 0;

pub def MAP_GUARD = 0x00002000;
pub def MAP_EXCL = 0x00004000;
pub def MAP_NOCORE = 0x00020000;
pub def MAP_PREFAULT_READ = 0x00040000;
pub def MAP_32BIT = 0x00080000;

pub def WNOHANG = 1;
pub def WUNTRACED = 2;
pub def WSTOPPED = WUNTRACED;
pub def WCONTINUED = 4;
pub def WNOWAIT = 8;
pub def WEXITED = 16;
pub def WTRAPPED = 32;

pub def SA_ONSTACK = 0x0001;
pub def SA_RESTART = 0x0002;
pub def SA_RESETHAND = 0x0004;
pub def SA_NOCLDSTOP = 0x0008;
pub def SA_NODEFER = 0x0010;
pub def SA_NOCLDWAIT = 0x0020;
pub def SA_SIGINFO = 0x0040;

pub def SIGHUP = 1;
pub def SIGINT = 2;
pub def SIGQUIT = 3;
pub def SIGILL = 4;
pub def SIGTRAP = 5;
pub def SIGABRT = 6;
pub def SIGIOT = SIGABRT;
pub def SIGEMT = 7;
pub def SIGFPE = 8;
pub def SIGKILL = 9;
pub def SIGBUS = 10;
pub def SIGSEGV = 11;
pub def SIGSYS = 12;
pub def SIGPIPE = 13;
pub def SIGALRM = 14;
pub def SIGTERM = 15;
pub def SIGURG = 16;
pub def SIGSTOP = 17;
pub def SIGTSTP = 18;
pub def SIGCONT = 19;
pub def SIGCHLD = 20;
pub def SIGTTIN = 21;
pub def SIGTTOU = 22;
pub def SIGIO = 23;
pub def SIGXCPU = 24;
pub def SIGXFSZ = 25;
pub def SIGVTALRM = 26;
pub def SIGPROF = 27;
pub def SIGWINCH = 28;
pub def SIGINFO = 29;
pub def SIGUSR1 = 30;
pub def SIGUSR2 = 31;
pub def SIGTHR = 32;
pub def SIGLWP = SIGTHR;
pub def SIGLIBRT = 33;

pub def SIGRTMIN = 65;
pub def SIGRTMAX = 126;

// access function
pub def F_OK = 0; // test for existence of file
pub def X_OK = 1; // test for execute or search permission
pub def W_OK = 2; // test for write permission
pub def R_OK = 4; // test for read permission

pub def O_RDONLY = 0x0000;
pub def O_WRONLY = 0x0001;
pub def O_RDWR = 0x0002;
pub def O_ACCMODE = 0x0003;

pub def O_SHLOCK = 0x0010;
pub def O_EXLOCK = 0x0020;

pub def O_CREAT = 0x0200;
pub def O_EXCL = 0x0800;
pub def O_NOCTTY = 0x8000;
pub def O_TRUNC = 0x0400;
pub def O_APPEND = 0x0008;
pub def O_NONBLOCK = 0x0004;
pub def O_DSYNC = 0o10000;
pub def O_SYNC = 0x0080;
pub def O_RSYNC = 0o4010000;
pub def O_DIRECTORY = 0o200000;
pub def O_NOFOLLOW = 0x0100;
pub def O_CLOEXEC = 0x00100000;

pub def O_ASYNC = 0x0040;
pub def O_DIRECT = 0x00010000;
pub def O_NOATIME = 0o1000000;
pub def O_PATH = 0o10000000;
pub def O_TMPFILE = 0o20200000;
pub def O_NDELAY = O_NONBLOCK;

pub def F_DUPFD = 0;
pub def F_GETFD = 1;
pub def F_SETFD = 2;
pub def F_GETFL = 3;
pub def F_SETFL = 4;

pub def F_SETOWN = 8;
pub def F_GETOWN = 9;
pub def F_SETSIG = 10;
pub def F_GETSIG = 11;

pub def F_GETLK = 5;
pub def F_SETLK = 6;
pub def F_SETLKW = 7;

pub def F_RDLCK = 1;
pub def F_WRLCK = 3;
pub def F_UNLCK = 2;

pub def LOCK_SH = 1;
pub def LOCK_EX = 2;
pub def LOCK_UN = 8;
pub def LOCK_NB = 4;

pub def F_SETOWN_EX = 15;
pub def F_GETOWN_EX = 16;

pub def F_GETOWNER_UIDS = 17;

pub def FD_CLOEXEC = 1;

pub def SEEK_SET = 0;
pub def SEEK_CUR = 1;
pub def SEEK_END = 2;

pub def SIG_BLOCK = 1;
pub def SIG_UNBLOCK = 2;
pub def SIG_SETMASK = 3;

pub def SOCK_STREAM = 1;
pub def SOCK_DGRAM = 2;
pub def SOCK_RAW = 3;
pub def SOCK_RDM = 4;
pub def SOCK_SEQPACKET = 5;

pub def SOCK_CLOEXEC = 0x10000000;
pub def SOCK_NONBLOCK = 0x20000000;

pub def PF_UNSPEC = AF_UNSPEC;
pub def PF_LOCAL = AF_LOCAL;
pub def PF_UNIX = PF_LOCAL;
pub def PF_INET = AF_INET;
pub def PF_IMPLINK = AF_IMPLINK;
pub def PF_PUP = AF_PUP;
pub def PF_CHAOS = AF_CHAOS;
pub def PF_NETBIOS = AF_NETBIOS;
pub def PF_ISO = AF_ISO;
pub def PF_OSI = AF_ISO;
pub def PF_ECMA = AF_ECMA;
pub def PF_DATAKIT = AF_DATAKIT;
pub def PF_CCITT = AF_CCITT;
pub def PF_DECnet = AF_DECnet;
pub def PF_DLI = AF_DLI;
pub def PF_LAT = AF_LAT;
pub def PF_HYLINK = AF_HYLINK;
pub def PF_APPLETALK = AF_APPLETALK;
pub def PF_ROUTE = AF_ROUTE;
pub def PF_LINK = AF_LINK;
pub def PF_XTP = pseudo_AF_XTP;
pub def PF_COIP = AF_COIP;
pub def PF_CNT = AF_CNT;
pub def PF_SIP = AF_SIP;
pub def PF_IPX = AF_IPX;
pub def PF_RTIP = pseudo_AF_RTIP;
pub def PF_PIP = psuedo_AF_PIP;
pub def PF_ISDN = AF_ISDN;
pub def PF_KEY = pseudo_AF_KEY;
pub def PF_INET6 = pseudo_AF_INET6;
pub def PF_NATM = AF_NATM;
pub def PF_ATM = AF_ATM;
pub def PF_NETGRAPH = AF_NETGRAPH;
pub def PF_SLOW = AF_SLOW;
pub def PF_SCLUSTER = AF_SCLUSTER;
pub def PF_ARP = AF_ARP;
pub def PF_BLUETOOTH = AF_BLUETOOTH;
pub def PF_IEEE80211 = AF_IEE80211;
pub def PF_INET_SDP = AF_INET_SDP;
pub def PF_INET6_SDP = AF_INET6_SDP;
pub def PF_MAX = AF_MAX;

pub def AF_UNSPEC = 0;
pub def AF_UNIX = 1;
pub def AF_LOCAL = AF_UNIX;
pub def AF_FILE = AF_LOCAL;
pub def AF_INET = 2;
pub def AF_IMPLINK = 3;
pub def AF_PUP = 4;
pub def AF_CHAOS = 5;
pub def AF_NETBIOS = 6;
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
pub def pseudo_AF_XTP = 19;
pub def AF_COIP = 20;
pub def AF_CNT = 21;
pub def pseudo_AF_RTIP = 22;
pub def AF_IPX = 23;
pub def AF_SIP = 24;
pub def pseudo_AF_PIP = 25;
pub def AF_ISDN = 26;
pub def AF_E164 = AF_ISDN;
pub def pseudo_AF_KEY = 27;
pub def AF_INET6 = 28;
pub def AF_NATM = 29;
pub def AF_ATM = 30;
pub def pseudo_AF_HDRCMPLT = 31;
pub def AF_NETGRAPH = 32;
pub def AF_SLOW = 33;
pub def AF_SCLUSTER = 34;
pub def AF_ARP = 35;
pub def AF_BLUETOOTH = 36;
pub def AF_IEEE80211 = 37;
pub def AF_INET_SDP = 38;
pub def AF_INET6_SDP = 39;
pub def AF_MAX = 42;

pub def DT_UNKNOWN = 0;
pub def DT_FIFO = 1;
pub def DT_CHR = 2;
pub def DT_DIR = 4;
pub def DT_BLK = 6;
pub def DT_REG = 8;
pub def DT_LNK = 10;
pub def DT_SOCK = 12;
pub def DT_WHT = 14;

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

/// Process descriptors
pub def EVFILT_PROCDESC = -8;

/// Filesystem events
pub def EVFILT_FS = -9;

pub def EVFILT_LIO = -10;

/// User events
pub def EVFILT_USER = -11;

/// Sendfile events
pub def EVFILT_SENDFILE = -12;

pub def EVFILT_EMPTY = -13;

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

/// behave like poll()
pub def NOTE_FILE_POLL = 0x00000002;

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

/// vnode was opened
pub def NOTE_OPEN = 0x00000080;

/// file closed, fd did not allow write
pub def NOTE_CLOSE = 0x00000100;

/// file closed, fd did allow write
pub def NOTE_CLOSE_WRITE = 0x00000200;

/// file was read
pub def NOTE_READ = 0x00000400;

/// process exited
pub def NOTE_EXIT = 0x80000000;

/// process forked
pub def NOTE_FORK = 0x40000000;

/// process exec'd
pub def NOTE_EXEC = 0x20000000;

/// mask for signal & exit status
pub def NOTE_PDATAMASK = 0x000fffff;
pub def NOTE_PCTRLMASK = (~NOTE_PDATAMASK);

/// data is seconds
pub def NOTE_SECONDS = 0x00000001;

/// data is milliseconds
pub def NOTE_MSECONDS = 0x00000002;

/// data is microseconds
pub def NOTE_USECONDS = 0x00000004;

/// data is nanoseconds
pub def NOTE_NSECONDS = 0x00000008;

/// timeout is absolute
pub def NOTE_ABSTIME = 0x00000010;

pub def TCGETS = 0x5401;
pub def TCSETS = 0x5402;
pub def TCSETSW = 0x5403;
pub def TCSETSF = 0x5404;
pub def TCGETA = 0x5405;
pub def TCSETA = 0x5406;
pub def TCSETAW = 0x5407;
pub def TCSETAF = 0x5408;
pub def TCSBRK = 0x5409;
pub def TCXONC = 0x540A;
pub def TCFLSH = 0x540B;
pub def TIOCEXCL = 0x540C;
pub def TIOCNXCL = 0x540D;
pub def TIOCSCTTY = 0x540E;
pub def TIOCGPGRP = 0x540F;
pub def TIOCSPGRP = 0x5410;
pub def TIOCOUTQ = 0x5411;
pub def TIOCSTI = 0x5412;
pub def TIOCGWINSZ = 0x5413;
pub def TIOCSWINSZ = 0x5414;
pub def TIOCMGET = 0x5415;
pub def TIOCMBIS = 0x5416;
pub def TIOCMBIC = 0x5417;
pub def TIOCMSET = 0x5418;
pub def TIOCGSOFTCAR = 0x5419;
pub def TIOCSSOFTCAR = 0x541A;
pub def FIONREAD = 0x541B;
pub def TIOCINQ = FIONREAD;
pub def TIOCLINUX = 0x541C;
pub def TIOCCONS = 0x541D;
pub def TIOCGSERIAL = 0x541E;
pub def TIOCSSERIAL = 0x541F;
pub def TIOCPKT = 0x5420;
pub def FIONBIO = 0x5421;
pub def TIOCNOTTY = 0x5422;
pub def TIOCSETD = 0x5423;
pub def TIOCGETD = 0x5424;
pub def TCSBRKP = 0x5425;
pub def TIOCSBRK = 0x5427;
pub def TIOCCBRK = 0x5428;
pub def TIOCGSID = 0x5429;
pub def TIOCGRS485 = 0x542E;
pub def TIOCSRS485 = 0x542F;
pub def TIOCGPTN = 0x80045430;
pub def TIOCSPTLCK = 0x40045431;
pub def TIOCGDEV = 0x80045432;
pub def TCGETX = 0x5432;
pub def TCSETX = 0x5433;
pub def TCSETXF = 0x5434;
pub def TCSETXW = 0x5435;
pub def TIOCSIG = 0x40045436;
pub def TIOCVHANGUP = 0x5437;
pub def TIOCGPKT = 0x80045438;
pub def TIOCGPTLCK = 0x80045439;
pub def TIOCGEXCL = 0x80045440;

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

pub def winsize = extern struct {
    ws_row: u16,
    ws_col: u16,
    ws_xpixel: u16,
    ws_ypixel: u16,
};

def NSIG = 32;

pub def SIG_ERR = @intToPtr(extern fn (i32) void, maxInt(usize));
pub def SIG_DFL = @intToPtr(extern fn (i32) void, 0);
pub def SIG_IGN = @intToPtr(extern fn (i32) void, 1);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with the syscall.
pub def Sigaction = extern struct {
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

pub def _SIG_WORDS = 4;
pub def _SIG_MAXSIG = 128;

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

pub def sigset_t = extern struct {
    __bits: [_SIG_WORDS]u32,
};

pub def EPERM = 1; // Operation not permitted
pub def ENOENT = 2; // No such file or directory
pub def ESRCH = 3; // No such process
pub def EINTR = 4; // Interrupted system call
pub def EIO = 5; // Input/output error
pub def ENXIO = 6; // Device not configured
pub def E2BIG = 7; // Argument list too long
pub def ENOEXEC = 8; // Exec format error
pub def EBADF = 9; // Bad file descriptor
pub def ECHILD = 10; // No child processes
pub def EDEADLK = 11; // Resource deadlock avoided
// 11 was EAGAIN
pub def ENOMEM = 12; // Cannot allocate memory
pub def EACCES = 13; // Permission denied
pub def EFAULT = 14; // Bad address
pub def ENOTBLK = 15; // Block device required
pub def EBUSY = 16; // Device busy
pub def EEXIST = 17; // File exists
pub def EXDEV = 18; // Cross-device link
pub def ENODEV = 19; // Operation not supported by device
pub def ENOTDIR = 20; // Not a directory
pub def EISDIR = 21; // Is a directory
pub def EINVAL = 22; // Invalid argument
pub def ENFILE = 23; // Too many open files in system
pub def EMFILE = 24; // Too many open files
pub def ENOTTY = 25; // Inappropriate ioctl for device
pub def ETXTBSY = 26; // Text file busy
pub def EFBIG = 27; // File too large
pub def ENOSPC = 28; // No space left on device
pub def ESPIPE = 29; // Illegal seek
pub def EROFS = 30; // Read-only filesystem
pub def EMLINK = 31; // Too many links
pub def EPIPE = 32; // Broken pipe

// math software
pub def EDOM = 33; // Numerical argument out of domain
pub def ERANGE = 34; // Result too large

// non-blocking and interrupt i/o
pub def EAGAIN = 35; // Resource temporarily unavailable
pub def EWOULDBLOCK = EAGAIN; // Operation would block
pub def EINPROGRESS = 36; // Operation now in progress
pub def EALREADY = 37; // Operation already in progress

// ipc/network software -- argument errors
pub def ENOTSOCK = 38; // Socket operation on non-socket
pub def EDESTADDRREQ = 39; // Destination address required
pub def EMSGSIZE = 40; // Message too long
pub def EPROTOTYPE = 41; // Protocol wrong type for socket
pub def ENOPROTOOPT = 42; // Protocol not available
pub def EPROTONOSUPPORT = 43; // Protocol not supported
pub def ESOCKTNOSUPPORT = 44; // Socket type not supported
pub def EOPNOTSUPP = 45; // Operation not supported
pub def ENOTSUP = EOPNOTSUPP; // Operation not supported
pub def EPFNOSUPPORT = 46; // Protocol family not supported
pub def EAFNOSUPPORT = 47; // Address family not supported by protocol family
pub def EADDRINUSE = 48; // Address already in use
pub def EADDRNOTAVAIL = 49; // Can't assign requested address

// ipc/network software -- operational errors
pub def ENETDOWN = 50; // Network is down
pub def ENETUNREACH = 51; // Network is unreachable
pub def ENETRESET = 52; // Network dropped connection on reset
pub def ECONNABORTED = 53; // Software caused connection abort
pub def ECONNRESET = 54; // Connection reset by peer
pub def ENOBUFS = 55; // No buffer space available
pub def EISCONN = 56; // Socket is already connected
pub def ENOTCONN = 57; // Socket is not connected
pub def ESHUTDOWN = 58; // Can't send after socket shutdown
pub def ETOOMANYREFS = 59; // Too many references: can't splice
pub def ETIMEDOUT = 60; // Operation timed out
pub def ECONNREFUSED = 61; // Connection refused

pub def ELOOP = 62; // Too many levels of symbolic links
pub def ENAMETOOLONG = 63; // File name too long

// should be rearranged
pub def EHOSTDOWN = 64; // Host is down
pub def EHOSTUNREACH = 65; // No route to host
pub def ENOTEMPTY = 66; // Directory not empty

// quotas & mush
pub def EPROCLIM = 67; // Too many processes
pub def EUSERS = 68; // Too many users
pub def EDQUOT = 69; // Disc quota exceeded

// Network File System
pub def ESTALE = 70; // Stale NFS file handle
pub def EREMOTE = 71; // Too many levels of remote in path
pub def EBADRPC = 72; // RPC struct is bad
pub def ERPCMISMATCH = 73; // RPC version wrong
pub def EPROGUNAVAIL = 74; // RPC prog. not avail
pub def EPROGMISMATCH = 75; // Program version wrong
pub def EPROCUNAVAIL = 76; // Bad procedure for program

pub def ENOLCK = 77; // No locks available
pub def ENOSYS = 78; // Function not implemented

pub def EFTYPE = 79; // Inappropriate file type or format
pub def EAUTH = 80; // Authentication error
pub def ENEEDAUTH = 81; // Need authenticator
pub def EIDRM = 82; // Identifier removed
pub def ENOMSG = 83; // No message of desired type
pub def EOVERFLOW = 84; // Value too large to be stored in data type
pub def ECANCELED = 85; // Operation canceled
pub def EILSEQ = 86; // Illegal byte sequence
pub def ENOATTR = 87; // Attribute not found

pub def EDOOFUS = 88; // Programming error

pub def EBADMSG = 89; // Bad message
pub def EMULTIHOP = 90; // Multihop attempted
pub def ENOLINK = 91; // Link has been severed
pub def EPROTO = 92; // Protocol error

pub def ENOTCAPABLE = 93; // Capabilities insufficient
pub def ECAPMODE = 94; // Not permitted in capability mode
pub def ENOTRECOVERABLE = 95; // State not recoverable
pub def EOWNERDEAD = 96; // Previous owner died

pub def ELAST = 96; // Must be equal largest errno

pub def MINSIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64 => 2048,
    .arm, .aarch64 => 4096,
    else => @compileError("MINSIGSTKSZ not defined for this architecture"),
};
pub def SIGSTKSZ = MINSIGSTKSZ + 32768;

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

pub def HOST_NAME_MAX = 255;

/// Magic value that specify the use of the current working directory
/// to determine the target of relative file paths in the openat() and
/// similar syscalls.
pub def AT_FDCWD = -100;

/// Check access using effective user and group ID
pub def AT_EACCESS = 0x0100;

/// Do not follow symbolic links
pub def AT_SYMLINK_NOFOLLOW = 0x0200;

/// Follow symbolic link
pub def AT_SYMLINK_FOLLOW = 0x0400;

/// Remove directory instead of file
pub def AT_REMOVEDIR = 0x0800;

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

/// Fail if not under dirfd
pub def AT_BENEATH = 0x1000;

/// dummy for IP
pub def IPPROTO_IP = 0;

/// control message protocol
pub def IPPROTO_ICMP = 1;

/// tcp
pub def IPPROTO_TCP = 6;

/// user datagram protocol
pub def IPPROTO_UDP = 17;

/// IP6 header
pub def IPPROTO_IPV6 = 41;

/// raw IP packet
pub def IPPROTO_RAW = 255;

/// IP6 hop-by-hop options
pub def IPPROTO_HOPOPTS = 0;

/// group mgmt protocol
pub def IPPROTO_IGMP = 2;

/// gateway^2 (deprecated)
pub def IPPROTO_GGP = 3;

/// IPv4 encapsulation
pub def IPPROTO_IPV4 = 4;

/// for compatibility
pub def IPPROTO_IPIP = IPPROTO_IPV4;

/// Stream protocol II
pub def IPPROTO_ST = 7;

/// exterior gateway protocol
pub def IPPROTO_EGP = 8;

/// private interior gateway
pub def IPPROTO_PIGP = 9;

/// BBN RCC Monitoring
pub def IPPROTO_RCCMON = 10;

/// network voice protocol
pub def IPPROTO_NVPII = 11;

/// pup
pub def IPPROTO_PUP = 12;

/// Argus
pub def IPPROTO_ARGUS = 13;

/// EMCON
pub def IPPROTO_EMCON = 14;

/// Cross Net Debugger
pub def IPPROTO_XNET = 15;

/// Chaos
pub def IPPROTO_CHAOS = 16;

/// Multiplexing
pub def IPPROTO_MUX = 18;

/// DCN Measurement Subsystems
pub def IPPROTO_MEAS = 19;

/// Host Monitoring
pub def IPPROTO_HMP = 20;

/// Packet Radio Measurement
pub def IPPROTO_PRM = 21;

/// xns idp
pub def IPPROTO_IDP = 22;

/// Trunk-1
pub def IPPROTO_TRUNK1 = 23;

/// Trunk-2
pub def IPPROTO_TRUNK2 = 24;

/// Leaf-1
pub def IPPROTO_LEAF1 = 25;

/// Leaf-2
pub def IPPROTO_LEAF2 = 26;

/// Reliable Data
pub def IPPROTO_RDP = 27;

/// Reliable Transaction
pub def IPPROTO_IRTP = 28;

/// tp-4 w/ class negotiation
pub def IPPROTO_TP = 29;

/// Bulk Data Transfer
pub def IPPROTO_BLT = 30;

/// Network Services
pub def IPPROTO_NSP = 31;

/// Merit Internodal
pub def IPPROTO_INP = 32;

/// Datagram Congestion Control Protocol
pub def IPPROTO_DCCP = 33;

/// Third Party Connect
pub def IPPROTO_3PC = 34;

/// InterDomain Policy Routing
pub def IPPROTO_IDPR = 35;

/// XTP
pub def IPPROTO_XTP = 36;

/// Datagram Delivery
pub def IPPROTO_DDP = 37;

/// Control Message Transport
pub def IPPROTO_CMTP = 38;

/// TP++ Transport
pub def IPPROTO_TPXX = 39;

/// IL transport protocol
pub def IPPROTO_IL = 40;

/// Source Demand Routing
pub def IPPROTO_SDRP = 42;

/// IP6 routing header
pub def IPPROTO_ROUTING = 43;

/// IP6 fragmentation header
pub def IPPROTO_FRAGMENT = 44;

/// InterDomain Routing
pub def IPPROTO_IDRP = 45;

/// resource reservation
pub def IPPROTO_RSVP = 46;

/// General Routing Encap.
pub def IPPROTO_GRE = 47;

/// Mobile Host Routing
pub def IPPROTO_MHRP = 48;

/// BHA
pub def IPPROTO_BHA = 49;

/// IP6 Encap Sec. Payload
pub def IPPROTO_ESP = 50;

/// IP6 Auth Header
pub def IPPROTO_AH = 51;

/// Integ. Net Layer Security
pub def IPPROTO_INLSP = 52;

/// IP with encryption
pub def IPPROTO_SWIPE = 53;

/// Next Hop Resolution
pub def IPPROTO_NHRP = 54;

/// IP Mobility
pub def IPPROTO_MOBILE = 55;

/// Transport Layer Security
pub def IPPROTO_TLSP = 56;

/// SKIP
pub def IPPROTO_SKIP = 57;

/// ICMP6
pub def IPPROTO_ICMPV6 = 58;

/// IP6 no next header
pub def IPPROTO_NONE = 59;

/// IP6 destination option
pub def IPPROTO_DSTOPTS = 60;

/// any host internal protocol
pub def IPPROTO_AHIP = 61;

/// CFTP
pub def IPPROTO_CFTP = 62;

/// "hello" routing protocol
pub def IPPROTO_HELLO = 63;

/// SATNET/Backroom EXPAK
pub def IPPROTO_SATEXPAK = 64;

/// Kryptolan
pub def IPPROTO_KRYPTOLAN = 65;

/// Remote Virtual Disk
pub def IPPROTO_RVD = 66;

/// Pluribus Packet Core
pub def IPPROTO_IPPC = 67;

/// Any distributed FS
pub def IPPROTO_ADFS = 68;

/// Satnet Monitoring
pub def IPPROTO_SATMON = 69;

/// VISA Protocol
pub def IPPROTO_VISA = 70;

/// Packet Core Utility
pub def IPPROTO_IPCV = 71;

/// Comp. Prot. Net. Executive
pub def IPPROTO_CPNX = 72;

/// Comp. Prot. HeartBeat
pub def IPPROTO_CPHB = 73;

/// Wang Span Network
pub def IPPROTO_WSN = 74;

/// Packet Video Protocol
pub def IPPROTO_PVP = 75;

/// BackRoom SATNET Monitoring
pub def IPPROTO_BRSATMON = 76;

/// Sun net disk proto (temp.)
pub def IPPROTO_ND = 77;

/// WIDEBAND Monitoring
pub def IPPROTO_WBMON = 78;

/// WIDEBAND EXPAK
pub def IPPROTO_WBEXPAK = 79;

/// ISO cnlp
pub def IPPROTO_EON = 80;

/// VMTP
pub def IPPROTO_VMTP = 81;

/// Secure VMTP
pub def IPPROTO_SVMTP = 82;

/// Banyon VINES
pub def IPPROTO_VINES = 83;

/// TTP
pub def IPPROTO_TTP = 84;

/// NSFNET-IGP
pub def IPPROTO_IGP = 85;

/// dissimilar gateway prot.
pub def IPPROTO_DGP = 86;

/// TCF
pub def IPPROTO_TCF = 87;

/// Cisco/GXS IGRP
pub def IPPROTO_IGRP = 88;

/// OSPFIGP
pub def IPPROTO_OSPFIGP = 89;

/// Strite RPC protocol
pub def IPPROTO_SRPC = 90;

/// Locus Address Resoloution
pub def IPPROTO_LARP = 91;

/// Multicast Transport
pub def IPPROTO_MTP = 92;

/// AX.25 Frames
pub def IPPROTO_AX25 = 93;

/// IP encapsulated in IP
pub def IPPROTO_IPEIP = 94;

/// Mobile Int.ing control
pub def IPPROTO_MICP = 95;

/// Semaphore Comm. security
pub def IPPROTO_SCCSP = 96;

/// Ethernet IP encapsulation
pub def IPPROTO_ETHERIP = 97;

/// encapsulation header
pub def IPPROTO_ENCAP = 98;

/// any private encr. scheme
pub def IPPROTO_APES = 99;

/// GMTP
pub def IPPROTO_GMTP = 100;

/// payload compression (IPComp)
pub def IPPROTO_IPCOMP = 108;

/// SCTP
pub def IPPROTO_SCTP = 132;

/// IPv6 Mobility Header
pub def IPPROTO_MH = 135;

/// UDP-Lite
pub def IPPROTO_UDPLITE = 136;

/// IP6 Host Identity Protocol
pub def IPPROTO_HIP = 139;

/// IP6 Shim6 Protocol
pub def IPPROTO_SHIM6 = 140;

/// Protocol Independent Mcast
pub def IPPROTO_PIM = 103;

/// CARP
pub def IPPROTO_CARP = 112;

/// PGM
pub def IPPROTO_PGM = 113;

/// MPLS-in-IP
pub def IPPROTO_MPLS = 137;

/// PFSYNC
pub def IPPROTO_PFSYNC = 240;

/// Reserved
pub def IPPROTO_RESERVED_253 = 253;

/// Reserved
pub def IPPROTO_RESERVED_254 = 254;
