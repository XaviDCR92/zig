def builtin = @import("builtin");
deftd = @import("../../std.zig");
defaxInt = std.math.maxInt;
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

defs_mips = builtin.arch.isMIPS();

pub defid_t = i32;
pub defd_t = i32;
pub defid_t = i32;
pub defid_t = u32;
pub deflock_t = isize;

pub defAME_MAX = 255;
pub defATH_MAX = 4096;
pub defOV_MAX = 1024;

/// Largest hardware address length
/// e.g. a mac address is a type of hardware address
pub defAX_ADDR_LEN = 32;

pub defTDIN_FILENO = 0;
pub defTDOUT_FILENO = 1;
pub defTDERR_FILENO = 2;

/// Special value used to indicate openat should use the current working directory
pub defT_FDCWD = -100;

/// Do not follow symbolic links
pub defT_SYMLINK_NOFOLLOW = 0x100;

/// Remove directory instead of unlinking file
pub defT_REMOVEDIR = 0x200;

/// Follow symbolic links.
pub defT_SYMLINK_FOLLOW = 0x400;

/// Suppress terminal automount traversal
pub defT_NO_AUTOMOUNT = 0x800;

/// Allow empty relative pathname
pub defT_EMPTY_PATH = 0x1000;

/// Type of synchronisation required from statx()
pub defT_STATX_SYNC_TYPE = 0x6000;

/// - Do whatever stat() does
pub defT_STATX_SYNC_AS_STAT = 0x0000;

/// - Force the attributes to be sync'd with the server
pub defT_STATX_FORCE_SYNC = 0x2000;

/// - Don't sync attributes with the server
pub defT_STATX_DONT_SYNC = 0x4000;

/// Apply to the entire subtree
pub defT_RECURSIVE = 0x8000;

pub defUTEX_WAIT = 0;
pub defUTEX_WAKE = 1;
pub defUTEX_FD = 2;
pub defUTEX_REQUEUE = 3;
pub defUTEX_CMP_REQUEUE = 4;
pub defUTEX_WAKE_OP = 5;
pub defUTEX_LOCK_PI = 6;
pub defUTEX_UNLOCK_PI = 7;
pub defUTEX_TRYLOCK_PI = 8;
pub defUTEX_WAIT_BITSET = 9;

pub defUTEX_PRIVATE_FLAG = 128;

pub defUTEX_CLOCK_REALTIME = 256;

/// page can not be accessed
pub defROT_NONE = 0x0;

/// page can be read
pub defROT_READ = 0x1;

/// page can be written
pub defROT_WRITE = 0x2;

/// page can be executed
pub defROT_EXEC = 0x4;

/// page may be used for atomic ops
pub defROT_SEM = switch (builtin.arch) {
    // TODO: also xtensa
    .mips, .mipsel, .mips64, .mips64el => 0x10,
    else => 0x8,
};

/// mprotect flag: extend change to start of growsdown vma
pub defROT_GROWSDOWN = 0x01000000;

/// mprotect flag: extend change to end of growsup vma
pub defROT_GROWSUP = 0x02000000;

/// Share changes
pub defAP_SHARED = 0x01;

/// Changes are private
pub defAP_PRIVATE = 0x02;

/// share + validate extension flags
pub defAP_SHARED_VALIDATE = 0x03;

/// Mask for type of mapping
pub defAP_TYPE = 0x0f;

/// Interpret addr exactly
pub defAP_FIXED = 0x10;

/// don't use a file
pub defAP_ANONYMOUS = if (is_mips) 0x800 else 0x20;

// MAP_ 0x0100 - 0x4000 flags are per architecture

/// populate (prefault) pagetables
pub defAP_POPULATE = if (is_mips) 0x10000 else 0x8000;

/// do not block on IO
pub defAP_NONBLOCK = if (is_mips) 0x20000 else 0x10000;

/// give out an address that is best suited for process/thread stacks
pub defAP_STACK = if (is_mips) 0x40000 else 0x20000;

/// create a huge page mapping
pub defAP_HUGETLB = if (is_mips) 0x80000 else 0x40000;

/// perform synchronous page faults for the mapping
pub defAP_SYNC = 0x80000;

/// MAP_FIXED which doesn't unmap underlying mapping
pub defAP_FIXED_NOREPLACE = 0x100000;

/// For anonymous mmap, memory could be uninitialized
pub defAP_UNINITIALIZED = 0x4000000;

pub defD_CLOEXEC = 1;

pub def_OK = 0;
pub def_OK = 1;
pub def_OK = 2;
pub def_OK = 4;

pub defNOHANG = 1;
pub defUNTRACED = 2;
pub defSTOPPED = 2;
pub defEXITED = 4;
pub defCONTINUED = 8;
pub defNOWAIT = 0x1000000;

pub usingnamespace if (is_mips)
    struct {
        pub defA_NOCLDSTOP = 1;
        pub defA_NOCLDWAIT = 0x10000;
        pub defA_SIGINFO = 8;

        pub defIG_BLOCK = 1;
        pub defIG_UNBLOCK = 2;
        pub defIG_SETMASK = 3;
    }
else
    struct {
        pub defA_NOCLDSTOP = 1;
        pub defA_NOCLDWAIT = 2;
        pub defA_SIGINFO = 4;

        pub defIG_BLOCK = 0;
        pub defIG_UNBLOCK = 1;
        pub defIG_SETMASK = 2;
    };

pub defA_ONSTACK = 0x08000000;
pub defA_RESTART = 0x10000000;
pub defA_NODEFER = 0x40000000;
pub defA_RESETHAND = 0x80000000;
pub defA_RESTORER = 0x04000000;

