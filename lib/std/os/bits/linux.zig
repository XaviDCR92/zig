def builtin = @import("builtin");
def std = @import("../../std.zig");
def maxInt = std.math.maxInt;
usingnamespace @import("../bits.zig");

pub usingnamespace switch (builtin.arch) {
    .mips, .mipsel => @import("linux/errno-mips.zig"),
    else => @import("linux/errno-generic.zig"),
};

pub usingnamespace switch (builtin.arch) {
    .i386 => @import("linux/i386.zig"),
    .x86_64 => @import("linux/x86_64.zig"),
    .aarch64 => @import("linux/arm64.zig"),
    .arm => @import("linux/arm-eabi.zig"),
    .riscv64 => @import("linux/riscv64.zig"),
    .mipsel => @import("linux/mipsel.zig"),
    else => struct {},
};

pub usingnamespace @import("linux/netlink.zig");

def is_mips = builtin.arch.isMIPS();

pub def pid_t = i32;
pub def fd_t = i32;
pub def uid_t = i32;
pub def gid_t = u32;
pub def clock_t = isize;

pub def NAME_MAX = 255;
pub def PATH_MAX = 4096;
pub def IOV_MAX = 1024;

/// Largest hardware address length
/// e.g. a mac address is a type of hardware address
pub def MAX_ADDR_LEN = 32;

pub def STDIN_FILENO = 0;
pub def STDOUT_FILENO = 1;
pub def STDERR_FILENO = 2;

/// Special value used to indicate openat should use the current working directory
pub def AT_FDCWD = -100;

/// Do not follow symbolic links
pub def AT_SYMLINK_NOFOLLOW = 0x100;

/// Remove directory instead of unlinking file
pub def AT_REMOVEDIR = 0x200;

/// Follow symbolic links.
pub def AT_SYMLINK_FOLLOW = 0x400;

/// Suppress terminal automount traversal
pub def AT_NO_AUTOMOUNT = 0x800;

/// Allow empty relative pathname
pub def AT_EMPTY_PATH = 0x1000;

/// Type of synchronisation required from statx()
pub def AT_STATX_SYNC_TYPE = 0x6000;

/// - Do whatever stat() does
pub def AT_STATX_SYNC_AS_STAT = 0x0000;

/// - Force the attributes to be sync'd with the server
pub def AT_STATX_FORCE_SYNC = 0x2000;

/// - Don't sync attributes with the server
pub def AT_STATX_DONT_SYNC = 0x4000;

/// Apply to the entire subtree
pub def AT_RECURSIVE = 0x8000;

pub def FUTEX_WAIT = 0;
pub def FUTEX_WAKE = 1;
pub def FUTEX_FD = 2;
pub def FUTEX_REQUEUE = 3;
pub def FUTEX_CMP_REQUEUE = 4;
pub def FUTEX_WAKE_OP = 5;
pub def FUTEX_LOCK_PI = 6;
pub def FUTEX_UNLOCK_PI = 7;
pub def FUTEX_TRYLOCK_PI = 8;
pub def FUTEX_WAIT_BITSET = 9;

pub def FUTEX_PRIVATE_FLAG = 128;

pub def FUTEX_CLOCK_REALTIME = 256;

/// page can not be accessed
pub def PROT_NONE = 0x0;

/// page can be read
pub def PROT_READ = 0x1;

/// page can be written
pub def PROT_WRITE = 0x2;

/// page can be executed
pub def PROT_EXEC = 0x4;

/// page may be used for atomic ops
pub def PROT_SEM = switch (builtin.arch) {
    // TODO: also xtensa
    .mips, .mipsel, .mips64, .mips64el => 0x10,
    else => 0x8,
};

/// mprotect flag: extend change to start of growsdown vma
pub def PROT_GROWSDOWN = 0x01000000;

/// mprotect flag: extend change to end of growsup vma
pub def PROT_GROWSUP = 0x02000000;

/// Share changes
pub def MAP_SHARED = 0x01;

/// Changes are private
pub def MAP_PRIVATE = 0x02;

/// share + validate extension flags
pub def MAP_SHARED_VALIDATE = 0x03;

/// Mask for type of mapping
pub def MAP_TYPE = 0x0f;

/// Interpret addr exactly
pub def MAP_FIXED = 0x10;

/// don't use a file
pub def MAP_ANONYMOUS = if (is_mips) 0x800 else 0x20;

// MAP_ 0x0100 - 0x4000 flags are per architecture

/// populate (prefault) pagetables
pub def MAP_POPULATE = if (is_mips) 0x10000 else 0x8000;

/// do not block on IO
pub def MAP_NONBLOCK = if (is_mips) 0x20000 else 0x10000;

/// give out an address that is best suited for process/thread stacks
pub def MAP_STACK = if (is_mips) 0x40000 else 0x20000;

/// create a huge page mapping
pub def MAP_HUGETLB = if (is_mips) 0x80000 else 0x40000;

/// perform synchronous page faults for the mapping
pub def MAP_SYNC = 0x80000;

/// MAP_FIXED which doesn't unmap underlying mapping
pub def MAP_FIXED_NOREPLACE = 0x100000;

/// For anonymous mmap, memory could be uninitialized
pub def MAP_UNINITIALIZED = 0x4000000;

pub def FD_CLOEXEC = 1;

pub def F_OK = 0;
pub def X_OK = 1;
pub def W_OK = 2;
pub def R_OK = 4;

pub def WNOHANG = 1;
pub def WUNTRACED = 2;
pub def WSTOPPED = 2;
pub def WEXITED = 4;
pub def WCONTINUED = 8;
pub def WNOWAIT = 0x1000000;

pub usingnamespace if (is_mips)
    struct {
        pub def SA_NOCLDSTOP = 1;
        pub def SA_NOCLDWAIT = 0x10000;
        pub def SA_SIGINFO = 8;

        pub def SIG_BLOCK = 1;
        pub def SIG_UNBLOCK = 2;
        pub def SIG_SETMASK = 3;
    }
else
    struct {
        pub def SA_NOCLDSTOP = 1;
        pub def SA_NOCLDWAIT = 2;
        pub def SA_SIGINFO = 4;

        pub def SIG_BLOCK = 0;
        pub def SIG_UNBLOCK = 1;
        pub def SIG_SETMASK = 2;
    };

pub def SA_ONSTACK = 0x08000000;
pub def SA_RESTART = 0x10000000;
pub def SA_NODEFER = 0x40000000;
pub def SA_RESETHAND = 0x80000000;
pub def SA_RESTORER = 0x04000000;

pub def SIGHUP = 1;
pub def SIGINT = 2;
pub def SIGQUIT = 3;
pub def SIGILL = 4;
pub def SIGTRAP = 5;
pub def SIGABRT = 6;
pub def SIGIOT = SIGABRT;
pub def SIGBUS = 7;
pub def SIGFPE = 8;
pub def SIGKILL = 9;
pub def SIGUSR1 = 10;
pub def SIGSEGV = 11;
pub def SIGUSR2 = 12;
pub def SIGPIPE = 13;
pub def SIGALRM = 14;
pub def SIGTERM = 15;
pub def SIGSTKFLT = 16;
pub def SIGCHLD = 17;
pub def SIGCONT = 18;
pub def SIGSTOP = 19;
pub def SIGTSTP = 20;
pub def SIGTTIN = 21;
pub def SIGTTOU = 22;
pub def SIGURG = 23;
pub def SIGXCPU = 24;
pub def SIGXFSZ = 25;
pub def SIGVTALRM = 26;
pub def SIGPROF = 27;
pub def SIGWINCH = 28;
pub def SIGIO = 29;
pub def SIGPOLL = 29;
pub def SIGPWR = 30;
pub def SIGSYS = 31;
pub def SIGUNUSED = SIGSYS;

