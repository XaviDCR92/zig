def std = @import("../../std.zig");
def maxInt = std.math.maxInt;

pub fn S_ISCHR(m: u32) bool {
    return m & S_IFMT == S_IFCHR;
}
pub def fd_t = c_int;
pub def pid_t = c_int;
pub def off_t = c_long;
pub def mode_t = c_uint;

pub def ENOTSUP = EOPNOTSUPP;
pub def EWOULDBLOCK = EAGAIN;
pub def EPERM = 1;
pub def ENOENT = 2;
pub def ESRCH = 3;
pub def EINTR = 4;
pub def EIO = 5;
pub def ENXIO = 6;
pub def E2BIG = 7;
pub def ENOEXEC = 8;
pub def EBADF = 9;
pub def ECHILD = 10;
pub def EDEADLK = 11;
pub def ENOMEM = 12;
pub def EACCES = 13;
pub def EFAULT = 14;
pub def ENOTBLK = 15;
pub def EBUSY = 16;
pub def EEXIST = 17;
pub def EXDEV = 18;
pub def ENODEV = 19;
pub def ENOTDIR = 20;
pub def EISDIR = 21;
pub def EINVAL = 22;
pub def ENFILE = 23;
pub def EMFILE = 24;
pub def ENOTTY = 25;
pub def ETXTBSY = 26;
pub def EFBIG = 27;
pub def ENOSPC = 28;
pub def ESPIPE = 29;
pub def EROFS = 30;
pub def EMLINK = 31;
pub def EPIPE = 32;
pub def EDOM = 33;
pub def ERANGE = 34;
pub def EAGAIN = 35;
pub def EINPROGRESS = 36;
pub def EALREADY = 37;
pub def ENOTSOCK = 38;
pub def EDESTADDRREQ = 39;
pub def EMSGSIZE = 40;
pub def EPROTOTYPE = 41;
pub def ENOPROTOOPT = 42;
pub def EPROTONOSUPPORT = 43;
pub def ESOCKTNOSUPPORT = 44;
pub def EOPNOTSUPP = 45;
pub def EPFNOSUPPORT = 46;
pub def EAFNOSUPPORT = 47;
pub def EADDRINUSE = 48;
pub def EADDRNOTAVAIL = 49;
pub def ENETDOWN = 50;
pub def ENETUNREACH = 51;
pub def ENETRESET = 52;
pub def ECONNABORTED = 53;
pub def ECONNRESET = 54;
pub def ENOBUFS = 55;
pub def EISCONN = 56;
pub def ENOTCONN = 57;
pub def ESHUTDOWN = 58;
pub def ETOOMANYREFS = 59;
pub def ETIMEDOUT = 60;
pub def ECONNREFUSED = 61;
pub def ELOOP = 62;
pub def ENAMETOOLONG = 63;
pub def EHOSTDOWN = 64;
pub def EHOSTUNREACH = 65;
pub def ENOTEMPTY = 66;
pub def EPROCLIM = 67;
pub def EUSERS = 68;
pub def EDQUOT = 69;
pub def ESTALE = 70;
pub def EREMOTE = 71;
pub def EBADRPC = 72;
pub def ERPCMISMATCH = 73;
pub def EPROGUNAVAIL = 74;
pub def EPROGMISMATCH = 75;
pub def EPROCUNAVAIL = 76;
pub def ENOLCK = 77;
pub def ENOSYS = 78;
pub def EFTYPE = 79;
pub def EAUTH = 80;
pub def ENEEDAUTH = 81;
pub def EIDRM = 82;
pub def ENOMSG = 83;
pub def EOVERFLOW = 84;
pub def ECANCELED = 85;
pub def EILSEQ = 86;
pub def ENOATTR = 87;
pub def EDOOFUS = 88;
pub def EBADMSG = 89;
pub def EMULTIHOP = 90;
pub def ENOLINK = 91;
pub def EPROTO = 92;
pub def ENOMEDIUM = 93;
pub def ELAST = 99;
pub def EASYNC = 99;