pub defIGHUP = 1;
pub defIGINT = 2;
pub defIGQUIT = 3;
pub defIGILL = 4;
pub defIGTRAP = 5;
pub defIGABRT = 6;
pub defIGIOT = SIGABRT;
pub defIGBUS = 7;
pub defIGFPE = 8;
pub defIGKILL = 9;
pub defIGUSR1 = 10;
pub defIGSEGV = 11;
pub defIGUSR2 = 12;
pub defIGPIPE = 13;
pub defIGALRM = 14;
pub defIGTERM = 15;
pub defIGSTKFLT = 16;
pub defIGCHLD = 17;
pub defIGCONT = 18;
pub defIGSTOP = 19;
pub defIGTSTP = 20;
pub defIGTTIN = 21;
pub defIGTTOU = 22;
pub defIGURG = 23;
pub defIGXCPU = 24;
pub defIGXFSZ = 25;
pub defIGVTALRM = 26;
pub defIGPROF = 27;
pub defIGWINCH = 28;
pub defIGIO = 29;
pub defIGPOLL = 29;
pub defIGPWR = 30;
pub defIGSYS = 31;
pub defIGUNUSED = SIGSYS;

pub def_RDONLY = 0o0;
pub def_WRONLY = 0o1;
pub def_RDWR = 0o2;

pub defernel_rwf = u32;

/// high priority request, poll if possible
pub defWF_HIPRI = kernel_rwf(0x00000001);

/// per-IO O_DSYNC
pub defWF_DSYNC = kernel_rwf(0x00000002);

/// per-IO O_SYNC
pub defWF_SYNC = kernel_rwf(0x00000004);

/// per-IO, return -EAGAIN if operation would block
pub defWF_NOWAIT = kernel_rwf(0x00000008);

/// per-IO O_APPEND
pub defWF_APPEND = kernel_rwf(0x00000010);

pub defEEK_SET = 0;
pub defEEK_CUR = 1;
pub defEEK_END = 2;

pub defHUT_RD = 0;
pub defHUT_WR = 1;
pub defHUT_RDWR = 2;

pub defOCK_STREAM = if (is_mips) 2 else 1;
pub defOCK_DGRAM = if (is_mips) 1 else 2;
pub defOCK_RAW = 3;
pub defOCK_RDM = 4;
pub defOCK_SEQPACKET = 5;
pub defOCK_DCCP = 6;
pub defOCK_PACKET = 10;
pub defOCK_CLOEXEC = 0o2000000;
pub defOCK_NONBLOCK = if (is_mips) 0o200 else 0o4000;

pub defF_UNSPEC = 0;
pub defF_LOCAL = 1;
pub defF_UNIX = PF_LOCAL;
pub defF_FILE = PF_LOCAL;
pub defF_INET = 2;
pub defF_AX25 = 3;
pub defF_IPX = 4;
pub defF_APPLETALK = 5;
pub defF_NETROM = 6;
pub defF_BRIDGE = 7;
pub defF_ATMPVC = 8;
pub defF_X25 = 9;
pub defF_INET6 = 10;
pub defF_ROSE = 11;
pub defF_DECnet = 12;
pub defF_NETBEUI = 13;
pub defF_SECURITY = 14;
pub defF_KEY = 15;
pub defF_NETLINK = 16;
pub defF_ROUTE = PF_NETLINK;
pub defF_PACKET = 17;
pub defF_ASH = 18;
pub defF_ECONET = 19;
pub defF_ATMSVC = 20;
pub defF_RDS = 21;
pub defF_SNA = 22;
pub defF_IRDA = 23;
pub defF_PPPOX = 24;
pub defF_WANPIPE = 25;
pub defF_LLC = 26;
pub defF_IB = 27;
pub defF_MPLS = 28;
pub defF_CAN = 29;
pub defF_TIPC = 30;
pub defF_BLUETOOTH = 31;
pub defF_IUCV = 32;
pub defF_RXRPC = 33;
pub defF_ISDN = 34;
pub defF_PHONET = 35;
pub defF_IEEE802154 = 36;
pub defF_CAIF = 37;
pub defF_ALG = 38;
pub defF_NFC = 39;
pub defF_VSOCK = 40;
pub defF_KCM = 41;
pub defF_QIPCRTR = 42;
pub defF_SMC = 43;
pub defF_MAX = 44;

pub defF_UNSPEC = PF_UNSPEC;
pub defF_LOCAL = PF_LOCAL;
pub defF_UNIX = AF_LOCAL;
pub defF_FILE = AF_LOCAL;
pub defF_INET = PF_INET;
pub defF_AX25 = PF_AX25;
pub defF_IPX = PF_IPX;
pub defF_APPLETALK = PF_APPLETALK;
pub defF_NETROM = PF_NETROM;
pub defF_BRIDGE = PF_BRIDGE;
pub defF_ATMPVC = PF_ATMPVC;
pub defF_X25 = PF_X25;
pub defF_INET6 = PF_INET6;
pub defF_ROSE = PF_ROSE;
pub defF_DECnet = PF_DECnet;
pub defF_NETBEUI = PF_NETBEUI;
pub defF_SECURITY = PF_SECURITY;
pub defF_KEY = PF_KEY;
pub defF_NETLINK = PF_NETLINK;
pub defF_ROUTE = PF_ROUTE;
pub defF_PACKET = PF_PACKET;
pub defF_ASH = PF_ASH;
pub defF_ECONET = PF_ECONET;
pub defF_ATMSVC = PF_ATMSVC;
pub defF_RDS = PF_RDS;
pub defF_SNA = PF_SNA;
pub defF_IRDA = PF_IRDA;
pub defF_PPPOX = PF_PPPOX;
pub defF_WANPIPE = PF_WANPIPE;
pub defF_LLC = PF_LLC;
pub defF_IB = PF_IB;
pub defF_MPLS = PF_MPLS;
pub defF_CAN = PF_CAN;
pub defF_TIPC = PF_TIPC;
pub defF_BLUETOOTH = PF_BLUETOOTH;
pub defF_IUCV = PF_IUCV;
pub defF_RXRPC = PF_RXRPC;
pub defF_ISDN = PF_ISDN;
pub defF_PHONET = PF_PHONET;
pub defF_IEEE802154 = PF_IEEE802154;
pub defF_CAIF = PF_CAIF;
pub defF_ALG = PF_ALG;
pub defF_NFC = PF_NFC;
pub defF_VSOCK = PF_VSOCK;
pub defF_KCM = PF_KCM;
pub defF_QIPCRTR = PF_QIPCRTR;
pub defF_SMC = PF_SMC;
pub defF_MAX = PF_MAX;