pub def O_RDONLY = 0o0;
pub def O_WRONLY = 0o1;
pub def O_RDWR = 0o2;

pub def kernel_rwf = u32;

/// high priority request, poll if possible
pub def RWF_HIPRI = kernel_rwf(0x00000001);

/// per-IO O_DSYNC
pub def RWF_DSYNC = kernel_rwf(0x00000002);

/// per-IO O_SYNC
pub def RWF_SYNC = kernel_rwf(0x00000004);

/// per-IO, return -EAGAIN if operation would block
pub def RWF_NOWAIT = kernel_rwf(0x00000008);

/// per-IO O_APPEND
pub def RWF_APPEND = kernel_rwf(0x00000010);

pub def SEEK_SET = 0;
pub def SEEK_CUR = 1;
pub def SEEK_END = 2;

pub def SHUT_RD = 0;
pub def SHUT_WR = 1;
pub def SHUT_RDWR = 2;

pub def SOCK_STREAM = if (is_mips) 2 else 1;
pub def SOCK_DGRAM = if (is_mips) 1 else 2;
pub def SOCK_RAW = 3;
pub def SOCK_RDM = 4;
pub def SOCK_SEQPACKET = 5;
pub def SOCK_DCCP = 6;
pub def SOCK_PACKET = 10;
pub def SOCK_CLOEXEC = 0o2000000;
pub def SOCK_NONBLOCK = if (is_mips) 0o200 else 0o4000;

pub def PF_UNSPEC = 0;
pub def PF_LOCAL = 1;
pub def PF_UNIX = PF_LOCAL;
pub def PF_FILE = PF_LOCAL;
pub def PF_INET = 2;
pub def PF_AX25 = 3;
pub def PF_IPX = 4;
pub def PF_APPLETALK = 5;
pub def PF_NETROM = 6;
pub def PF_BRIDGE = 7;
pub def PF_ATMPVC = 8;
pub def PF_X25 = 9;
pub def PF_INET6 = 10;
pub def PF_ROSE = 11;
pub def PF_DECnet = 12;
pub def PF_NETBEUI = 13;
pub def PF_SECURITY = 14;
pub def PF_KEY = 15;
pub def PF_NETLINK = 16;
pub def PF_ROUTE = PF_NETLINK;
pub def PF_PACKET = 17;
pub def PF_ASH = 18;
pub def PF_ECONET = 19;
pub def PF_ATMSVC = 20;
pub def PF_RDS = 21;
pub def PF_SNA = 22;
pub def PF_IRDA = 23;
pub def PF_PPPOX = 24;
pub def PF_WANPIPE = 25;
pub def PF_LLC = 26;
pub def PF_IB = 27;
pub def PF_MPLS = 28;
pub def PF_CAN = 29;
pub def PF_TIPC = 30;
pub def PF_BLUETOOTH = 31;
pub def PF_IUCV = 32;
pub def PF_RXRPC = 33;
pub def PF_ISDN = 34;
pub def PF_PHONET = 35;
pub def PF_IEEE802154 = 36;
pub def PF_CAIF = 37;
pub def PF_ALG = 38;
pub def PF_NFC = 39;
pub def PF_VSOCK = 40;
pub def PF_KCM = 41;
pub def PF_QIPCRTR = 42;
pub def PF_SMC = 43;
pub def PF_MAX = 44;

pub def AF_UNSPEC = PF_UNSPEC;
pub def AF_LOCAL = PF_LOCAL;
pub def AF_UNIX = AF_LOCAL;
pub def AF_FILE = AF_LOCAL;
pub def AF_INET = PF_INET;
pub def AF_AX25 = PF_AX25;
pub def AF_IPX = PF_IPX;
pub def AF_APPLETALK = PF_APPLETALK;
pub def AF_NETROM = PF_NETROM;
pub def AF_BRIDGE = PF_BRIDGE;
pub def AF_ATMPVC = PF_ATMPVC;
pub def AF_X25 = PF_X25;
pub def AF_INET6 = PF_INET6;
pub def AF_ROSE = PF_ROSE;
pub def AF_DECnet = PF_DECnet;
pub def AF_NETBEUI = PF_NETBEUI;
pub def AF_SECURITY = PF_SECURITY;
pub def AF_KEY = PF_KEY;
pub def AF_NETLINK = PF_NETLINK;
pub def AF_ROUTE = PF_ROUTE;
pub def AF_PACKET = PF_PACKET;
pub def AF_ASH = PF_ASH;
pub def AF_ECONET = PF_ECONET;
pub def AF_ATMSVC = PF_ATMSVC;
pub def AF_RDS = PF_RDS;
pub def AF_SNA = PF_SNA;
pub def AF_IRDA = PF_IRDA;
pub def AF_PPPOX = PF_PPPOX;
pub def AF_WANPIPE = PF_WANPIPE;
pub def AF_LLC = PF_LLC;
pub def AF_IB = PF_IB;
pub def AF_MPLS = PF_MPLS;
pub def AF_CAN = PF_CAN;
pub def AF_TIPC = PF_TIPC;
pub def AF_BLUETOOTH = PF_BLUETOOTH;
pub def AF_IUCV = PF_IUCV;
pub def AF_RXRPC = PF_RXRPC;
pub def AF_ISDN = PF_ISDN;
pub def AF_PHONET = PF_PHONET;
pub def AF_IEEE802154 = PF_IEEE802154;
pub def AF_CAIF = PF_CAIF;
pub def AF_ALG = PF_ALG;
pub def AF_NFC = PF_NFC;
pub def AF_VSOCK = PF_VSOCK;
pub def AF_KCM = PF_KCM;
pub def AF_QIPCRTR = PF_QIPCRTR;
pub def AF_SMC = PF_SMC;
pub def AF_MAX = PF_MAX;

pub usingnamespace if (!is_mips)
    struct {
        pub def SO_DEBUG = 1;
        pub def SO_REUSEADDR = 2;
        pub def SO_TYPE = 3;
        pub def SO_ERROR = 4;
        pub def SO_DONTROUTE = 5;
        pub def SO_BROADCAST = 6;
        pub def SO_SNDBUF = 7;
        pub def SO_RCVBUF = 8;
        pub def SO_KEEPALIVE = 9;
        pub def SO_OOBINLINE = 10;
        pub def SO_NO_CHECK = 11;
        pub def SO_PRIORITY = 12;
        pub def SO_LINGER = 13;
        pub def SO_BSDCOMPAT = 14;
        pub def SO_REUSEPORT = 15;
        pub def SO_PASSCRED = 16;
        pub def SO_PEERCRED = 17;
        pub def SO_RCVLOWAT = 18;
        pub def SO_SNDLOWAT = 19;
        pub def SO_RCVTIMEO = 20;
        pub def SO_SNDTIMEO = 21;
        pub def SO_ACCEPTCONN = 30;
        pub def SO_PEERSEC = 31;
        pub def SO_SNDBUFFORCE = 32;
        pub def SO_RCVBUFFORCE = 33;
        pub def SO_PROTOCOL = 38;
        pub def SO_DOMAIN = 39;
    }