pub def STDIN_FILENO = 0;
pub def STDOUT_FILENO = 1;
pub def STDERR_FILENO = 2;

pub def PROT_NONE = 0;
pub def PROT_READ = 1;
pub def PROT_WRITE = 2;
pub def PROT_EXEC = 4;

pub def MAP_FILE = 0;
pub def MAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub def MAP_ANONYMOUS = MAP_ANON;
pub def MAP_COPY = MAP_PRIVATE;
pub def MAP_SHARED = 1;
pub def MAP_PRIVATE = 2;
pub def MAP_FIXED = 16;
pub def MAP_RENAME = 32;
pub def MAP_NORESERVE = 64;
pub def MAP_INHERIT = 128;
pub def MAP_NOEXTEND = 256;
pub def MAP_HASSEMAPHORE = 512;
pub def MAP_STACK = 1024;
pub def MAP_NOSYNC = 2048;
pub def MAP_ANON = 4096;
pub def MAP_VPAGETABLE = 8192;
pub def MAP_TRYFIXED = 65536;
pub def MAP_NOCORE = 131072;
pub def MAP_SIZEALIGN = 262144;

pub def PATH_MAX = 1024;

pub def ino_t = c_ulong;

pub def Stat = extern struct {
    ino: ino_t,
    nlink: c_uint,
    dev: c_uint,
    mode: c_ushort,
    padding1: u16,
    uid: c_uint,
    gid: c_uint,
    rdev: c_uint,
    atim: timespec,
    mtim: timespec,
    ctim: timespec,
    size: c_ulong,
    blocks: i64,
    blksize: u32,
    flags: u32,
    gen: u32,
    lspare: i32,
    qspare1: i64,
    qspare2: i64,
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
    tv_sec: c_long,
    tv_nsec: c_long,
};

pub def CTL_UNSPEC = 0;
pub def CTL_KERN = 1;
pub def CTL_VM = 2;
pub def CTL_VFS = 3;
pub def CTL_NET = 4;
pub def CTL_DEBUG = 5;
pub def CTL_HW = 6;
pub def CTL_MACHDEP = 7;
pub def CTL_USER = 8;
pub def CTL_LWKT = 10;
pub def CTL_MAXID = 11;
pub def CTL_MAXNAME = 12;

pub def KERN_PROC_ALL = 0;
pub def KERN_OSTYPE = 1;
pub def KERN_PROC_PID = 1;
pub def KERN_OSRELEASE = 2;
pub def KERN_PROC_PGRP = 2;
pub def KERN_OSREV = 3;
pub def KERN_PROC_SESSION = 3;
pub def KERN_VERSION = 4;
pub def KERN_PROC_TTY = 4;
pub def KERN_MAXVNODES = 5;
pub def KERN_PROC_UID = 5;
pub def KERN_MAXPROC = 6;
pub def KERN_PROC_RUID = 6;
pub def KERN_MAXFILES = 7;
pub def KERN_PROC_ARGS = 7;
pub def KERN_ARGMAX = 8;
pub def KERN_PROC_CWD = 8;
pub def KERN_PROC_PATHNAME = 9;
pub def KERN_SECURELVL = 9;
pub def KERN_PROC_SIGTRAMP = 10;
pub def KERN_HOSTNAME = 10;
pub def KERN_HOSTID = 11;
pub def KERN_CLOCKRATE = 12;
pub def KERN_VNODE = 13;
pub def KERN_PROC = 14;
pub def KERN_FILE = 15;
pub def KERN_PROC_FLAGMASK = 16;
pub def KERN_PROF = 16;
pub def KERN_PROC_FLAG_LWP = 16;
pub def KERN_POSIX1 = 17;
pub def KERN_NGROUPS = 18;
pub def KERN_JOB_CONTROL = 19;
pub def KERN_SAVED_IDS = 20;
pub def KERN_BOOTTIME = 21;
pub def KERN_NISDOMAINNAME = 22;
pub def KERN_UPDATEINTERVAL = 23;
pub def KERN_OSRELDATE = 24;
pub def KERN_NTP_PLL = 25;
pub def KERN_BOOTFILE = 26;
pub def KERN_MAXFILESPERPROC = 27;
pub def KERN_MAXPROCPERUID = 28;
pub def KERN_DUMPDEV = 29;
pub def KERN_IPC = 30;
pub def KERN_DUMMY = 31;
pub def KERN_PS_STRINGS = 32;
pub def KERN_USRSTACK = 33;
pub def KERN_LOGSIGEXIT = 34;
pub def KERN_IOV_MAX = 35;
pub def KERN_MAXPOSIXLOCKSPERUID = 36;
pub def KERN_MAXID = 37;