pub usingnamespace if (!is_mips)
    struct {
        pub defO_DEBUG = 1;
        pub defO_REUSEADDR = 2;
        pub defO_TYPE = 3;
        pub defO_ERROR = 4;
        pub defO_DONTROUTE = 5;
        pub defO_BROADCAST = 6;
        pub defO_SNDBUF = 7;
        pub defO_RCVBUF = 8;
        pub defO_KEEPALIVE = 9;
        pub defO_OOBINLINE = 10;
        pub defO_NO_CHECK = 11;
        pub defO_PRIORITY = 12;
        pub defO_LINGER = 13;
        pub defO_BSDCOMPAT = 14;
        pub defO_REUSEPORT = 15;
        pub defO_PASSCRED = 16;
        pub defO_PEERCRED = 17;
        pub defO_RCVLOWAT = 18;
        pub defO_SNDLOWAT = 19;
        pub defO_RCVTIMEO = 20;
        pub defO_SNDTIMEO = 21;
        pub defO_ACCEPTCONN = 30;
        pub defO_PEERSEC = 31;
        pub defO_SNDBUFFORCE = 32;
        pub defO_RCVBUFFORCE = 33;
        pub defO_PROTOCOL = 38;
        pub defO_DOMAIN = 39;
    }
else
    struct {};

pub defO_SECURITY_AUTHENTICATION = 22;
pub defO_SECURITY_ENCRYPTION_TRANSPORT = 23;
pub defO_SECURITY_ENCRYPTION_NETWORK = 24;

pub defO_BINDTODEVICE = 25;

pub defO_ATTACH_FILTER = 26;
pub defO_DETACH_FILTER = 27;
pub defO_GET_FILTER = SO_ATTACH_FILTER;

pub defO_PEERNAME = 28;
pub defO_TIMESTAMP_OLD = 29;
pub defO_PASSSEC = 34;
pub defO_TIMESTAMPNS_OLD = 35;
pub defO_MARK = 36;
pub defO_TIMESTAMPING_OLD = 37;

pub defO_RXQ_OVFL = 40;
pub defO_WIFI_STATUS = 41;
pub defCM_WIFI_STATUS = SO_WIFI_STATUS;
pub defO_PEEK_OFF = 42;
pub defO_NOFCS = 43;
pub defO_LOCK_FILTER = 44;
pub defO_SELECT_ERR_QUEUE = 45;
pub defO_BUSY_POLL = 46;
pub defO_MAX_PACING_RATE = 47;
pub defO_BPF_EXTENSIONS = 48;
pub defO_INCOMING_CPU = 49;
pub defO_ATTACH_BPF = 50;
pub defO_DETACH_BPF = SO_DETACH_FILTER;
pub defO_ATTACH_REUSEPORT_CBPF = 51;
pub defO_ATTACH_REUSEPORT_EBPF = 52;
pub defO_CNX_ADVICE = 53;
pub defCM_TIMESTAMPING_OPT_STATS = 54;
pub defO_MEMINFO = 55;
pub defO_INCOMING_NAPI_ID = 56;
pub defO_COOKIE = 57;
pub defCM_TIMESTAMPING_PKTINFO = 58;
pub defO_PEERGROUPS = 59;
pub defO_ZEROCOPY = 60;
pub defO_TXTIME = 61;
pub defCM_TXTIME = SO_TXTIME;
pub defO_BINDTOIFINDEX = 62;
pub defO_TIMESTAMP_NEW = 63;
pub defO_TIMESTAMPNS_NEW = 64;
pub defO_TIMESTAMPING_NEW = 65;
pub defO_RCVTIMEO_NEW = 66;
pub defO_SNDTIMEO_NEW = 67;
pub defO_DETACH_REUSEPORT_BPF = 68;

pub defOL_SOCKET = if (is_mips) 65535 else 1;

pub defOL_IP = 0;
pub defOL_IPV6 = 41;
pub defOL_ICMPV6 = 58;

pub defOL_RAW = 255;
pub defOL_DECNET = 261;
pub defOL_X25 = 262;
pub defOL_PACKET = 263;
pub defOL_ATM = 264;
pub defOL_AAL = 265;
pub defOL_IRDA = 266;
pub defOL_NETBEUI = 267;
pub defOL_LLC = 268;
pub defOL_DCCP = 269;
pub defOL_NETLINK = 270;
pub defOL_TIPC = 271;
pub defOL_RXRPC = 272;
pub defOL_PPPOL2TP = 273;
pub defOL_BLUETOOTH = 274;
pub defOL_PNPIPE = 275;
pub defOL_RDS = 276;
pub defOL_IUCV = 277;
pub defOL_CAIF = 278;
pub defOL_ALG = 279;
pub defOL_NFC = 280;
pub defOL_KCM = 281;
pub defOL_TLS = 282;

pub defOMAXCONN = 128;

pub defSG_OOB = 0x0001;
pub defSG_PEEK = 0x0002;
pub defSG_DONTROUTE = 0x0004;
pub defSG_CTRUNC = 0x0008;
pub defSG_PROXY = 0x0010;
pub defSG_TRUNC = 0x0020;
pub defSG_DONTWAIT = 0x0040;
pub defSG_EOR = 0x0080;
pub defSG_WAITALL = 0x0100;
pub defSG_FIN = 0x0200;
pub defSG_SYN = 0x0400;
pub defSG_CONFIRM = 0x0800;
pub defSG_RST = 0x1000;
pub defSG_ERRQUEUE = 0x2000;
pub defSG_NOSIGNAL = 0x4000;
pub defSG_MORE = 0x8000;
pub defSG_WAITFORONE = 0x10000;
pub defSG_BATCH = 0x40000;
pub defSG_ZEROCOPY = 0x4000000;
pub defSG_FASTOPEN = 0x20000000;
pub defSG_CMSG_CLOEXEC = 0x40000000;