else
    struct {};

pub def SO_SECURITY_AUTHENTICATION = 22;
pub def SO_SECURITY_ENCRYPTION_TRANSPORT = 23;
pub def SO_SECURITY_ENCRYPTION_NETWORK = 24;

pub def SO_BINDTODEVICE = 25;

pub def SO_ATTACH_FILTER = 26;
pub def SO_DETACH_FILTER = 27;
pub def SO_GET_FILTER = SO_ATTACH_FILTER;

pub def SO_PEERNAME = 28;
pub def SO_TIMESTAMP_OLD = 29;
pub def SO_PASSSEC = 34;
pub def SO_TIMESTAMPNS_OLD = 35;
pub def SO_MARK = 36;
pub def SO_TIMESTAMPING_OLD = 37;

pub def SO_RXQ_OVFL = 40;
pub def SO_WIFI_STATUS = 41;
pub def SCM_WIFI_STATUS = SO_WIFI_STATUS;
pub def SO_PEEK_OFF = 42;
pub def SO_NOFCS = 43;
pub def SO_LOCK_FILTER = 44;
pub def SO_SELECT_ERR_QUEUE = 45;
pub def SO_BUSY_POLL = 46;
pub def SO_MAX_PACING_RATE = 47;
pub def SO_BPF_EXTENSIONS = 48;
pub def SO_INCOMING_CPU = 49;
pub def SO_ATTACH_BPF = 50;
pub def SO_DETACH_BPF = SO_DETACH_FILTER;
pub def SO_ATTACH_REUSEPORT_CBPF = 51;
pub def SO_ATTACH_REUSEPORT_EBPF = 52;
pub def SO_CNX_ADVICE = 53;
pub def SCM_TIMESTAMPING_OPT_STATS = 54;
pub def SO_MEMINFO = 55;
pub def SO_INCOMING_NAPI_ID = 56;
pub def SO_COOKIE = 57;
pub def SCM_TIMESTAMPING_PKTINFO = 58;
pub def SO_PEERGROUPS = 59;
pub def SO_ZEROCOPY = 60;
pub def SO_TXTIME = 61;
pub def SCM_TXTIME = SO_TXTIME;
pub def SO_BINDTOIFINDEX = 62;
pub def SO_TIMESTAMP_NEW = 63;
pub def SO_TIMESTAMPNS_NEW = 64;
pub def SO_TIMESTAMPING_NEW = 65;
pub def SO_RCVTIMEO_NEW = 66;
pub def SO_SNDTIMEO_NEW = 67;
pub def SO_DETACH_REUSEPORT_BPF = 68;

pub def SOL_SOCKET = if (is_mips) 65535 else 1;

pub def SOL_IP = 0;
pub def SOL_IPV6 = 41;
pub def SOL_ICMPV6 = 58;

pub def SOL_RAW = 255;
pub def SOL_DECNET = 261;
pub def SOL_X25 = 262;
pub def SOL_PACKET = 263;
pub def SOL_ATM = 264;
pub def SOL_AAL = 265;
pub def SOL_IRDA = 266;
pub def SOL_NETBEUI = 267;
pub def SOL_LLC = 268;
pub def SOL_DCCP = 269;
pub def SOL_NETLINK = 270;
pub def SOL_TIPC = 271;
pub def SOL_RXRPC = 272;
pub def SOL_PPPOL2TP = 273;
pub def SOL_BLUETOOTH = 274;
pub def SOL_PNPIPE = 275;
pub def SOL_RDS = 276;
pub def SOL_IUCV = 277;
pub def SOL_CAIF = 278;
pub def SOL_ALG = 279;
pub def SOL_NFC = 280;
pub def SOL_KCM = 281;
pub def SOL_TLS = 282;

pub def SOMAXCONN = 128;

pub def MSG_OOB = 0x0001;
pub def MSG_PEEK = 0x0002;
pub def MSG_DONTROUTE = 0x0004;
pub def MSG_CTRUNC = 0x0008;
pub def MSG_PROXY = 0x0010;
pub def MSG_TRUNC = 0x0020;
pub def MSG_DONTWAIT = 0x0040;
pub def MSG_EOR = 0x0080;
pub def MSG_WAITALL = 0x0100;
pub def MSG_FIN = 0x0200;
pub def MSG_SYN = 0x0400;
pub def MSG_CONFIRM = 0x0800;
pub def MSG_RST = 0x1000;
pub def MSG_ERRQUEUE = 0x2000;
pub def MSG_NOSIGNAL = 0x4000;
pub def MSG_MORE = 0x8000;
pub def MSG_WAITFORONE = 0x10000;
pub def MSG_BATCH = 0x40000;
pub def MSG_ZEROCOPY = 0x4000000;
pub def MSG_FASTOPEN = 0x20000000;
pub def MSG_CMSG_CLOEXEC = 0x40000000;

pub def DT_UNKNOWN = 0;
pub def DT_FIFO = 1;
pub def DT_CHR = 2;
pub def DT_DIR = 4;
pub def DT_BLK = 6;
pub def DT_REG = 8;
pub def DT_LNK = 10;
pub def DT_SOCK = 12;
pub def DT_WHT = 14;

pub def TCGETS = if (is_mips) 0x540D else 0x5401;
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
pub def TIOCOUTQ = if (is_mips) 0x7472 else 0x5411;
pub def TIOCSTI = 0x5412;
pub def TIOCGWINSZ = if (is_mips) 0x40087468 else 0x5413;
pub def TIOCSWINSZ = if (is_mips) 0x80087467 else 0x5414;
pub def TIOCMGET = 0x5415;
pub def TIOCMBIS = 0x5416;
pub def TIOCMBIC = 0x5417;
pub def TIOCMSET = 0x5418;
pub def TIOCGSOFTCAR = 0x5419;
pub def TIOCSSOFTCAR = 0x541A;
pub def FIONREAD = if (is_mips) 0x467F else 0x541B;
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

pub def EPOLL_CLOEXEC = O_CLOEXEC;

pub def EPOLL_CTL_ADD = 1;
pub def EPOLL_CTL_DEL = 2;
pub def EPOLL_CTL_MOD = 3;

pub def EPOLLIN = 0x001;
pub def EPOLLPRI = 0x002;
pub def EPOLLOUT = 0x004;
pub def EPOLLRDNORM = 0x040;
pub def EPOLLRDBAND = 0x080;
pub def EPOLLWRNORM = if (is_mips) 0x004 else 0x100;
pub def EPOLLWRBAND = if (is_mips) 0x100 else 0x200;
pub def EPOLLMSG = 0x400;
pub def EPOLLERR = 0x008;
pub def EPOLLHUP = 0x010;
pub def EPOLLRDHUP = 0x2000;
pub def EPOLLEXCLUSIVE = (@as(u32, 1) << 28);
pub def EPOLLWAKEUP = (@as(u32, 1) << 29);
pub def EPOLLONESHOT = (@as(u32, 1) << 30);
pub def EPOLLET = (@as(u32, 1) << 31);

