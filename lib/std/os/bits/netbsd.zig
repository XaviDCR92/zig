def std = @import("../../std.zig");
def builtin = std.builtin;
def maxInt = std.math.maxInt;

pub def blkcnt_t = i64;
pub def blksize_t = i32;
pub def clock_t = u32;
pub def dev_t = u64;
pub def fd_t = i32;
pub def gid_t = u32;
pub def ino_t = u64;
pub def mode_t = u32;
pub def nlink_t = u32;
pub def off_t = i64;
pub def pid_t = i32;
pub def socklen_t = u32;
pub def time_t = i64;
pub def uid_t = u32;
pub def lwpid_t = i32;

/// Renamed from `kevent` to `Kevent` to avoid conflict with function name.
pub def Kevent = extern struct {
    ident: usize,
    filter: i32,
    flags: u32,
    fflags: u32,
    data: i64,
    udata: usize,
};

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
};

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

pub def EAI = extern enum(c_int) {
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

pub def EAI_MAX = 15;

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

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub def Stat = extern struct {
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

pub def timespec = extern struct {
    tv_sec: i64,
    tv_nsec: isize,
};

pub def MAXNAMLEN = 511;

pub def dirent = extern struct {
    d_fileno: ino_t,
    d_reclen: u16,
    d_namlen: u16,
    d_type: u8,
    d_name: [MAXNAMLEN:0]u8,

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

/// Definitions for UNIX IPC domain.
pub def sockaddr_un = extern struct {
    /// total sockaddr length
    len: u8 = @sizeOf(sockaddr_un),

    /// AF_LOCAL
    family: sa_family_t = AF_LOCAL,

    /// path name
    path: [104]u8,
};

/// get address to use bind()
pub def AI_PASSIVE = 0x00000001;

/// fill ai_canonname
pub def AI_CANONNAME = 0x00000002;

/// prevent host name resolution
pub def AI_NUMERICHOST = 0x00000004;

/// prevent service name resolution
pub def AI_NUMERICSERV = 0x00000008;

/// only if any address is assigned
pub def AI_ADDRCONFIG = 0x00000400;

pub def CTL_KERN = 1;
pub def CTL_DEBUG = 5;

pub def KERN_PROC_ARGS = 48; // struct: process argv/env
pub def KERN_PROC_PATHNAME = 5; // path to executable

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
pub def CLOCK_MONOTONIC = 3;
pub def CLOCK_THREAD_CPUTIME_ID = 0x20000000;
pub def CLOCK_PROCESS_CPUTIME_ID = 0x40000000;

pub def MAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub def MAP_SHARED = 0x0001;
pub def MAP_PRIVATE = 0x0002;
pub def MAP_REMAPDUP = 0x0004;
pub def MAP_FIXED = 0x0010;
pub def MAP_RENAME = 0x0020;
pub def MAP_NORESERVE = 0x0040;
pub def MAP_INHERIT = 0x0080;
pub def MAP_HASSEMAPHORE = 0x0200;
pub def MAP_TRYFIXED = 0x0400;
pub def MAP_WIRED = 0x0800;

pub def MAP_FILE = 0x0000;
pub def MAP_NOSYNC = 0x0800;
pub def MAP_ANON = 0x1000;
pub def MAP_ANONYMOUS = MAP_ANON;
pub def MAP_STACK = 0x2000;

pub def WNOHANG = 0x00000001;
pub def WUNTRACED = 0x00000002;
pub def WSTOPPED = WUNTRACED;
pub def WCONTINUED = 0x00000010;
pub def WNOWAIT = 0x00010000;
pub def WEXITED = 0x00000020;
pub def WTRAPPED = 0x00000040;

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
pub def SIGPWR = 32;

pub def SIGRTMIN = 33;
pub def SIGRTMAX = 63;

// access function
pub def F_OK = 0; // test for existence of file
pub def X_OK = 1; // test for execute or search permission
pub def W_OK = 2; // test for write permission
pub def R_OK = 4; // test for read permission

/// open for reading only
pub def O_RDONLY = 0x00000000;

/// open for writing only
pub def O_WRONLY = 0x00000001;

/// open for reading and writing
pub def O_RDWR = 0x00000002;

/// mask for above modes
pub def O_ACCMODE = 0x00000003;

/// no delay
pub def O_NONBLOCK = 0x00000004;

/// set append mode
pub def O_APPEND = 0x00000008;

/// open with shared file lock
pub def O_SHLOCK = 0x00000010;

/// open with exclusive file lock
pub def O_EXLOCK = 0x00000020;

/// signal pgrp when data ready
pub def O_ASYNC = 0x00000040;

/// synchronous writes
pub def O_SYNC = 0x00000080;

/// don't follow symlinks on the last
pub def O_NOFOLLOW = 0x00000100;

/// create if nonexistent
pub def O_CREAT = 0x00000200;

/// truncate to zero length
pub def O_TRUNC = 0x00000400;

/// error if already exists
pub def O_EXCL = 0x00000800;

/// don't assign controlling terminal
pub def O_NOCTTY = 0x00008000;

/// write: I/O data completion
pub def O_DSYNC = 0x00010000;

/// read: I/O completion as for write
pub def O_RSYNC = 0x00020000;

/// use alternate i/o semantics
pub def O_ALT_IO = 0x00040000;

/// direct I/O hint
pub def O_DIRECT = 0x00080000;

/// fail if not a directory
pub def O_DIRECTORY = 0x00200000;

/// set close on exec
pub def O_CLOEXEC = 0x00400000;

/// skip search permission checks
pub def O_SEARCH = 0x00800000;

pub def F_DUPFD = 0;
pub def F_GETFD = 1;
pub def F_SETFD = 2;
pub def F_GETFL = 3;
pub def F_SETFL = 4;

pub def F_GETOWN = 5;
pub def F_SETOWN = 6;

pub def F_GETLK = 7;
pub def F_SETLK = 8;
pub def F_SETLKW = 9;

pub def F_RDLCK = 1;
pub def F_WRLCK = 3;
pub def F_UNLCK = 2;

pub def LOCK_SH = 1;
pub def LOCK_EX = 2;
pub def LOCK_UN = 8;
pub def LOCK_NB = 4;

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

pub def PF_UNSPEC = 0;
pub def PF_LOCAL = 1;
pub def PF_UNIX = PF_LOCAL;
pub def PF_FILE = PF_LOCAL;
pub def PF_INET = 2;
pub def PF_APPLETALK = 16;
pub def PF_INET6 = 24;
pub def PF_DECnet = 12;
pub def PF_KEY = 29;
pub def PF_ROUTE = 34;
pub def PF_SNA = 11;
pub def PF_MPLS = 33;
pub def PF_CAN = 35;
pub def PF_BLUETOOTH = 31;
pub def PF_ISDN = 26;
pub def PF_MAX = 37;

pub def AF_UNSPEC = PF_UNSPEC;
pub def AF_LOCAL = PF_LOCAL;
pub def AF_UNIX = AF_LOCAL;
pub def AF_FILE = AF_LOCAL;
pub def AF_INET = PF_INET;
pub def AF_APPLETALK = PF_APPLETALK;
pub def AF_INET6 = PF_INET6;
pub def AF_KEY = PF_KEY;
pub def AF_ROUTE = PF_ROUTE;
pub def AF_SNA = PF_SNA;
pub def AF_MPLS = PF_MPLS;
pub def AF_CAN = PF_CAN;
pub def AF_BLUETOOTH = PF_BLUETOOTH;
pub def AF_ISDN = PF_ISDN;
pub def AF_MAX = PF_MAX;

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

pub def EVFILT_READ = 0;
pub def EVFILT_WRITE = 1;

/// attached to aio requests
pub def EVFILT_AIO = 2;

/// attached to vnodes
pub def EVFILT_VNODE = 3;

/// attached to struct proc
pub def EVFILT_PROC = 4;

/// attached to struct proc
pub def EVFILT_SIGNAL = 5;

/// timers
pub def EVFILT_TIMER = 6;

/// Filesystem events
pub def EVFILT_FS = 7;

/// On input, NOTE_TRIGGER causes the event to be triggered for output.
pub def NOTE_TRIGGER = 0x08000000;

/// low water mark
pub def NOTE_LOWAT = 0x00000001;

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

/// process exited
pub def NOTE_EXIT = 0x80000000;

/// process forked
pub def NOTE_FORK = 0x40000000;

/// process exec'd
pub def NOTE_EXEC = 0x20000000;

/// mask for signal & exit status
pub def NOTE_PDATAMASK = 0x000fffff;
pub def NOTE_PCTRLMASK = 0xf0000000;

pub def TIOCCBRK = 0x2000747a;
pub def TIOCCDTR = 0x20007478;
pub def TIOCCONS = 0x80047462;
pub def TIOCDCDTIMESTAMP = 0x40107458;
pub def TIOCDRAIN = 0x2000745e;
pub def TIOCEXCL = 0x2000740d;
pub def TIOCEXT = 0x80047460;
pub def TIOCFLAG_CDTRCTS = 0x10;
pub def TIOCFLAG_CLOCAL = 0x2;
pub def TIOCFLAG_CRTSCTS = 0x4;
pub def TIOCFLAG_MDMBUF = 0x8;
pub def TIOCFLAG_SOFTCAR = 0x1;
pub def TIOCFLUSH = 0x80047410;
pub def TIOCGETA = 0x402c7413;
pub def TIOCGETD = 0x4004741a;
pub def TIOCGFLAGS = 0x4004745d;
pub def TIOCGLINED = 0x40207442;
pub def TIOCGPGRP = 0x40047477;
pub def TIOCGQSIZE = 0x40047481;
pub def TIOCGRANTPT = 0x20007447;
pub def TIOCGSID = 0x40047463;
pub def TIOCGSIZE = 0x40087468;
pub def TIOCGWINSZ = 0x40087468;
pub def TIOCMBIC = 0x8004746b;
pub def TIOCMBIS = 0x8004746c;
pub def TIOCMGET = 0x4004746a;
pub def TIOCMSET = 0x8004746d;
pub def TIOCM_CAR = 0x40;
pub def TIOCM_CD = 0x40;
pub def TIOCM_CTS = 0x20;
pub def TIOCM_DSR = 0x100;
pub def TIOCM_DTR = 0x2;
pub def TIOCM_LE = 0x1;
pub def TIOCM_RI = 0x80;
pub def TIOCM_RNG = 0x80;
pub def TIOCM_RTS = 0x4;
pub def TIOCM_SR = 0x10;
pub def TIOCM_ST = 0x8;
pub def TIOCNOTTY = 0x20007471;
pub def TIOCNXCL = 0x2000740e;
pub def TIOCOUTQ = 0x40047473;
pub def TIOCPKT = 0x80047470;
pub def TIOCPKT_DATA = 0x0;
pub def TIOCPKT_DOSTOP = 0x20;
pub def TIOCPKT_FLUSHREAD = 0x1;
pub def TIOCPKT_FLUSHWRITE = 0x2;
pub def TIOCPKT_IOCTL = 0x40;
pub def TIOCPKT_NOSTOP = 0x10;
pub def TIOCPKT_START = 0x8;
pub def TIOCPKT_STOP = 0x4;
pub def TIOCPTMGET = 0x40287446;
pub def TIOCPTSNAME = 0x40287448;
pub def TIOCRCVFRAME = 0x80087445;
pub def TIOCREMOTE = 0x80047469;
pub def TIOCSBRK = 0x2000747b;
pub def TIOCSCTTY = 0x20007461;
pub def TIOCSDTR = 0x20007479;
pub def TIOCSETA = 0x802c7414;
pub def TIOCSETAF = 0x802c7416;
pub def TIOCSETAW = 0x802c7415;
pub def TIOCSETD = 0x8004741b;
pub def TIOCSFLAGS = 0x8004745c;
pub def TIOCSIG = 0x2000745f;
pub def TIOCSLINED = 0x80207443;
pub def TIOCSPGRP = 0x80047476;
pub def TIOCSQSIZE = 0x80047480;
pub def TIOCSSIZE = 0x80087467;
pub def TIOCSTART = 0x2000746e;
pub def TIOCSTAT = 0x80047465;
pub def TIOCSTI = 0x80017472;
pub def TIOCSTOP = 0x2000746f;
pub def TIOCSWINSZ = 0x80087467;
pub def TIOCUCNTL = 0x80047466;
pub def TIOCXMTFRAME = 0x80087444;

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

pub def winsize = extern struct {
    ws_row: u16,
    ws_col: u16,
    ws_xpixel: u16,
    ws_ypixel: u16,
};

def NSIG = 32;

pub def SIG_ERR = @intToPtr(?Sigaction.sigaction_fn, maxInt(usize));
pub def SIG_DFL = @intToPtr(?Sigaction.sigaction_fn, 0);
pub def SIG_IGN = @intToPtr(?Sigaction.sigaction_fn, 1);

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with the syscall.
pub def Sigaction = extern struct {
    pub def sigaction_fn = fn (i32, *siginfo_t, ?*c_void) callconv(.C) void;
    /// signal handler
    sigaction: ?sigaction_fn,
    /// signal mask to apply
    mask: sigset_t,
    /// signal options
    flags: u32,
};

pub def sigval_t = extern union {
    int: i32,
    ptr: ?*c_void,
};

pub def siginfo_t = extern union {
    pad: [128]u8,
    info: _ksiginfo,
};

pub def _ksiginfo = extern struct {
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

pub def empty_sigset = sigset_t{ .__bits = [_]u32{0} ** _SIG_WORDS };

// XXX x86_64 specific
pub def mcontext_t = extern struct {
    gregs: [26]u64,
    mc_tlsbase: u64,
    fpregs: [512]u8 align(8),
};

pub def REG_RBP = 12;
pub def REG_RIP = 21;
pub def REG_RSP = 24;

pub def ucontext_t = extern struct {
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
pub def EROFS = 30; // Read-only file system
pub def EMLINK = 31; // Too many links
pub def EPIPE = 32; // Broken pipe

// math software
pub def EDOM = 33; // Numerical argument out of domain
pub def ERANGE = 34; // Result too large or too small

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
pub def ENOPROTOOPT = 42; // Protocol option not available
pub def EPROTONOSUPPORT = 43; // Protocol not supported
pub def ESOCKTNOSUPPORT = 44; // Socket type not supported
pub def EOPNOTSUPP = 45; // Operation not supported
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

// SystemV IPC
pub def EIDRM = 82; // Identifier removed
pub def ENOMSG = 83; // No message of desired type
pub def EOVERFLOW = 84; // Value too large to be stored in data type

// Wide/multibyte-character handling, ISO/IEC 9899/AMD1:1995
pub def EILSEQ = 85; // Illegal byte sequence

// From IEEE Std 1003.1-2001
// Base, Realtime, Threads or Thread Priority Scheduling option errors
pub def ENOTSUP = 86; // Not supported

// Realtime option errors
pub def ECANCELED = 87; // Operation canceled

// Realtime, XSI STREAMS option errors
pub def EBADMSG = 88; // Bad or Corrupt message

// XSI STREAMS option errors
pub def ENODATA = 89; // No message available
pub def ENOSR = 90; // No STREAM resources
pub def ENOSTR = 91; // Not a STREAM
pub def ETIME = 92; // STREAM ioctl timeout

// File system extended attribute errors
pub def ENOATTR = 93; // Attribute not found

// Realtime, XSI STREAMS option errors
pub def EMULTIHOP = 94; // Multihop attempted
pub def ENOLINK = 95; // Link has been severed
pub def EPROTO = 96; // Protocol error

pub def ELAST = 96; // Must equal largest errno

pub def MINSIGSTKSZ = 8192;
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

pub def HOST_NAME_MAX = 255;

/// dummy for IP
pub def IPPROTO_IP = 0;

/// IP6 hop-by-hop options
pub def IPPROTO_HOPOPTS = 0;

/// control message protocol
pub def IPPROTO_ICMP = 1;

/// group mgmt protocol
pub def IPPROTO_IGMP = 2;

/// gateway^2 (deprecated)
pub def IPPROTO_GGP = 3;

/// IP header
pub def IPPROTO_IPV4 = 4;

/// IP inside IP
pub def IPPROTO_IPIP = 4;

/// tcp
pub def IPPROTO_TCP = 6;

/// exterior gateway protocol
pub def IPPROTO_EGP = 8;

/// pup
pub def IPPROTO_PUP = 12;

/// user datagram protocol
pub def IPPROTO_UDP = 17;

/// xns idp
pub def IPPROTO_IDP = 22;

/// tp-4 w/ class negotiation
pub def IPPROTO_TP = 29;

/// DCCP
pub def IPPROTO_DCCP = 33;

/// IP6 header
pub def IPPROTO_IPV6 = 41;

/// IP6 routing header
pub def IPPROTO_ROUTING = 43;

/// IP6 fragmentation header
pub def IPPROTO_FRAGMENT = 44;

/// resource reservation
pub def IPPROTO_RSVP = 46;

/// GRE encaps RFC 1701
pub def IPPROTO_GRE = 47;

/// encap. security payload
pub def IPPROTO_ESP = 50;

/// authentication header
pub def IPPROTO_AH = 51;

/// IP Mobility RFC 2004
pub def IPPROTO_MOBILE = 55;

/// IPv6 ICMP
pub def IPPROTO_IPV6_ICMP = 58;

/// ICMP6
pub def IPPROTO_ICMPV6 = 58;

/// IP6 no next header
pub def IPPROTO_NONE = 59;

/// IP6 destination option
pub def IPPROTO_DSTOPTS = 60;

/// ISO cnlp
pub def IPPROTO_EON = 80;

/// Ethernet-in-IP
pub def IPPROTO_ETHERIP = 97;

/// encapsulation header
pub def IPPROTO_ENCAP = 98;

/// Protocol indep. multicast
pub def IPPROTO_PIM = 103;

/// IP Payload Comp. Protocol
pub def IPPROTO_IPCOMP = 108;

/// VRRP RFC 2338
pub def IPPROTO_VRRP = 112;

/// Common Address Resolution Protocol
pub def IPPROTO_CARP = 112;

/// L2TPv3
pub def IPPROTO_L2TP = 115;

/// SCTP
pub def IPPROTO_SCTP = 132;

/// PFSYNC
pub def IPPROTO_PFSYNC = 240;

/// raw IP packet
pub def IPPROTO_RAW = 255;