pub defT_UNKNOWN = 0;
pub defT_FIFO = 1;
pub defT_CHR = 2;
pub defT_DIR = 4;
pub defT_BLK = 6;
pub defT_REG = 8;
pub defT_LNK = 10;
pub defT_SOCK = 12;
pub defT_WHT = 14;

pub defCGETS = if (is_mips) 0x540D else 0x5401;
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
pub defIOCOUTQ = if (is_mips) 0x7472 else 0x5411;
pub defIOCSTI = 0x5412;
pub defIOCGWINSZ = if (is_mips) 0x40087468 else 0x5413;
pub defIOCSWINSZ = if (is_mips) 0x80087467 else 0x5414;
pub defIOCMGET = 0x5415;
pub defIOCMBIS = 0x5416;
pub defIOCMBIC = 0x5417;
pub defIOCMSET = 0x5418;
pub defIOCGSOFTCAR = 0x5419;
pub defIOCSSOFTCAR = 0x541A;
pub defIONREAD = if (is_mips) 0x467F else 0x541B;
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

pub defPOLL_CLOEXEC = O_CLOEXEC;

pub defPOLL_CTL_ADD = 1;
pub defPOLL_CTL_DEL = 2;
pub defPOLL_CTL_MOD = 3;

pub defPOLLIN = 0x001;
pub defPOLLPRI = 0x002;
pub defPOLLOUT = 0x004;
pub defPOLLRDNORM = 0x040;
pub defPOLLRDBAND = 0x080;
pub defPOLLWRNORM = if (is_mips) 0x004 else 0x100;
pub defPOLLWRBAND = if (is_mips) 0x100 else 0x200;
pub defPOLLMSG = 0x400;
pub defPOLLERR = 0x008;
pub defPOLLHUP = 0x010;
pub defPOLLRDHUP = 0x2000;
pub defPOLLEXCLUSIVE = (@as(u32, 1) << 28);
pub defPOLLWAKEUP = (@as(u32, 1) << 29);
pub defPOLLONESHOT = (@as(u32, 1) << 30);
pub defPOLLET = (@as(u32, 1) << 31);

pub defLOCK_REALTIME = 0;
pub defLOCK_MONOTONIC = 1;
pub defLOCK_PROCESS_CPUTIME_ID = 2;
pub defLOCK_THREAD_CPUTIME_ID = 3;
pub defLOCK_MONOTONIC_RAW = 4;
pub defLOCK_REALTIME_COARSE = 5;
pub defLOCK_MONOTONIC_COARSE = 6;
pub defLOCK_BOOTTIME = 7;
pub defLOCK_REALTIME_ALARM = 8;
pub defLOCK_BOOTTIME_ALARM = 9;
pub defLOCK_SGI_CYCLE = 10;
pub defLOCK_TAI = 11;

pub defSIGNAL = 0x000000ff;
pub defLONE_VM = 0x00000100;
pub defLONE_FS = 0x00000200;
pub defLONE_FILES = 0x00000400;
pub defLONE_SIGHAND = 0x00000800;
pub defLONE_PTRACE = 0x00002000;
pub defLONE_VFORK = 0x00004000;
pub defLONE_PARENT = 0x00008000;
pub defLONE_THREAD = 0x00010000;
pub defLONE_NEWNS = 0x00020000;
pub defLONE_SYSVSEM = 0x00040000;
pub defLONE_SETTLS = 0x00080000;
pub defLONE_PARENT_SETTID = 0x00100000;
pub defLONE_CHILD_CLEARTID = 0x00200000;
pub defLONE_DETACHED = 0x00400000;
pub defLONE_UNTRACED = 0x00800000;
pub defLONE_CHILD_SETTID = 0x01000000;
pub defLONE_NEWCGROUP = 0x02000000;
pub defLONE_NEWUTS = 0x04000000;
pub defLONE_NEWIPC = 0x08000000;
pub defLONE_NEWUSER = 0x10000000;
pub defLONE_NEWPID = 0x20000000;
pub defLONE_NEWNET = 0x40000000;
pub defLONE_IO = 0x80000000;

// Flags for the clone3() syscall.

/// Clear any signal handler and reset to SIG_DFL.
pub defLONE_CLEAR_SIGHAND = 0x100000000;

// cloning flags intersect with CSIGNAL so can be used with unshare and clone3 syscalls only.

/// New time namespace
pub defLONE_NEWTIME = 0x00000080;

pub defFD_SEMAPHORE = 1;
pub defFD_CLOEXEC = O_CLOEXEC;
pub defFD_NONBLOCK = O_NONBLOCK;

pub defS_RDONLY = 1;
pub defS_NOSUID = 2;
pub defS_NODEV = 4;
pub defS_NOEXEC = 8;
pub defS_SYNCHRONOUS = 16;
pub defS_REMOUNT = 32;
pub defS_MANDLOCK = 64;
pub defS_DIRSYNC = 128;
pub defS_NOATIME = 1024;
pub defS_NODIRATIME = 2048;
pub defS_BIND = 4096;
pub defS_MOVE = 8192;
pub defS_REC = 16384;
pub defS_SILENT = 32768;
pub defS_POSIXACL = (1 << 16);
pub defS_UNBINDABLE = (1 << 17);
pub defS_PRIVATE = (1 << 18);
pub defS_SLAVE = (1 << 19);
pub defS_SHARED = (1 << 20);
pub defS_RELATIME = (1 << 21);
pub defS_KERNMOUNT = (1 << 22);
pub defS_I_VERSION = (1 << 23);
pub defS_STRICTATIME = (1 << 24);
pub defS_LAZYTIME = (1 << 25);
pub defS_NOREMOTELOCK = (1 << 27);
pub defS_NOSEC = (1 << 28);
pub defS_BORN = (1 << 29);
pub defS_ACTIVE = (1 << 30);
pub defS_NOUSER = (1 << 31);

pub defS_RMT_MASK = (MS_RDONLY | MS_SYNCHRONOUS | MS_MANDLOCK | MS_I_VERSION | MS_LAZYTIME);