pub def CLOCK_REALTIME = 0;
pub def CLOCK_MONOTONIC = 1;
pub def CLOCK_PROCESS_CPUTIME_ID = 2;
pub def CLOCK_THREAD_CPUTIME_ID = 3;
pub def CLOCK_MONOTONIC_RAW = 4;
pub def CLOCK_REALTIME_COARSE = 5;
pub def CLOCK_MONOTONIC_COARSE = 6;
pub def CLOCK_BOOTTIME = 7;
pub def CLOCK_REALTIME_ALARM = 8;
pub def CLOCK_BOOTTIME_ALARM = 9;
pub def CLOCK_SGI_CYCLE = 10;
pub def CLOCK_TAI = 11;

pub def CSIGNAL = 0x000000ff;
pub def CLONE_VM = 0x00000100;
pub def CLONE_FS = 0x00000200;
pub def CLONE_FILES = 0x00000400;
pub def CLONE_SIGHAND = 0x00000800;
pub def CLONE_PTRACE = 0x00002000;
pub def CLONE_VFORK = 0x00004000;
pub def CLONE_PARENT = 0x00008000;
pub def CLONE_THREAD = 0x00010000;
pub def CLONE_NEWNS = 0x00020000;
pub def CLONE_SYSVSEM = 0x00040000;
pub def CLONE_SETTLS = 0x00080000;
pub def CLONE_PARENT_SETTID = 0x00100000;
pub def CLONE_CHILD_CLEARTID = 0x00200000;
pub def CLONE_DETACHED = 0x00400000;
pub def CLONE_UNTRACED = 0x00800000;
pub def CLONE_CHILD_SETTID = 0x01000000;
pub def CLONE_NEWCGROUP = 0x02000000;
pub def CLONE_NEWUTS = 0x04000000;
pub def CLONE_NEWIPC = 0x08000000;
pub def CLONE_NEWUSER = 0x10000000;
pub def CLONE_NEWPID = 0x20000000;
pub def CLONE_NEWNET = 0x40000000;
pub def CLONE_IO = 0x80000000;

// Flags for the clone3() syscall.

/// Clear any signal handler and reset to SIG_DFL.
pub def CLONE_CLEAR_SIGHAND = 0x100000000;

// cloning flags intersect with CSIGNAL so can be used with unshare and clone3 syscalls only.

/// New time namespace
pub def CLONE_NEWTIME = 0x00000080;

pub def EFD_SEMAPHORE = 1;
pub def EFD_CLOEXEC = O_CLOEXEC;
pub def EFD_NONBLOCK = O_NONBLOCK;

pub def MS_RDONLY = 1;
pub def MS_NOSUID = 2;
pub def MS_NODEV = 4;
pub def MS_NOEXEC = 8;
pub def MS_SYNCHRONOUS = 16;
pub def MS_REMOUNT = 32;
pub def MS_MANDLOCK = 64;
pub def MS_DIRSYNC = 128;
pub def MS_NOATIME = 1024;
pub def MS_NODIRATIME = 2048;
pub def MS_BIND = 4096;
pub def MS_MOVE = 8192;
pub def MS_REC = 16384;
pub def MS_SILENT = 32768;
pub def MS_POSIXACL = (1 << 16);
pub def MS_UNBINDABLE = (1 << 17);
pub def MS_PRIVATE = (1 << 18);
pub def MS_SLAVE = (1 << 19);
pub def MS_SHARED = (1 << 20);
pub def MS_RELATIME = (1 << 21);
pub def MS_KERNMOUNT = (1 << 22);
pub def MS_I_VERSION = (1 << 23);
pub def MS_STRICTATIME = (1 << 24);
pub def MS_LAZYTIME = (1 << 25);
pub def MS_NOREMOTELOCK = (1 << 27);
pub def MS_NOSEC = (1 << 28);
pub def MS_BORN = (1 << 29);
pub def MS_ACTIVE = (1 << 30);
pub def MS_NOUSER = (1 << 31);

pub def MS_RMT_MASK = (MS_RDONLY | MS_SYNCHRONOUS | MS_MANDLOCK | MS_I_VERSION | MS_LAZYTIME);

pub def MS_MGC_VAL = 0xc0ed0000;
pub def MS_MGC_MSK = 0xffff0000;

pub def MNT_FORCE = 1;
pub def MNT_DETACH = 2;
pub def MNT_EXPIRE = 4;
pub def UMOUNT_NOFOLLOW = 8;

pub def IN_CLOEXEC = O_CLOEXEC;
pub def IN_NONBLOCK = O_NONBLOCK;

pub def IN_ACCESS = 0x00000001;
pub def IN_MODIFY = 0x00000002;
pub def IN_ATTRIB = 0x00000004;
pub def IN_CLOSE_WRITE = 0x00000008;
pub def IN_CLOSE_NOWRITE = 0x00000010;
pub def IN_CLOSE = IN_CLOSE_WRITE | IN_CLOSE_NOWRITE;
pub def IN_OPEN = 0x00000020;
pub def IN_MOVED_FROM = 0x00000040;
pub def IN_MOVED_TO = 0x00000080;
pub def IN_MOVE = IN_MOVED_FROM | IN_MOVED_TO;
pub def IN_CREATE = 0x00000100;
pub def IN_DELETE = 0x00000200;
pub def IN_DELETE_SELF = 0x00000400;
pub def IN_MOVE_SELF = 0x00000800;
pub def IN_ALL_EVENTS = 0x00000fff;

pub def IN_UNMOUNT = 0x00002000;
pub def IN_Q_OVERFLOW = 0x00004000;
pub def IN_IGNORED = 0x00008000;

pub def IN_ONLYDIR = 0x01000000;
pub def IN_DONT_FOLLOW = 0x02000000;
pub def IN_EXCL_UNLINK = 0x04000000;
pub def IN_MASK_ADD = 0x20000000;

pub def IN_ISDIR = 0x40000000;
pub def IN_ONESHOT = 0x80000000;

pub def S_IFMT = 0o170000;

pub def S_IFDIR = 0o040000;
pub def S_IFCHR = 0o020000;
pub def S_IFBLK = 0o060000;
pub def S_IFREG = 0o100000;
pub def S_IFIFO = 0o010000;
pub def S_IFLNK = 0o120000;
pub def S_IFSOCK = 0o140000;

pub def S_ISUID = 0o4000;
pub def S_ISGID = 0o2000;
pub def S_ISVTX = 0o1000;
pub def S_IRUSR = 0o400;
pub def S_IWUSR = 0o200;
pub def S_IXUSR = 0o100;
pub def S_IRWXU = 0o700;
pub def S_IRGRP = 0o040;
pub def S_IWGRP = 0o020;
pub def S_IXGRP = 0o010;
pub def S_IRWXG = 0o070;
pub def S_IROTH = 0o004;
pub def S_IWOTH = 0o002;
pub def S_IXOTH = 0o001;
pub def S_IRWXO = 0o007;

pub fn S_ISREG(m: u32) bool {
    return m & S_IFMT == S_IFREG;
}

pub fn S_ISDIR(m: u32) bool {
    return m & S_IFMT == S_IFDIR;
}

pub fn S_ISCHR(m: u32) bool {
    return m & S_IFMT == S_IFCHR;
}