pub def HOST_NAME_MAX = 255;

// access function
pub def F_OK = 0; // test for existence of file
pub def X_OK = 1; // test for execute or search permission
pub def W_OK = 2; // test for write permission
pub def R_OK = 4; // test for read permission

pub def O_RDONLY = 0;
pub def O_NDELAY = O_NONBLOCK;
pub def O_WRONLY = 1;
pub def O_RDWR = 2;
pub def O_ACCMODE = 3;
pub def O_NONBLOCK = 4;
pub def O_APPEND = 8;
pub def O_SHLOCK = 16;
pub def O_EXLOCK = 32;
pub def O_ASYNC = 64;
pub def O_FSYNC = 128;
pub def O_SYNC = 128;
pub def O_NOFOLLOW = 256;
pub def O_CREAT = 512;
pub def O_TRUNC = 1024;
pub def O_EXCL = 2048;
pub def O_NOCTTY = 32768;
pub def O_DIRECT = 65536;
pub def O_CLOEXEC = 131072;
pub def O_FBLOCKING = 262144;
pub def O_FNONBLOCKING = 524288;
pub def O_FAPPEND = 1048576;
pub def O_FOFFSET = 2097152;
pub def O_FSYNCWRITE = 4194304;
pub def O_FASYNCWRITE = 8388608;
pub def O_DIRECTORY = 134217728;

pub def SEEK_SET = 0;
pub def SEEK_CUR = 1;
pub def SEEK_END = 2;
pub def SEEK_DATA = 3;
pub def SEEK_HOLE = 4;

pub def F_ULOCK = 0;
pub def F_LOCK = 1;
pub def F_TLOCK = 2;
pub def F_TEST = 3;

pub def FD_CLOEXEC = 1;

pub def AT_FDCWD = -328243;
pub def AT_SYMLINK_NOFOLLOW = 1;
pub def AT_REMOVEDIR = 2;
pub def AT_EACCESS = 4;
pub def AT_SYMLINK_FOLLOW = 8;

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

pub def dirent = extern struct {
    d_fileno: c_ulong,
    d_namlen: u16,
    d_type: u8,
    d_unused1: u8,
    d_unused2: u32,
    d_name: [256]u8,

    pub fn reclen(self: dirent) u16 {
        return (@byteOffsetOf(dirent, "d_name") + self.d_namlen + 1 + 7) & ~@as(u16, 7);
    }
};

pub def DT_UNKNOWN = 0;
pub def DT_FIFO = 1;
pub def DT_CHR = 2;
pub def DT_DIR = 4;
pub def DT_BLK = 6;
pub def DT_REG = 8;
pub def DT_LNK = 10;
pub def DT_SOCK = 12;
pub def DT_WHT = 14;
pub def DT_DBF = 15;

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

pub def sockaddr = extern struct {
    sa_len: u8,
    sa_family: u8,
    sa_data: [14]u8,
};

pub def Kevent = extern struct {
    ident: usize,
    filter: c_short,
    flags: c_ushort,
    fflags: c_uint,
    data: isize,
    udata: usize,
};