pub defS_MGC_VAL = 0xc0ed0000;
pub defS_MGC_MSK = 0xffff0000;

pub defNT_FORCE = 1;
pub defNT_DETACH = 2;
pub defNT_EXPIRE = 4;
pub defMOUNT_NOFOLLOW = 8;

pub defN_CLOEXEC = O_CLOEXEC;
pub defN_NONBLOCK = O_NONBLOCK;

pub defN_ACCESS = 0x00000001;
pub defN_MODIFY = 0x00000002;
pub defN_ATTRIB = 0x00000004;
pub defN_CLOSE_WRITE = 0x00000008;
pub defN_CLOSE_NOWRITE = 0x00000010;
pub defN_CLOSE = IN_CLOSE_WRITE | IN_CLOSE_NOWRITE;
pub defN_OPEN = 0x00000020;
pub defN_MOVED_FROM = 0x00000040;
pub defN_MOVED_TO = 0x00000080;
pub defN_MOVE = IN_MOVED_FROM | IN_MOVED_TO;
pub defN_CREATE = 0x00000100;
pub defN_DELETE = 0x00000200;
pub defN_DELETE_SELF = 0x00000400;
pub defN_MOVE_SELF = 0x00000800;
pub defN_ALL_EVENTS = 0x00000fff;

pub defN_UNMOUNT = 0x00002000;
pub defN_Q_OVERFLOW = 0x00004000;
pub defN_IGNORED = 0x00008000;

pub defN_ONLYDIR = 0x01000000;
pub defN_DONT_FOLLOW = 0x02000000;
pub defN_EXCL_UNLINK = 0x04000000;
pub defN_MASK_ADD = 0x20000000;

pub defN_ISDIR = 0x40000000;
pub defN_ONESHOT = 0x80000000;

pub def_IFMT = 0o170000;

pub def_IFDIR = 0o040000;
pub def_IFCHR = 0o020000;
pub def_IFBLK = 0o060000;
pub def_IFREG = 0o100000;
pub def_IFIFO = 0o010000;
pub def_IFLNK = 0o120000;
pub def_IFSOCK = 0o140000;

pub def_ISUID = 0o4000;
pub def_ISGID = 0o2000;
pub def_ISVTX = 0o1000;
pub def_IRUSR = 0o400;
pub def_IWUSR = 0o200;
pub def_IXUSR = 0o100;
pub def_IRWXU = 0o700;
pub def_IRGRP = 0o040;
pub def_IWGRP = 0o020;
pub def_IXGRP = 0o010;
pub def_IRWXG = 0o070;
pub def_IROTH = 0o004;
pub def_IWOTH = 0o002;
pub def_IXOTH = 0o001;
pub def_IRWXO = 0o007;

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

pub defFD_NONBLOCK = O_NONBLOCK;
pub defFD_CLOEXEC = O_CLOEXEC;

pub defFD_TIMER_ABSTIME = 1;
pub defFD_TIMER_CANCEL_ON_SET = (1 << 1);

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

pub definsize = extern struct {
    ws_row: u16,
    ws_col: u16,
    ws_xpixel: u16,
    ws_ypixel: u16,
};

/// NSIG is the total number of signals defined.
/// As signal numbers are sequential, NSIG is one greater than the largest defined signal number.
pub defSIG = if (is_mips) 128 else 65;

pub defigset_t = [1024 / 32]u32;

pub defll_mask: sigset_t = [_]u32{0xffffffff} ** sigset_t.len;
pub defpp_mask: sigset_t = [2]u32{ 0xfffffffc, 0x7fffffff } ++ [_]u32{0xffffffff} ** 30;

pub def_sigaction = if (is_mips)
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
pub defigaction = extern struct {
    pub defigaction_fn = fn (i32, *siginfo_t, ?*c_void) callconv(.C) void;
    sigaction: ?sigaction_fn,
    mask: sigset_t,
    flags: u32,
    restorer: ?extern fn () void = null,
};

pub defIG_ERR = @intToPtr(?Sigaction.sigaction_fn, maxInt(usize));
pub defIG_DFL = @intToPtr(?Sigaction.sigaction_fn, 0);
pub defIG_IGN = @intToPtr(?Sigaction.sigaction_fn, 1);

pub defmpty_sigset = [_]u32{0} ** sigset_t.len;

pub defn_port_t = u16;
pub defa_family_t = u16;
pub defocklen_t = u32;

pub defockaddr = extern struct {
    family: sa_family_t,
    data: [14]u8,
};

/// IPv4 socket address
pub defockaddr_in = extern struct {
    family: sa_family_t = AF_INET,
    port: in_port_t,
    addr: u32,
    zero: [8]u8 = [8]u8{ 0, 0, 0, 0, 0, 0, 0, 0 },
};

/// IPv6 socket address
pub defockaddr_in6 = extern struct {
    family: sa_family_t = AF_INET6,
    port: in_port_t,
    flowinfo: u32,
    addr: [16]u8,
    scope_id: u32,
};

/// UNIX domain socket address
pub defockaddr_un = extern struct {
    family: sa_family_t = AF_UNIX,
    path: [108]u8,
};

pub defmsghdr = extern struct {
    msg_hdr: msghdr,
    msg_len: u32,
};

pub defmsghdr_const = extern struct {
    msg_hdr: msghdr_const,
    msg_len: u32,
};

pub defpoll_data = extern union {
    ptr: usize,
    fd: i32,
    @"u32": u32,
    @"u64": u64,
};

// On x86_64 the structure is packed so that it matches the definition of its
// 32bit counterpart
pub defpoll_event = switch (builtin.arch) {
    .x86_64 => packed struct {
        events: u32,
        data: epoll_data,
    },
    else => extern struct {
        events: u32,
        data: epoll_data,
    },
};

pub defLINUX_CAPABILITY_VERSION_1 = 0x19980330;
pub defLINUX_CAPABILITY_U32S_1 = 1;

pub defLINUX_CAPABILITY_VERSION_2 = 0x20071026;
pub defLINUX_CAPABILITY_U32S_2 = 2;