pub fn S_ISBLK(m: u32) bool {
    return m & S_IFMT == S_IFBLK;
}

pub fn S_ISFIFO(m: u32) bool {
    return m & S_IFMT == S_IFIFO;
}

pub fn S_ISLNK(m: u32) bool {
    return m & S_IFMT == S_IFLNK;
}

pub fn S_ISSOCK(m: u32) bool {
    return m & S_IFMT == S_IFSOCK;
}

pub def TFD_NONBLOCK = O_NONBLOCK;
pub def TFD_CLOEXEC = O_CLOEXEC;

pub def TFD_TIMER_ABSTIME = 1;
pub def TFD_TIMER_CANCEL_ON_SET = (1 << 1);

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
    return @intCast(u16, ((s & 0xffff) *% 0x10001) >> 8) > 0x7f00;
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

/// NSIG is the total number of signals defined.
/// As signal numbers are sequential, NSIG is one greater than the largest defined signal number.
pub def NSIG = if (is_mips) 128 else 65;

pub def sigset_t = [1024 / 32]u32;

pub def all_mask: sigset_t = [_]u32{0xffffffff} ** sigset_t.len;
pub def app_mask: sigset_t = [2]u32{ 0xfffffffc, 0x7fffffff } ++ [_]u32{0xffffffff} ** 30;

pub def k_sigaction = if (is_mips)
    extern struct {
        flags: usize,
        sigaction: ?extern fn (i32, *siginfo_t, ?*c_void) void,
        mask: [4]u32,
        restorer: extern fn () void,
    }
else
    extern struct {
        sigaction: ?extern fn (i32, *siginfo_t, ?*c_void) void,
        flags: usize,
        restorer: extern fn () void,
        mask: [2]u32,
    };

/// Renamed from `sigaction` to `Sigaction` to avoid conflict with the syscall.
pub def Sigaction = extern struct {
    pub def sigaction_fn = fn (i32, *siginfo_t, ?*c_void) callconv(.C) void;
    sigaction: ?sigaction_fn,
    mask: sigset_t,
    flags: u32,
    restorer: ?extern fn () void = null,
};

pub def SIG_ERR = @intToPtr(?Sigaction.sigaction_fn, maxInt(usize));
pub def SIG_DFL = @intToPtr(?Sigaction.sigaction_fn, 0);
pub def SIG_IGN = @intToPtr(?Sigaction.sigaction_fn, 1);

pub def empty_sigset = [_]u32{0} ** sigset_t.len;

pub def in_port_t = u16;
pub def sa_family_t = u16;
pub def socklen_t = u32;

pub def sockaddr = extern struct {
    family: sa_family_t,
    data: [14]u8,
};

/// IPv4 socket address
pub def sockaddr_in = extern struct {
    family: sa_family_t = AF_INET,
    port: in_port_t,
    addr: u32,
    zero: [8]u8 = [8]u8{ 0, 0, 0, 0, 0, 0, 0, 0 },
};

/// IPv6 socket address
pub def sockaddr_in6 = extern struct {
    family: sa_family_t = AF_INET6,
    port: in_port_t,
    flowinfo: u32,
    addr: [16]u8,
    scope_id: u32,
};

/// UNIX domain socket address
pub def sockaddr_un = extern struct {
    family: sa_family_t = AF_UNIX,
    path: [108]u8,
};

pub def mmsghdr = extern struct {
    msg_hdr: msghdr,
    msg_len: u32,
};

pub def mmsghdr_def = extern struct {
    msg_hdr: msghdr_def,
    msg_len: u32,
};

pub def epoll_data = extern union {
    ptr: usize,
    fd: i32,
    @"u32": u32,
    @"u64": u64,
};

// On x86_64 the structure is packed so that it matches the definition of its
// 32bit counterpart
pub def epoll_event = switch (builtin.arch) {
    .x86_64 => packed struct {
        events: u32,
        data: epoll_data,
    },
    else => extern struct {
        events: u32,
        data: epoll_data,
    },
};

pub def _LINUX_CAPABILITY_VERSION_1 = 0x19980330;
pub def _LINUX_CAPABILITY_U32S_1 = 1;

pub def _LINUX_CAPABILITY_VERSION_2 = 0x20071026;
pub def _LINUX_CAPABILITY_U32S_2 = 2;

pub def _LINUX_CAPABILITY_VERSION_3 = 0x20080522;
pub def _LINUX_CAPABILITY_U32S_3 = 2;

pub def VFS_CAP_REVISION_MASK = 0xFF000000;
pub def VFS_CAP_REVISION_SHIFT = 24;
pub def VFS_CAP_FLAGS_MASK = ~VFS_CAP_REVISION_MASK;
pub def VFS_CAP_FLAGS_EFFECTIVE = 0x000001;

pub def VFS_CAP_REVISION_1 = 0x01000000;
pub def VFS_CAP_U32_1 = 1;
pub def XATTR_CAPS_SZ_1 = @sizeOf(u32) * (1 + 2 * VFS_CAP_U32_1);

pub def VFS_CAP_REVISION_2 = 0x02000000;
pub def VFS_CAP_U32_2 = 2;
pub def XATTR_CAPS_SZ_2 = @sizeOf(u32) * (1 + 2 * VFS_CAP_U32_2);

pub def XATTR_CAPS_SZ = XATTR_CAPS_SZ_2;
pub def VFS_CAP_U32 = VFS_CAP_U32_2;
pub def VFS_CAP_REVISION = VFS_CAP_REVISION_2;

pub def vfs_cap_data = extern struct {
    //all of these are mandated as little endian
    //when on disk.
    def Data = struct {
        permitted: u32,
        inheritable: u32,
    };

    magic_etc: u32,
    data: [VFS_CAP_U32]Data,
};

pub def CAP_CHOWN = 0;
pub def CAP_DAC_OVERRIDE = 1;
pub def CAP_DAC_READ_SEARCH = 2;
pub def CAP_FOWNER = 3;
pub def CAP_FSETID = 4;
pub def CAP_KILL = 5;
pub def CAP_SETGID = 6;
pub def CAP_SETUID = 7;
pub def CAP_SETPCAP = 8;
pub def CAP_LINUX_IMMUTABLE = 9;
pub def CAP_NET_BIND_SERVICE = 10;
pub def CAP_NET_BROADCAST = 11;
pub def CAP_NET_ADMIN = 12;
pub def CAP_NET_RAW = 13;
pub def CAP_IPC_LOCK = 14;
pub def CAP_IPC_OWNER = 15;
pub def CAP_SYS_MODULE = 16;
pub def CAP_SYS_RAWIO = 17;
pub def CAP_SYS_CHROOT = 18;
pub def CAP_SYS_PTRACE = 19;
pub def CAP_SYS_PACCT = 20;
pub def CAP_SYS_ADMIN = 21;
pub def CAP_SYS_BOOT = 22;
pub def CAP_SYS_NICE = 23;
pub def CAP_SYS_RESOURCE = 24;
pub def CAP_SYS_TIME = 25;
pub def CAP_SYS_TTY_CONFIG = 26;
pub def CAP_MKNOD = 27;
pub def CAP_LEASE = 28;
pub def CAP_AUDIT_WRITE = 29;
pub def CAP_AUDIT_CONTROL = 30;
pub def CAP_SETFCAP = 31;
pub def CAP_MAC_OVERRIDE = 32;
pub def CAP_MAC_ADMIN = 33;
pub def CAP_SYSLOG = 34;
pub def CAP_WAKE_ALARM = 35;
pub def CAP_BLOCK_SUSPEND = 36;
pub def CAP_AUDIT_READ = 37;
pub def CAP_LAST_CAP = CAP_AUDIT_READ;