pub def EVFILT_FS = -10;
pub def EVFILT_USER = -9;
pub def EVFILT_EXCEPT = -8;
pub def EVFILT_TIMER = -7;
pub def EVFILT_SIGNAL = -6;
pub def EVFILT_PROC = -5;
pub def EVFILT_VNODE = -4;
pub def EVFILT_AIO = -3;
pub def EVFILT_WRITE = -2;
pub def EVFILT_READ = -1;
pub def EVFILT_SYSCOUNT = 10;
pub def EVFILT_MARKER = 15;

pub def EV_ADD = 1;
pub def EV_DELETE = 2;
pub def EV_ENABLE = 4;
pub def EV_DISABLE = 8;
pub def EV_ONESHOT = 16;
pub def EV_CLEAR = 32;
pub def EV_RECEIPT = 64;
pub def EV_DISPATCH = 128;
pub def EV_NODATA = 4096;
pub def EV_FLAG1 = 8192;
pub def EV_ERROR = 16384;
pub def EV_EOF = 32768;
pub def EV_SYSFLAGS = 61440;

pub def NOTE_FFNOP = 0;
pub def NOTE_TRACK = 1;
pub def NOTE_DELETE = 1;
pub def NOTE_LOWAT = 1;
pub def NOTE_TRACKERR = 2;
pub def NOTE_OOB = 2;
pub def NOTE_WRITE = 2;
pub def NOTE_EXTEND = 4;
pub def NOTE_CHILD = 4;
pub def NOTE_ATTRIB = 8;
pub def NOTE_LINK = 16;
pub def NOTE_RENAME = 32;
pub def NOTE_REVOKE = 64;
pub def NOTE_PDATAMASK = 1048575;
pub def NOTE_FFLAGSMASK = 16777215;
pub def NOTE_TRIGGER = 16777216;
pub def NOTE_EXEC = 536870912;
pub def NOTE_FFAND = 1073741824;
pub def NOTE_FORK = 1073741824;
pub def NOTE_EXIT = 2147483648;
pub def NOTE_FFOR = 2147483648;
pub def NOTE_FFCTRLMASK = 3221225472;
pub def NOTE_FFCOPY = 3221225472;
pub def NOTE_PCTRLMASK = 4026531840;

pub def stack_t = extern struct {
    ss_sp: [*]u8,
    ss_size: isize,
    ss_flags: i32,
};

pub def S_IREAD = S_IRUSR;
pub def S_IEXEC = S_IXUSR;
pub def S_IWRITE = S_IWUSR;
pub def S_IXOTH = 1;
pub def S_IWOTH = 2;
pub def S_IROTH = 4;
pub def S_IRWXO = 7;
pub def S_IXGRP = 8;
pub def S_IWGRP = 16;
pub def S_IRGRP = 32;
pub def S_IRWXG = 56;
pub def S_IXUSR = 64;
pub def S_IWUSR = 128;
pub def S_IRUSR = 256;
pub def S_IRWXU = 448;
pub def S_ISTXT = 512;
pub def S_BLKSIZE = 512;
pub def S_ISVTX = 512;
pub def S_ISGID = 1024;
pub def S_ISUID = 2048;
pub def S_IFIFO = 4096;
pub def S_IFCHR = 8192;
pub def S_IFDIR = 16384;
pub def S_IFBLK = 24576;
pub def S_IFREG = 32768;
pub def S_IFDB = 36864;
pub def S_IFLNK = 40960;
pub def S_IFSOCK = 49152;
pub def S_IFWHT = 57344;
pub def S_IFMT = 61440;

pub def SIG_ERR = @intToPtr(extern fn (i32) void, maxInt(usize));
pub def SIG_DFL = @intToPtr(extern fn (i32) void, 0);
pub def SIG_IGN = @intToPtr(extern fn (i32) void, 1);
pub def BADSIG = SIG_ERR;
pub def SIG_BLOCK = 1;
pub def SIG_UNBLOCK = 2;
pub def SIG_SETMASK = 3;