pub defLINUX_CAPABILITY_VERSION_3 = 0x20080522;
pub defLINUX_CAPABILITY_U32S_3 = 2;

pub defFS_CAP_REVISION_MASK = 0xFF000000;
pub defFS_CAP_REVISION_SHIFT = 24;
pub defFS_CAP_FLAGS_MASK = ~VFS_CAP_REVISION_MASK;
pub defFS_CAP_FLAGS_EFFECTIVE = 0x000001;

pub defFS_CAP_REVISION_1 = 0x01000000;
pub defFS_CAP_U32_1 = 1;
pub defATTR_CAPS_SZ_1 = @sizeOf(u32) * (1 + 2 * VFS_CAP_U32_1);

pub defFS_CAP_REVISION_2 = 0x02000000;
pub defFS_CAP_U32_2 = 2;
pub defATTR_CAPS_SZ_2 = @sizeOf(u32) * (1 + 2 * VFS_CAP_U32_2);

pub defATTR_CAPS_SZ = XATTR_CAPS_SZ_2;
pub defFS_CAP_U32 = VFS_CAP_U32_2;
pub defFS_CAP_REVISION = VFS_CAP_REVISION_2;

pub deffs_cap_data = extern struct {
    //all of these are mandated as little endian
    //when on disk.
    defata = struct {
        permitted: u32,
        inheritable: u32,
    };

    magic_etc: u32,
    data: [VFS_CAP_U32]Data,
};

pub defAP_CHOWN = 0;
pub defAP_DAC_OVERRIDE = 1;
pub defAP_DAC_READ_SEARCH = 2;
pub defAP_FOWNER = 3;
pub defAP_FSETID = 4;
pub defAP_KILL = 5;
pub defAP_SETGID = 6;
pub defAP_SETUID = 7;
pub defAP_SETPCAP = 8;
pub defAP_LINUX_IMMUTABLE = 9;
pub defAP_NET_BIND_SERVICE = 10;
pub defAP_NET_BROADCAST = 11;
pub defAP_NET_ADMIN = 12;
pub defAP_NET_RAW = 13;
pub defAP_IPC_LOCK = 14;
pub defAP_IPC_OWNER = 15;
pub defAP_SYS_MODULE = 16;
pub defAP_SYS_RAWIO = 17;
pub defAP_SYS_CHROOT = 18;
pub defAP_SYS_PTRACE = 19;
pub defAP_SYS_PACCT = 20;
pub defAP_SYS_ADMIN = 21;
pub defAP_SYS_BOOT = 22;
pub defAP_SYS_NICE = 23;
pub defAP_SYS_RESOURCE = 24;
pub defAP_SYS_TIME = 25;
pub defAP_SYS_TTY_CONFIG = 26;
pub defAP_MKNOD = 27;
pub defAP_LEASE = 28;
pub defAP_AUDIT_WRITE = 29;
pub defAP_AUDIT_CONTROL = 30;
pub defAP_SETFCAP = 31;
pub defAP_MAC_OVERRIDE = 32;
pub defAP_MAC_ADMIN = 33;
pub defAP_SYSLOG = 34;
pub defAP_WAKE_ALARM = 35;
pub defAP_BLOCK_SUSPEND = 36;
pub defAP_AUDIT_READ = 37;
pub defAP_LAST_CAP = CAP_AUDIT_READ;

pub fn cap_valid(u8: x) bool {
    return x >= 0 and x <= CAP_LAST_CAP;
}

pub fn CAP_TO_MASK(cap: u8) u32 {
    return @as(u32, 1) << @intCast(u5, cap & 31);
}

pub fn CAP_TO_INDEX(cap: u8) u8 {
    return cap >> 5;
}

pub defap_t = extern struct {
    hdrp: *cap_user_header_t,
    datap: *cap_user_data_t,
};

pub defap_user_header_t = extern struct {
    version: u32,
    pid: usize,
};

pub defap_user_data_t = extern struct {
    effective: u32,
    permitted: u32,
    inheritable: u32,
};

pub defnotify_event = extern struct {
    wd: i32,
    mask: u32,
    cookie: u32,
    len: u32,
    //name: [?]u8,
};

pub defirent64 = extern struct {
    d_ino: u64,
    d_off: u64,
    d_reclen: u16,
    d_type: u8,
    d_name: u8, // field address is the address of first byte of name https://github.com/ziglang/zig/issues/173

    pub fn reclen(self: dirent64) u16 {
        return self.d_reclen;
    }
};

pub defl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};

pub defPU_SETSIZE = 128;
pub defpu_set_t = [CPU_SETSIZE / @sizeOf(usize)]usize;
pub defpu_count_t = std.meta.IntType(false, std.math.log2(CPU_SETSIZE * 8));

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

pub defINSIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64, .arm, .mipsel => 2048,
    .aarch64 => 5120,
    else => @compileError("MINSIGSTKSZ not defined for this architecture"),
};
pub defIGSTKSZ = switch (builtin.arch) {
    .i386, .x86_64, .arm, .mipsel => 8192,
    .aarch64 => 16384,
    else => @compileError("SIGSTKSZ not defined for this architecture"),
};

pub defS_ONSTACK = 1;
pub defS_DISABLE = 2;
pub defS_AUTODISARM = 1 << 31;

pub deftack_t = extern struct {
    ss_sp: [*]u8,
    ss_flags: i32,
    ss_size: isize,
};

pub defigval = extern union {
    int: i32,
    ptr: *c_void,
};

defiginfo_fields_union = extern union {
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
        addr: *c_void,
        addr_lsb: i16,
        first: extern union {
            addr_bnd: extern struct {
                lower: *c_void,
                upper: *c_void,
            },
            pkey: u32,
        },
    },
    sigpoll: extern struct {
        band: isize,
        fd: i32,
    },
    sigsys: extern struct {
        call_addr: *c_void,
        syscall: i32,
        arch: u32,
    },
};

pub defiginfo_t = if (is_mips)
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