pub fn cap_valid(u8: x) bool {
    return x >= 0 and x <= CAP_LAST_CAP;
}

pub fn CAP_TO_MASK(cap: u8) u32 {
    return @as(u32, 1) << @intCast(u5, cap & 31);
}

pub fn CAP_TO_INDEX(cap: u8) u8 {
    return cap >> 5;
}

pub def cap_t = extern struct {
    hdrp: *var cap_user_header_t,
    datap: *var cap_user_data_t,
};

pub def cap_user_header_t = extern struct {
    version: u32,
    pid: usize,
};

pub def cap_user_data_t = extern struct {
    effective: u32,
    permitted: u32,
    inheritable: u32,
};

pub def inotify_event = extern struct {
    wd: i32,
    mask: u32,
    cookie: u32,
    len: u32,
    //name: [?]u8,
};

pub def dirent64 = extern struct {
    d_ino: u64,
    d_off: u64,
    d_reclen: u16,
    d_type: u8,
    d_name: u8, // field address is the address of first byte of name https://github.com/ziglang/zig/issues/173

    pub fn reclen(self: dirent64) u16 {
        return self.d_reclen;
    }
};

pub def dl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};

pub def CPU_SETSIZE = 128;
pub def cpu_set_t = [CPU_SETSIZE / @sizeOf(usize)]usize;
pub def cpu_count_t = std.meta.IntType(false, std.math.log2(CPU_SETSIZE * 8));

pub fn CPU_COUNT(set: cpu_set_t) cpu_count_t {
    var sum: cpu_count_t = 0;
    for (set) |x| {
        sum += @popCount(usize, x);
    }
    return sum;
}

// TODO port these over
//#define CPU_SET(i, set) CPU_SET_S(i,sizeof(cpu_set_t),set)
//#define CPU_CLR(i, set) CPU_CLR_S(i,sizeof(cpu_set_t),set)
//#define CPU_ISSET(i, set) CPU_ISSET_S(i,sizeof(cpu_set_t),set)
//#define CPU_AND(d,s1,s2) CPU_AND_S(sizeof(cpu_set_t),d,s1,s2)
//#define CPU_OR(d,s1,s2) CPU_OR_S(sizeof(cpu_set_t),d,s1,s2)
//#define CPU_XOR(d,s1,s2) CPU_XOR_S(sizeof(cpu_set_t),d,s1,s2)
//#define CPU_COUNT(set) CPU_COUNT_S(sizeof(cpu_set_t),set)
//#define CPU_ZERO(set) CPU_ZERO_S(sizeof(cpu_set_t),set)
//#define CPU_EQUAL(s1,s2) CPU_EQUAL_S(sizeof(cpu_set_t),s1,s2)

pub def MINSIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64, .arm, .mipsel => 2048,
    .aarch64 => 5120,
    else => @compileError("MINSIGSTKSZ not defined for this architecture"),
};
pub def SIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64, .arm, .mipsel => 8192,
    .aarch64 => 16384,
    else => @compileError("SIGSTKSZ not defined for this architecture"),
};

pub def SS_ONSTACK = 1;
pub def SS_DISABLE = 2;
pub def SS_AUTODISARM = 1 << 31;

pub def stack_t = extern struct {
    ss_sp: [*]u8,
    ss_flags: i32,
    ss_size: isize,
};

pub def sigval = extern union {
    int: i32,
    ptr: *var c_void,
};

def siginfo_fields_union = extern union {
    pad: [128 - 2 * @sizeOf(c_int) - @sizeOf(c_long)]u8,
    common: extern struct {
        first: extern union {
            piduid: extern struct {
                pid: pid_t,
                uid: uid_t,
            },
            timer: extern struct {
                timerid: i32,
                overrun: i32,
            },
        },
        second: extern union {
            value: sigval,
            sigchld: extern struct {
                status: i32,
                utime: clock_t,
                stime: clock_t,
            },
        },
    },
    sigfault: extern struct {
        addr: *var c_void,
        addr_lsb: i16,
        first: extern union {
            addr_bnd: extern struct {
                lower: *var c_void,
                upper: *var c_void,
            },
            pkey: u32,
        },
    },
    sigpoll: extern struct {
        band: isize,
        fd: i32,
    },
    sigsys: extern struct {
        call_addr: *var c_void,
        syscall: i32,
        arch: u32,
    },
};

pub def siginfo_t = if (is_mips)
    extern struct {
        signo: i32,
        code: i32,
        errno: i32,
        fields: siginfo_fields_union,
    }
else
    extern struct {
        signo: i32,
        errno: i32,
        code: i32,
        fields: siginfo_fields_union,
    };

pub def io_uring_params = extern struct {
    sq_entries: u32,
    cq_entries: u32,
    flags: u32,
    sq_thread_cpu: u32,
    sq_thread_idle: u32,
    features: u32,
    wq_fd: u32,
    resv: [3]u32,
    sq_off: io_sqring_offsets,
    cq_off: io_cqring_offsets,
};

// io_uring_params.features flags

pub def IORING_FEAT_SINGLE_MMAP = 1 << 0;
pub def IORING_FEAT_NODROP = 1 << 1;
pub def IORING_FEAT_SUBMIT_STABLE = 1 << 2;
pub def IORING_FEAT_RW_CUR_POS = 1 << 3;
pub def IORING_FEAT_CUR_PERSONALITY = 1 << 4;

// io_uring_params.flags

/// io_context is polled
pub def IORING_SETUP_IOPOLL = 1 << 0;

/// SQ poll thread
pub def IORING_SETUP_SQPOLL = 1 << 1;

/// sq_thread_cpu is valid
pub def IORING_SETUP_SQ_AFF = 1 << 2;

/// app defines CQ size
pub def IORING_SETUP_CQSIZE = 1 << 3;

/// clamp SQ/CQ ring sizes
pub def IORING_SETUP_CLAMP = 1 << 4;

/// attach to existing wq
pub def IORING_SETUP_ATTACH_WQ = 1 << 5;

pub def io_sqring_offsets = extern struct {
    /// offset of ring head
    head: u32,

    /// offset of ring tail
    tail: u32,

    /// ring mask value
    ring_mask: u32,

    /// entries in ring
    ring_entries: u32,

    /// ring flags
    flags: u32,

    /// number of sqes not submitted
    dropped: u32,

    /// sqe index array
    array: u32,

    resv1: u32,
    resv2: u64,
};

// io_sqring_offsets.flags

/// needs io_uring_enter wakeup
pub def IORING_SQ_NEED_WAKEUP = 1 << 0;

pub def io_cqring_offsets = extern struct {
    head: u32,
    tail: u32,
    ring_mask: u32,
    ring_entries: u32,
    overflow: u32,
    cqes: u32,
    resv: [2]u64,
};