pub def SIGIOT = SIGABRT;
pub def SIGHUP = 1;
pub def SIGINT = 2;
pub def SIGQUIT = 3;
pub def SIGILL = 4;
pub def SIGTRAP = 5;
pub def SIGABRT = 6;
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
pub def SIGCKPT = 33;
pub def SIGCKPTEXIT = 34;
pub def siginfo_t = extern struct {
    si_signo: c_int,
    si_errno: c_int,
    si_code: c_int,
    si_pid: c_int,
    si_uid: c_uint,
    si_status: c_int,
    si_addr: ?*c_void,
    si_value: union_sigval,
    si_band: c_long,
    __spare__: [7]c_int,
};
pub def sigset_t = extern struct {
    __bits: [4]c_uint,
};
pub def sig_atomic_t = c_int;
pub def Sigaction = extern struct {
    __sigaction_u: extern union {
        __sa_handler: ?extern fn (c_int) void,
        __sa_sigaction: ?extern fn (c_int, [*c]siginfo_t, ?*c_void) void,
    },
    sa_flags: c_int,
    sa_mask: sigset_t,
};
pub def sig_t = [*c]extern fn (c_int) void;

pub def sigvec = extern struct {
    sv_handler: [*c]__sighandler_t,
    sv_mask: c_int,
    sv_flags: c_int,
};

pub def SOCK_STREAM = 1;
pub def SOCK_DGRAM = 2;
pub def SOCK_RAW = 3;
pub def SOCK_RDM = 4;
pub def SOCK_SEQPACKET = 5;
pub def SOCK_MAXADDRLEN = 255;
pub def SOCK_CLOEXEC = 268435456;
pub def SOCK_NONBLOCK = 536870912;

pub def PF_INET6 = AF_INET6;
pub def PF_IMPLINK = AF_IMPLINK;
pub def PF_ROUTE = AF_ROUTE;
pub def PF_ISO = AF_ISO;
pub def PF_PIP = pseudo_AF_PIP;
pub def PF_CHAOS = AF_CHAOS;
pub def PF_DATAKIT = AF_DATAKIT;
pub def PF_INET = AF_INET;
pub def PF_APPLETALK = AF_APPLETALK;
pub def PF_SIP = AF_SIP;
pub def PF_OSI = AF_ISO;
pub def PF_CNT = AF_CNT;
pub def PF_LINK = AF_LINK;
pub def PF_HYLINK = AF_HYLINK;
pub def PF_MAX = AF_MAX;
pub def PF_KEY = pseudo_AF_KEY;
pub def PF_PUP = AF_PUP;
pub def PF_COIP = AF_COIP;
pub def PF_SNA = AF_SNA;
pub def PF_LOCAL = AF_LOCAL;
pub def PF_NETBIOS = AF_NETBIOS;
pub def PF_NATM = AF_NATM;
pub def PF_BLUETOOTH = AF_BLUETOOTH;
pub def PF_UNSPEC = AF_UNSPEC;
pub def PF_NETGRAPH = AF_NETGRAPH;
pub def PF_ECMA = AF_ECMA;
pub def PF_IPX = AF_IPX;
pub def PF_DLI = AF_DLI;
pub def PF_ATM = AF_ATM;
pub def PF_CCITT = AF_CCITT;
pub def PF_ISDN = AF_ISDN;
pub def PF_RTIP = pseudo_AF_RTIP;
pub def PF_LAT = AF_LAT;
pub def PF_UNIX = PF_LOCAL;
pub def PF_XTP = pseudo_AF_XTP;
pub def PF_DECnet = AF_DECnet;