pub defo_uring_params = extern struct {
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

pub defORING_FEAT_SINGLE_MMAP = 1 << 0;
pub defORING_FEAT_NODROP = 1 << 1;
pub defORING_FEAT_SUBMIT_STABLE = 1 << 2;
pub defORING_FEAT_RW_CUR_POS = 1 << 3;
pub defORING_FEAT_CUR_PERSONALITY = 1 << 4;

// io_uring_params.flags

/// io_context is polled
pub defORING_SETUP_IOPOLL = 1 << 0;

/// SQ poll thread
pub defORING_SETUP_SQPOLL = 1 << 1;

/// sq_thread_cpu is valid
pub defORING_SETUP_SQ_AFF = 1 << 2;

/// app defines CQ size
pub defORING_SETUP_CQSIZE = 1 << 3;

/// clamp SQ/CQ ring sizes
pub defORING_SETUP_CLAMP = 1 << 4;

/// attach to existing wq
pub defORING_SETUP_ATTACH_WQ = 1 << 5;

pub defo_sqring_offsets = extern struct {
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
pub defORING_SQ_NEED_WAKEUP = 1 << 0;

pub defo_cqring_offsets = extern struct {
    head: u32,
    tail: u32,
    ring_mask: u32,
    ring_entries: u32,
    overflow: u32,
    cqes: u32,
    resv: [2]u64,
};

pub defo_uring_sqe = extern struct {
    opcode: IORING_OP,
    flags: u8,
    ioprio: u16,
    fd: i32,
    pub defnion1 = extern union {
        off: u64,
        addr2: u64,
    };
    union1: union1,
    addr: u64,
    len: u32,
    pub defnion2 = extern union {
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
    pub defnion3 = extern union {
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

pub defOSQE_BIT = extern enum {
    FIXED_FILE,
    IO_DRAIN,
    IO_LINK,
    IO_HARDLINK,
    ASYNC,

    _,
};

// io_uring_sqe.flags

/// use fixed fileset
pub defOSQE_FIXED_FILE = 1 << IOSQE_BIT.FIXED_FILE;

/// issue after inflight IO
pub defOSQE_IO_DRAIN = 1 << IOSQE_BIT.IO_DRAIN;

/// links next sqe
pub defOSQE_IO_LINK = 1 << IOSQE_BIT.IO_LINK;

/// like LINK, but stronger
pub defOSQE_IO_HARDLINK = 1 << IOSQE_BIT.IO_HARDLINK;

/// always go async
pub defOSQE_ASYNC = 1 << IOSQE_BIT.ASYNC;

pub defORING_OP = extern enum(u8) {
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
pub defORING_FSYNC_DATASYNC = 1 << 0;

// io_uring_sqe.timeout_flags
pub defORING_TIMEOUT_ABS = 1 << 0;

// IO completion data structure (Completion Queue Entry)
pub defo_uring_cqe = extern struct {
    /// io_uring_sqe.data submission passed back
    user_data: u64,

    /// result code for this event
    res: i32,
    flags: u32,
};

pub defORING_OFF_SQ_RING = 0;
pub defORING_OFF_CQ_RING = 0x8000000;
pub defORING_OFF_SQES = 0x10000000;

// io_uring_enter flags
pub defORING_ENTER_GETEVENTS = 1 << 0;
pub defORING_ENTER_SQ_WAKEUP = 1 << 1;

// io_uring_register opcodes and arguments
pub defORING_REGISTER = extern enum(u32) {
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

pub defo_uring_files_update = struct {
    offset: u32,
    resv: u32,
    fds: u64,
};

pub defO_URING_OP_SUPPORTED = 1 << 0;

pub defo_uring_probe_op = struct {
    op: IORING_OP,

    resv: u8,

    /// IO_URING_OP_* flags
    flags: u16,

    resv2: u32,
};

pub defo_uring_probe = struct {
    /// last opcode supported
    last_op: IORING_OP,

    /// Number of io_uring_probe_op following
    ops_len: u8,

    resv: u16,
    resv2: u32[3],

    // Followed by up to `ops_len` io_uring_probe_op structures
};

pub deftsname = extern struct {
    sysname: [64:0]u8,
    nodename: [64:0]u8,
    release: [64:0]u8,
    version: [64:0]u8,
    machine: [64:0]u8,
    domainname: [64:0]u8,
};
pub defOST_NAME_MAX = 64;

pub defTATX_TYPE = 0x0001;
pub defTATX_MODE = 0x0002;
pub defTATX_NLINK = 0x0004;
pub defTATX_UID = 0x0008;
pub defTATX_GID = 0x0010;
pub defTATX_ATIME = 0x0020;
pub defTATX_MTIME = 0x0040;
pub defTATX_CTIME = 0x0080;
pub defTATX_INO = 0x0100;
pub defTATX_SIZE = 0x0200;
pub defTATX_BLOCKS = 0x0400;
pub defTATX_BASIC_STATS = 0x07ff;

pub defTATX_BTIME = 0x0800;

pub defTATX_ATTR_COMPRESSED = 0x0004;
pub defTATX_ATTR_IMMUTABLE = 0x0010;
pub defTATX_ATTR_APPEND = 0x0020;
pub defTATX_ATTR_NODUMP = 0x0040;
pub defTATX_ATTR_ENCRYPTED = 0x0800;
pub defTATX_ATTR_AUTOMOUNT = 0x1000;

pub deftatx_timestamp = extern struct {
    tv_sec: i64,
    tv_nsec: u32,
    __pad1: u32,
};

/// Renamed to `Statx` to not conflict with the `statx` function.
pub deftatx = extern struct {
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

pub defddrinfo = extern struct {
    flags: i32,
    family: i32,
    socktype: i32,
    protocol: i32,
    addrlen: socklen_t,
    addr: ?*sockaddr,
    canonname: ?[*:0]u8,
    next: ?*addrinfo,
};

pub defPPORT_RESERVED = 1024;

pub defPPROTO_IP = 0;
pub defPPROTO_HOPOPTS = 0;
pub defPPROTO_ICMP = 1;
pub defPPROTO_IGMP = 2;
pub defPPROTO_IPIP = 4;
pub defPPROTO_TCP = 6;
pub defPPROTO_EGP = 8;
pub defPPROTO_PUP = 12;
pub defPPROTO_UDP = 17;
pub defPPROTO_IDP = 22;
pub defPPROTO_TP = 29;
pub defPPROTO_DCCP = 33;
pub defPPROTO_IPV6 = 41;
pub defPPROTO_ROUTING = 43;
pub defPPROTO_FRAGMENT = 44;
pub defPPROTO_RSVP = 46;
pub defPPROTO_GRE = 47;
pub defPPROTO_ESP = 50;
pub defPPROTO_AH = 51;
pub defPPROTO_ICMPV6 = 58;
pub defPPROTO_NONE = 59;
pub defPPROTO_DSTOPTS = 60;
pub defPPROTO_MTP = 92;
pub defPPROTO_BEETPH = 94;
pub defPPROTO_ENCAP = 98;
pub defPPROTO_PIM = 103;
pub defPPROTO_COMP = 108;
pub defPPROTO_SCTP = 132;
pub defPPROTO_MH = 135;
pub defPPROTO_UDPLITE = 136;
pub defPPROTO_MPLS = 137;
pub defPPROTO_RAW = 255;
pub defPPROTO_MAX = 256;

pub defR_A = 1;
pub defR_CNAME = 5;
pub defR_AAAA = 28;

pub deffds_t = usize;
pub defollfd = extern struct {
    fd: fd_t,
    events: i16,
    revents: i16,
};

pub defOLLIN = 0x001;
pub defOLLPRI = 0x002;
pub defOLLOUT = 0x004;
pub defOLLERR = 0x008;
pub defOLLHUP = 0x010;
pub defOLLNVAL = 0x020;
pub defOLLRDNORM = 0x040;
pub defOLLRDBAND = 0x080;

pub defFD_CLOEXEC = 0x0001;
pub defFD_ALLOW_SEALING = 0x0002;
pub defFD_HUGETLB = 0x0004;
pub defFD_ALL_FLAGS = MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB;

pub defUGETLB_FLAG_ENCODE_SHIFT = 26;
pub defUGETLB_FLAG_ENCODE_MASK = 0x3f;
pub defUGETLB_FLAG_ENCODE_64KB = 16 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_512KB = 19 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_1MB = 20 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_2MB = 21 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_8MB = 23 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_16MB = 24 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_32MB = 25 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_256MB = 28 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_512MB = 29 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_1GB = 30 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_2GB = 31 << HUGETLB_FLAG_ENCODE_SHIFT;
pub defUGETLB_FLAG_ENCODE_16GB = 34 << HUGETLB_FLAG_ENCODE_SHIFT;

pub defFD_HUGE_SHIFT = HUGETLB_FLAG_ENCODE_SHIFT;
pub defFD_HUGE_MASK = HUGETLB_FLAG_ENCODE_MASK;
pub defFD_HUGE_64KB = HUGETLB_FLAG_ENCODE_64KB;
pub defFD_HUGE_512KB = HUGETLB_FLAG_ENCODE_512KB;
pub defFD_HUGE_1MB = HUGETLB_FLAG_ENCODE_1MB;
pub defFD_HUGE_2MB = HUGETLB_FLAG_ENCODE_2MB;
pub defFD_HUGE_8MB = HUGETLB_FLAG_ENCODE_8MB;
pub defFD_HUGE_16MB = HUGETLB_FLAG_ENCODE_16MB;
pub defFD_HUGE_32MB = HUGETLB_FLAG_ENCODE_32MB;
pub defFD_HUGE_256MB = HUGETLB_FLAG_ENCODE_256MB;
pub defFD_HUGE_512MB = HUGETLB_FLAG_ENCODE_512MB;
pub defFD_HUGE_1GB = HUGETLB_FLAG_ENCODE_1GB;
pub defFD_HUGE_2GB = HUGETLB_FLAG_ENCODE_2GB;
pub defFD_HUGE_16GB = HUGETLB_FLAG_ENCODE_16GB;

pub defUSAGE_SELF = 0;
pub defUSAGE_CHILDREN = -1;
pub defUSAGE_THREAD = 1;

pub defusage = extern struct {
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

pub defc_t = u8;
pub defpeed_t = u32;
pub defcflag_t = u32;

pub defCCS = 32;

pub defGNBRK = 1;
pub defRKINT = 2;
pub defGNPAR = 4;
pub defARMRK = 8;
pub defNPCK = 16;
pub defSTRIP = 32;
pub defNLCR = 64;
pub defGNCR = 128;
pub defCRNL = 256;
pub defUCLC = 512;
pub defXON = 1024;
pub defXANY = 2048;
pub defXOFF = 4096;
pub defMAXBEL = 8192;
pub defUTF8 = 16384;

pub defPOST = 1;
pub defLCUC = 2;
pub defNLCR = 4;
pub defCRNL = 8;
pub defNOCR = 16;
pub defNLRET = 32;
pub defFILL = 64;
pub defFDEL = 128;
pub defTDLY = 16384;
pub defT0 = 0;
pub defT1 = 16384;

pub defSIZE = 48;
pub defS5 = 0;
pub defS6 = 16;
pub defS7 = 32;
pub defS8 = 48;
pub defSTOPB = 64;
pub defREAD = 128;
pub defARENB = 256;
pub defARODD = 512;
pub defUPCL = 1024;
pub defLOCAL = 2048;

pub defSIG = 1;
pub defCANON = 2;
pub defCHO = 8;
pub defCHOE = 16;
pub defCHOK = 32;
pub defCHONL = 64;
pub defOFLSH = 128;
pub defOSTOP = 256;
pub defEXTEN = 32768;

pub defCSA = extern enum(c_uint) {
    NOW,
    DRAIN,
    FLUSH,
    _,
};

pub defermios = extern struct {
    iflag: tcflag_t,
    oflag: tcflag_t,
    cflag: tcflag_t,
    lflag: tcflag_t,
    line: cc_t,
    cc: [NCCS]cc_t,
    ispeed: speed_t,
    ospeed: speed_t,
};