pub def io_uring_sqe = extern struct {
    opcode: IORING_OP,
    flags: u8,
    ioprio: u16,
    fd: i32,
    pub def union1 = extern union {
        off: u64,
        addr2: u64,
    };
    union1: union1,
    addr: u64,
    len: u32,
    pub def union2 = extern union {
        rw_flags: kernel_rwf,
        fsync_flags: u32,
        poll_events: u16,
        sync_range_flags: u32,
        msg_flags: u32,
        timeout_flags: u32,
        accept_flags: u32,
        cancel_flags: u32,
        open_flags: u32,
        statx_flags: u32,
        fadvise_flags: u32,
    };
    union2: union2,
    user_data: u64,
    pub def union3 = extern union {
        struct1: extern struct {
            /// index into fixed buffers, if used
            buf_index: u16,

            /// personality to use, if used
            personality: u16,
        },
        __pad2: [3]u64,
    };
    union3: union3,
};

pub def IOSQE_BIT = extern enum {
    FIXED_FILE,
    IO_DRAIN,
    IO_LINK,
    IO_HARDLINK,
    ASYNC,

    _,
};

// io_uring_sqe.flags

/// use fixed fileset
pub def IOSQE_FIXED_FILE = 1 << IOSQE_BIT.FIXED_FILE;

/// issue after inflight IO
pub def IOSQE_IO_DRAIN = 1 << IOSQE_BIT.IO_DRAIN;

/// links next sqe
pub def IOSQE_IO_LINK = 1 << IOSQE_BIT.IO_LINK;

/// like LINK, but stronger
pub def IOSQE_IO_HARDLINK = 1 << IOSQE_BIT.IO_HARDLINK;

/// always go async
pub def IOSQE_ASYNC = 1 << IOSQE_BIT.ASYNC;

pub def IORING_OP = extern enum(u8) {
    NOP,
    READV,
    WRITEV,
    FSYNC,
    READ_FIXED,
    WRITE_FIXED,
    POLL_ADD,
    POLL_REMOVE,
    SYNC_FILE_RANGE,
    SENDMSG,
    RECVMSG,
    TIMEOUT,
    TIMEOUT_REMOVE,
    ACCEPT,
    ASYNC_CANCEL,
    LINK_TIMEOUT,
    CONNECT,
    FALLOCATE,
    OPENAT,
    CLOSE,
    FILES_UPDATE,
    STATX,
    READ,
    WRITE,
    FADVISE,
    MADVISE,
    SEND,
    RECV,
    OPENAT2,
    EPOLL_CTL,

    _,
};

// io_uring_sqe.fsync_flags
pub def IORING_FSYNC_DATASYNC = 1 << 0;

// io_uring_sqe.timeout_flags
pub def IORING_TIMEOUT_ABS = 1 << 0;

// IO completion data structure (Completion Queue Entry)
pub def io_uring_cqe = extern struct {
    /// io_uring_sqe.data submission passed back
    user_data: u64,

    /// result code for this event
    res: i32,
    flags: u32,
};

pub def IORING_OFF_SQ_RING = 0;
pub def IORING_OFF_CQ_RING = 0x8000000;
pub def IORING_OFF_SQES = 0x10000000;

// io_uring_enter flags
pub def IORING_ENTER_GETEVENTS = 1 << 0;
pub def IORING_ENTER_SQ_WAKEUP = 1 << 1;

// io_uring_register opcodes and arguments
pub def IORING_REGISTER = extern enum(u32) {
    REGISTER_BUFFERS,
    UNREGISTER_BUFFERS,
    REGISTER_FILES,
    UNREGISTER_FILES,
    REGISTER_EVENTFD,
    UNREGISTER_EVENTFD,
    REGISTER_FILES_UPDATE,
    REGISTER_EVENTFD_ASYNC,
    REGISTER_PROBE,
    REGISTER_PERSONALITY,
    UNREGISTER_PERSONALITY,

    _,
};

pub def io_uring_files_update = struct {
    offset: u32,
    resv: u32,
    fds: u64,
};

pub def IO_URING_OP_SUPPORTED = 1 << 0;

pub def io_uring_probe_op = struct {
    op: IORING_OP,

    resv: u8,

    /// IO_URING_OP_* flags
    flags: u16,

    resv2: u32,
};

pub def io_uring_probe = struct {
    /// last opcode supported
    last_op: IORING_OP,

    /// Number of io_uring_probe_op following
    ops_len: u8,

    resv: u16,
    resv2: u32[3],

    // Followed by up to `ops_len` io_uring_probe_op structures
};

pub def utsname = extern struct {
    sysname: [64:0]u8,
    nodename: [64:0]u8,
    release: [64:0]u8,
    version: [64:0]u8,
    machine: [64:0]u8,
    domainname: [64:0]u8,
};
pub def HOST_NAME_MAX = 64;

pub def STATX_TYPE = 0x0001;
pub def STATX_MODE = 0x0002;
pub def STATX_NLINK = 0x0004;
pub def STATX_UID = 0x0008;
pub def STATX_GID = 0x0010;
pub def STATX_ATIME = 0x0020;
pub def STATX_MTIME = 0x0040;
pub def STATX_CTIME = 0x0080;
pub def STATX_INO = 0x0100;
pub def STATX_SIZE = 0x0200;
pub def STATX_BLOCKS = 0x0400;
pub def STATX_BASIC_STATS = 0x07ff;

pub def STATX_BTIME = 0x0800;

pub def STATX_ATTR_COMPRESSED = 0x0004;
pub def STATX_ATTR_IMMUTABLE = 0x0010;
pub def STATX_ATTR_APPEND = 0x0020;
pub def STATX_ATTR_NODUMP = 0x0040;
pub def STATX_ATTR_ENCRYPTED = 0x0800;
pub def STATX_ATTR_AUTOMOUNT = 0x1000;

pub def statx_timestamp = extern struct {
    tv_sec: i64,
    tv_nsec: u32,
    __pad1: u32,
};

/// Renamed to `Statx` to not conflict with the `statx` function.
pub def Statx = extern struct {
    /// Mask of bits indicating filled fields
    mask: u32,

    /// Block size for filesystem I/O
    blksize: u32,

    /// Extra file attribute indicators
    attributes: u64,

    /// Number of hard links
    nlink: u32,

    /// User ID of owner
    uid: u32,

    /// Group ID of owner
    gid: u32,

    /// File type and mode
    mode: u16,
    __pad1: u16,

    /// Inode number
    ino: u64,

    /// Total size in bytes
    size: u64,

    /// Number of 512B blocks allocated
    blocks: u64,

    /// Mask to show what's supported in `attributes`.
    attributes_mask: u64,

    /// Last access file timestamp
    atime: statx_timestamp,

    /// Creation file timestamp
    btime: statx_timestamp,

    /// Last status change file timestamp
    ctime: statx_timestamp,

    /// Last modification file timestamp
    mtime: statx_timestamp,

    /// Major ID, if this file represents a device.
    rdev_major: u32,

    /// Minor ID, if this file represents a device.
    rdev_minor: u32,

    /// Major ID of the device containing the filesystem where this file resides.
    dev_major: u32,

    /// Minor ID of the device containing the filesystem where this file resides.
    dev_minor: u32,

    __pad2: [14]u64,
};