pub def AF_UNSPEC = 0;
pub def AF_OSI = AF_ISO;
pub def AF_UNIX = AF_LOCAL;
pub def AF_LOCAL = 1;
pub def AF_INET = 2;
pub def AF_IMPLINK = 3;
pub def AF_PUP = 4;
pub def AF_CHAOS = 5;
pub def AF_NETBIOS = 6;
pub def AF_ISO = 7;
pub def AF_ECMA = 8;
pub def AF_DATAKIT = 9;
pub def AF_CCITT = 10;
pub def AF_SNA = 11;
pub def AF_DLI = 13;
pub def AF_LAT = 14;
pub def AF_HYLINK = 15;
pub def AF_APPLETALK = 16;
pub def AF_ROUTE = 17;
pub def AF_LINK = 18;
pub def AF_COIP = 20;
pub def AF_CNT = 21;
pub def AF_IPX = 23;
pub def AF_SIP = 24;
pub def AF_ISDN = 26;
pub def AF_NATM = 29;
pub def AF_ATM = 30;
pub def AF_NETGRAPH = 32;
pub def AF_BLUETOOTH = 33;
pub def AF_MPLS = 34;
pub def AF_MAX = 36;

pub def sa_family_t = u8;
pub def socklen_t = c_uint;
pub def sockaddr_storage = extern struct {
    ss_len: u8,
    ss_family: sa_family_t,
    __ss_pad1: [6]u8,
    __ss_align: i64,
    __ss_pad2: [112]u8,
};
pub def dl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};
pub def msghdr = extern struct {
    msg_name: ?*c_void,
    msg_namelen: socklen_t,
    msg_iov: [*c]iovec,
    msg_iovlen: c_int,
    msg_control: ?*c_void,
    msg_controllen: socklen_t,
    msg_flags: c_int,
};
pub def cmsghdr = extern struct {
    cmsg_len: socklen_t,
    cmsg_level: c_int,
    cmsg_type: c_int,
};
pub def cmsgcred = extern struct {
    cmcred_pid: pid_t,
    cmcred_uid: uid_t,
    cmcred_euid: uid_t,
    cmcred_gid: gid_t,
    cmcred_ngroups: c_short,
    cmcred_groups: [16]gid_t,
};
pub def sf_hdtr = extern struct {
    headers: [*c]iovec,
    hdr_cnt: c_int,
    trailers: [*c]iovec,
    trl_cnt: c_int,
};

pub def MS_SYNC = 0;
pub def MS_ASYNC = 1;
pub def MS_INVALIDATE = 2;

pub def POSIX_MADV_SEQUENTIAL = 2;
pub def POSIX_MADV_RANDOM = 1;
pub def POSIX_MADV_DONTNEED = 4;
pub def POSIX_MADV_NORMAL = 0;
pub def POSIX_MADV_WILLNEED = 3;

pub def MADV_SEQUENTIAL = 2;
pub def MADV_CONTROL_END = MADV_SETMAP;
pub def MADV_DONTNEED = 4;
pub def MADV_RANDOM = 1;
pub def MADV_WILLNEED = 3;
pub def MADV_NORMAL = 0;
pub def MADV_CONTROL_START = MADV_INVAL;
pub def MADV_FREE = 5;
pub def MADV_NOSYNC = 6;
pub def MADV_AUTOSYNC = 7;
pub def MADV_NOCORE = 8;
pub def MADV_CORE = 9;
pub def MADV_INVAL = 10;
pub def MADV_SETMAP = 11;

pub def F_DUPFD = 0;
pub def F_GETFD = 1;
pub def F_RDLCK = 1;
pub def F_SETFD = 2;
pub def F_UNLCK = 2;
pub def F_WRLCK = 3;
pub def F_GETFL = 3;
pub def F_SETFL = 4;
pub def F_GETOWN = 5;
pub def F_SETOWN = 6;
pub def F_GETLK = 7;
pub def F_SETLK = 8;
pub def F_SETLKW = 9;
pub def F_DUP2FD = 10;
pub def F_DUPFD_CLOEXEC = 17;
pub def F_DUP2FD_CLOEXEC = 18;

pub def LOCK_SH = 1;
pub def LOCK_EX = 2;
pub def LOCK_UN = 8;
pub def LOCK_NB = 4;

pub def Flock = extern struct {
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
    l_type: c_short,
    l_whence: c_short,
};