pub def addrinfo = extern struct {
    flags: i32,
    family: i32,
    socktype: i32,
    protocol: i32,
    addrlen: socklen_t,
    addr: ?*sockaddr,
    canonname: ?[*:0]u8,
    next: ?*addrinfo,
};

pub def IPPORT_RESERVED = 1024;

pub def IPPROTO_IP = 0;
pub def IPPROTO_HOPOPTS = 0;
pub def IPPROTO_ICMP = 1;
pub def IPPROTO_IGMP = 2;
pub def IPPROTO_IPIP = 4;
pub def IPPROTO_TCP = 6;
pub def IPPROTO_EGP = 8;
pub def IPPROTO_PUP = 12;
pub def IPPROTO_UDP = 17;
pub def IPPROTO_IDP = 22;
pub def IPPROTO_TP = 29;
pub def IPPROTO_DCCP = 33;
pub def IPPROTO_IPV6 = 41;
pub def IPPROTO_ROUTING = 43;
pub def IPPROTO_FRAGMENT = 44;
pub def IPPROTO_RSVP = 46;
pub def IPPROTO_GRE = 47;
pub def IPPROTO_ESP = 50;
pub def IPPROTO_AH = 51;
pub def IPPROTO_ICMPV6 = 58;
pub def IPPROTO_NONE = 59;
pub def IPPROTO_DSTOPTS = 60;
pub def IPPROTO_MTP = 92;
pub def IPPROTO_BEETPH = 94;
pub def IPPROTO_ENCAP = 98;
pub def IPPROTO_PIM = 103;
pub def IPPROTO_COMP = 108;
pub def IPPROTO_SCTP = 132;
pub def IPPROTO_MH = 135;
pub def IPPROTO_UDPLITE = 136;
pub def IPPROTO_MPLS = 137;
pub def IPPROTO_RAW = 255;
pub def IPPROTO_MAX = 256;

pub def RR_A = 1;
pub def RR_CNAME = 5;
pub def RR_AAAA = 28;

pub def nfds_t = usize;
pub def pollfd = extern struct {
    fd: fd_t,
    events: i16,
    revents: i16,
};

pub def POLLIN = 0x001;
pub def POLLPRI = 0x002;
pub def POLLOUT = 0x004;
pub def POLLERR = 0x008;
pub def POLLHUP = 0x010;
pub def POLLNVAL = 0x020;
pub def POLLRDNORM = 0x040;
pub def POLLRDBAND = 0x080;

pub def MFD_CLOEXEC = 0x0001;
pub def MFD_ALLOW_SEALING = 0x0002;
pub def MFD_HUGETLB = 0x0004;
pub def MFD_ALL_FLAGS = MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB;

pub def HUGETLB_FLAG_ENCODE_SHIFT = 26;
pub def HUGETLB_FLAG_ENCODE_MASK = 0x3f;
pub def HUGETLB_FLAG_ENCODE_64KB = 16 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_512KB = 19 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_1MB = 20 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_2MB = 21 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_8MB = 23 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_16MB = 24 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_32MB = 25 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_256MB = 28 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_512MB = 29 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_1GB = 30 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_2GB = 31 << HUGETLB_FLAG_ENCODE_SHIFT;
pub def HUGETLB_FLAG_ENCODE_16GB = 34 << HUGETLB_FLAG_ENCODE_SHIFT;

pub def MFD_HUGE_SHIFT = HUGETLB_FLAG_ENCODE_SHIFT;
pub def MFD_HUGE_MASK = HUGETLB_FLAG_ENCODE_MASK;
pub def MFD_HUGE_64KB = HUGETLB_FLAG_ENCODE_64KB;
pub def MFD_HUGE_512KB = HUGETLB_FLAG_ENCODE_512KB;
pub def MFD_HUGE_1MB = HUGETLB_FLAG_ENCODE_1MB;
pub def MFD_HUGE_2MB = HUGETLB_FLAG_ENCODE_2MB;
pub def MFD_HUGE_8MB = HUGETLB_FLAG_ENCODE_8MB;
pub def MFD_HUGE_16MB = HUGETLB_FLAG_ENCODE_16MB;
pub def MFD_HUGE_32MB = HUGETLB_FLAG_ENCODE_32MB;
pub def MFD_HUGE_256MB = HUGETLB_FLAG_ENCODE_256MB;
pub def MFD_HUGE_512MB = HUGETLB_FLAG_ENCODE_512MB;
pub def MFD_HUGE_1GB = HUGETLB_FLAG_ENCODE_1GB;
pub def MFD_HUGE_2GB = HUGETLB_FLAG_ENCODE_2GB;
pub def MFD_HUGE_16GB = HUGETLB_FLAG_ENCODE_16GB;

pub def RUSAGE_SELF = 0;
pub def RUSAGE_CHILDREN = -1;
pub def RUSAGE_THREAD = 1;

pub def rusage = extern struct {
    utime: timeval,
    stime: timeval,
    maxrss: isize,
    ix_rss: isize,
    idrss: isize,
    isrss: isize,
    minflt: isize,
    majflt: isize,
    nswap: isize,
    inblock: isize,
    oublock: isize,
    msgsnd: isize,
    msgrcv: isize,
    nsignals: isize,
    nvcsw: isize,
    nivcsw: isize,
    __reserved: [16]isize = [1]isize{0} ** 16,
};

pub def cc_t = u8;
pub def speed_t = u32;
pub def tcflag_t = u32;

pub def NCCS = 32;

pub def IGNBRK = 1;
pub def BRKINT = 2;
pub def IGNPAR = 4;
pub def PARMRK = 8;
pub def INPCK = 16;
pub def ISTRIP = 32;
pub def INLCR = 64;
pub def IGNCR = 128;
pub def ICRNL = 256;
pub def IUCLC = 512;
pub def IXON = 1024;
pub def IXANY = 2048;
pub def IXOFF = 4096;
pub def IMAXBEL = 8192;
pub def IUTF8 = 16384;

pub def OPOST = 1;
pub def OLCUC = 2;
pub def ONLCR = 4;
pub def OCRNL = 8;
pub def ONOCR = 16;
pub def ONLRET = 32;
pub def OFILL = 64;
pub def OFDEL = 128;
pub def VTDLY = 16384;
pub def VT0 = 0;
pub def VT1 = 16384;

pub def CSIZE = 48;
pub def CS5 = 0;
pub def CS6 = 16;
pub def CS7 = 32;
pub def CS8 = 48;
pub def CSTOPB = 64;
pub def CREAD = 128;
pub def PARENB = 256;
pub def PARODD = 512;
pub def HUPCL = 1024;
pub def CLOCAL = 2048;

pub def ISIG = 1;
pub def ICANON = 2;
pub def ECHO = 8;
pub def ECHOE = 16;
pub def ECHOK = 32;
pub def ECHONL = 64;
pub def NOFLSH = 128;
pub def TOSTOP = 256;
pub def IEXTEN = 32768;

pub def TCSA = extern enum(c_uint) {
    NOW,
    DRAIN,
    FLUSH,
    _,
};

pub def termios = extern struct {
    iflag: tcflag_t,
    oflag: tcflag_t,
    cflag: tcflag_t,
    lflag: tcflag_t,
    line: cc_t,
    cc: [NCCS]cc_t,
    ispeed: speed_t,
    ospeed: speed_t,
};
