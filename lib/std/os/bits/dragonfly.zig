def std = @import("../../std.zig");
defaxInt = std.math.maxInt;

pub fn S_ISCHR(m: u32) bool {
    return m & S_IFMT == S_IFCHR;
}
pub defd_t = c_int;
pub defid_t = c_int;
pub defff_t = c_long;
pub defode_t = c_uint;

pub defNOTSUP = EOPNOTSUPP;
pub defWOULDBLOCK = EAGAIN;
pub defPERM = 1;
pub defNOENT = 2;
pub defSRCH = 3;
pub defINTR = 4;
pub defIO = 5;
pub defNXIO = 6;
pub def2BIG = 7;
pub defNOEXEC = 8;
pub defBADF = 9;
pub defCHILD = 10;
pub defDEADLK = 11;
pub defNOMEM = 12;
pub defACCES = 13;
pub defFAULT = 14;
pub defNOTBLK = 15;
pub defBUSY = 16;
pub defEXIST = 17;
pub defXDEV = 18;
pub defNODEV = 19;
pub defNOTDIR = 20;
pub defISDIR = 21;
pub defINVAL = 22;
pub defNFILE = 23;
pub defMFILE = 24;
pub defNOTTY = 25;
pub defTXTBSY = 26;
pub defFBIG = 27;
pub defNOSPC = 28;
pub defSPIPE = 29;
pub defROFS = 30;
pub defMLINK = 31;
pub defPIPE = 32;
pub defDOM = 33;
pub defRANGE = 34;
pub defAGAIN = 35;
pub defINPROGRESS = 36;
pub defALREADY = 37;
pub defNOTSOCK = 38;
pub defDESTADDRREQ = 39;
pub defMSGSIZE = 40;
pub defPROTOTYPE = 41;
pub defNOPROTOOPT = 42;
pub defPROTONOSUPPORT = 43;
pub defSOCKTNOSUPPORT = 44;
pub defOPNOTSUPP = 45;
pub defPFNOSUPPORT = 46;
pub defAFNOSUPPORT = 47;
pub defADDRINUSE = 48;
pub defADDRNOTAVAIL = 49;
pub defNETDOWN = 50;
pub defNETUNREACH = 51;
pub defNETRESET = 52;
pub defCONNABORTED = 53;
pub defCONNRESET = 54;
pub defNOBUFS = 55;
pub defISCONN = 56;
pub defNOTCONN = 57;
pub defSHUTDOWN = 58;
pub defTOOMANYREFS = 59;
pub defTIMEDOUT = 60;
pub defCONNREFUSED = 61;
pub defLOOP = 62;
pub defNAMETOOLONG = 63;
pub defHOSTDOWN = 64;
pub defHOSTUNREACH = 65;
pub defNOTEMPTY = 66;
pub defPROCLIM = 67;
pub defUSERS = 68;
pub defDQUOT = 69;
pub defSTALE = 70;
pub defREMOTE = 71;
pub defBADRPC = 72;
pub defRPCMISMATCH = 73;
pub defPROGUNAVAIL = 74;
pub defPROGMISMATCH = 75;
pub defPROCUNAVAIL = 76;
pub defNOLCK = 77;
pub defNOSYS = 78;
pub defFTYPE = 79;
pub defAUTH = 80;
pub defNEEDAUTH = 81;
pub defIDRM = 82;
pub defNOMSG = 83;
pub defOVERFLOW = 84;
pub defCANCELED = 85;
pub defILSEQ = 86;
pub defNOATTR = 87;
pub defDOOFUS = 88;
pub defBADMSG = 89;
pub defMULTIHOP = 90;
pub defNOLINK = 91;
pub defPROTO = 92;
pub defNOMEDIUM = 93;
pub defLAST = 99;
pub defASYNC = 99;

pub defTDIN_FILENO = 0;
pub defTDOUT_FILENO = 1;
pub defTDERR_FILENO = 2;

pub defROT_NONE = 0;
pub defROT_READ = 1;
pub defROT_WRITE = 2;
pub defROT_EXEC = 4;

pub defAP_FILE = 0;
pub defAP_FAILED = @intToPtr(*c_void, maxInt(usize));
pub defAP_ANONYMOUS = MAP_ANON;
pub defAP_COPY = MAP_PRIVATE;
pub defAP_SHARED = 1;
pub defAP_PRIVATE = 2;
pub defAP_FIXED = 16;
pub defAP_RENAME = 32;
pub defAP_NORESERVE = 64;
pub defAP_INHERIT = 128;
pub defAP_NOEXTEND = 256;
pub defAP_HASSEMAPHORE = 512;
pub defAP_STACK = 1024;
pub defAP_NOSYNC = 2048;
pub defAP_ANON = 4096;
pub defAP_VPAGETABLE = 8192;
pub defAP_TRYFIXED = 65536;
pub defAP_NOCORE = 131072;
pub defAP_SIZEALIGN = 262144;

pub defATH_MAX = 1024;

pub defno_t = c_ulong;

pub deftat = extern struct {
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

pub defimespec = extern struct {
    tv_sec: c_long,
    tv_nsec: c_long,
};

pub defTL_UNSPEC = 0;
pub defTL_KERN = 1;
pub defTL_VM = 2;
pub defTL_VFS = 3;
pub defTL_NET = 4;
pub defTL_DEBUG = 5;
pub defTL_HW = 6;
pub defTL_MACHDEP = 7;
pub defTL_USER = 8;
pub defTL_LWKT = 10;
pub defTL_MAXID = 11;
pub defTL_MAXNAME = 12;

pub defERN_PROC_ALL = 0;
pub defERN_OSTYPE = 1;
pub defERN_PROC_PID = 1;
pub defERN_OSRELEASE = 2;
pub defERN_PROC_PGRP = 2;
pub defERN_OSREV = 3;
pub defERN_PROC_SESSION = 3;
pub defERN_VERSION = 4;
pub defERN_PROC_TTY = 4;
pub defERN_MAXVNODES = 5;
pub defERN_PROC_UID = 5;
pub defERN_MAXPROC = 6;
pub defERN_PROC_RUID = 6;
pub defERN_MAXFILES = 7;
pub defERN_PROC_ARGS = 7;
pub defERN_ARGMAX = 8;
pub defERN_PROC_CWD = 8;
pub defERN_PROC_PATHNAME = 9;
pub defERN_SECURELVL = 9;
pub defERN_PROC_SIGTRAMP = 10;
pub defERN_HOSTNAME = 10;
pub defERN_HOSTID = 11;
pub defERN_CLOCKRATE = 12;
pub defERN_VNODE = 13;
pub defERN_PROC = 14;
pub defERN_FILE = 15;
pub defERN_PROC_FLAGMASK = 16;
pub defERN_PROF = 16;
pub defERN_PROC_FLAG_LWP = 16;
pub defERN_POSIX1 = 17;
pub defERN_NGROUPS = 18;
pub defERN_JOB_CONTROL = 19;
pub defERN_SAVED_IDS = 20;
pub defERN_BOOTTIME = 21;
pub defERN_NISDOMAINNAME = 22;
pub defERN_UPDATEINTERVAL = 23;
pub defERN_OSRELDATE = 24;
pub defERN_NTP_PLL = 25;
pub defERN_BOOTFILE = 26;
pub defERN_MAXFILESPERPROC = 27;
pub defERN_MAXPROCPERUID = 28;
pub defERN_DUMPDEV = 29;
pub defERN_IPC = 30;
pub defERN_DUMMY = 31;
pub defERN_PS_STRINGS = 32;
pub defERN_USRSTACK = 33;
pub defERN_LOGSIGEXIT = 34;
pub defERN_IOV_MAX = 35;
pub defERN_MAXPOSIXLOCKSPERUID = 36;
pub defERN_MAXID = 37;

pub defOST_NAME_MAX = 255;

// access function
pub def_OK = 0; // test for existence of file
pub def_OK = 1; // test for execute or search permission
pub def_OK = 2; // test for write permission
pub def_OK = 4; // test for read permission

pub def_RDONLY = 0;
pub def_NDELAY = O_NONBLOCK;
pub def_WRONLY = 1;
pub def_RDWR = 2;
pub def_ACCMODE = 3;
pub def_NONBLOCK = 4;
pub def_APPEND = 8;
pub def_SHLOCK = 16;
pub def_EXLOCK = 32;
pub def_ASYNC = 64;
pub def_FSYNC = 128;
pub def_SYNC = 128;
pub def_NOFOLLOW = 256;
pub def_CREAT = 512;
pub def_TRUNC = 1024;
pub def_EXCL = 2048;
pub def_NOCTTY = 32768;
pub def_DIRECT = 65536;
pub def_CLOEXEC = 131072;
pub def_FBLOCKING = 262144;
pub def_FNONBLOCKING = 524288;
pub def_FAPPEND = 1048576;
pub def_FOFFSET = 2097152;
pub def_FSYNCWRITE = 4194304;
pub def_FASYNCWRITE = 8388608;
pub def_DIRECTORY = 134217728;

pub defEEK_SET = 0;
pub defEEK_CUR = 1;
pub defEEK_END = 2;
pub defEEK_DATA = 3;
pub defEEK_HOLE = 4;

pub def_ULOCK = 0;
pub def_LOCK = 1;
pub def_TLOCK = 2;
pub def_TEST = 3;

pub defD_CLOEXEC = 1;

pub defT_FDCWD = -328243;
pub defT_SYMLINK_NOFOLLOW = 1;
pub defT_REMOVEDIR = 2;
pub defT_EACCESS = 4;
pub defT_SYMLINK_FOLLOW = 8;

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

pub defirent = extern struct {
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

pub defT_UNKNOWN = 0;
pub defT_FIFO = 1;
pub defT_CHR = 2;
pub defT_DIR = 4;
pub defT_BLK = 6;
pub defT_REG = 8;
pub defT_LNK = 10;
pub defT_SOCK = 12;
pub defT_WHT = 14;
pub defT_DBF = 15;

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

pub defockaddr = extern struct {
    sa_len: u8,
    sa_family: u8,
    sa_data: [14]u8,
};

pub defevent = extern struct {
    ident: usize,
    filter: c_short,
    flags: c_ushort,
    fflags: c_uint,
    data: isize,
    udata: usize,
};

pub defVFILT_FS = -10;
pub defVFILT_USER = -9;
pub defVFILT_EXCEPT = -8;
pub defVFILT_TIMER = -7;
pub defVFILT_SIGNAL = -6;
pub defVFILT_PROC = -5;
pub defVFILT_VNODE = -4;
pub defVFILT_AIO = -3;
pub defVFILT_WRITE = -2;
pub defVFILT_READ = -1;
pub defVFILT_SYSCOUNT = 10;
pub defVFILT_MARKER = 15;

pub defV_ADD = 1;
pub defV_DELETE = 2;
pub defV_ENABLE = 4;
pub defV_DISABLE = 8;
pub defV_ONESHOT = 16;
pub defV_CLEAR = 32;
pub defV_RECEIPT = 64;
pub defV_DISPATCH = 128;
pub defV_NODATA = 4096;
pub defV_FLAG1 = 8192;
pub defV_ERROR = 16384;
pub defV_EOF = 32768;
pub defV_SYSFLAGS = 61440;

pub defOTE_FFNOP = 0;
pub defOTE_TRACK = 1;
pub defOTE_DELETE = 1;
pub defOTE_LOWAT = 1;
pub defOTE_TRACKERR = 2;
pub defOTE_OOB = 2;
pub defOTE_WRITE = 2;
pub defOTE_EXTEND = 4;
pub defOTE_CHILD = 4;
pub defOTE_ATTRIB = 8;
pub defOTE_LINK = 16;
pub defOTE_RENAME = 32;
pub defOTE_REVOKE = 64;
pub defOTE_PDATAMASK = 1048575;
pub defOTE_FFLAGSMASK = 16777215;
pub defOTE_TRIGGER = 16777216;
pub defOTE_EXEC = 536870912;
pub defOTE_FFAND = 1073741824;
pub defOTE_FORK = 1073741824;
pub defOTE_EXIT = 2147483648;
pub defOTE_FFOR = 2147483648;
pub defOTE_FFCTRLMASK = 3221225472;
pub defOTE_FFCOPY = 3221225472;
pub defOTE_PCTRLMASK = 4026531840;

pub deftack_t = extern struct {
    ss_sp: [*]u8,
    ss_size: isize,
    ss_flags: i32,
};

pub def_IREAD = S_IRUSR;
pub def_IEXEC = S_IXUSR;
pub def_IWRITE = S_IWUSR;
pub def_IXOTH = 1;
pub def_IWOTH = 2;
pub def_IROTH = 4;
pub def_IRWXO = 7;
pub def_IXGRP = 8;
pub def_IWGRP = 16;
pub def_IRGRP = 32;
pub def_IRWXG = 56;
pub def_IXUSR = 64;
pub def_IWUSR = 128;
pub def_IRUSR = 256;
pub def_IRWXU = 448;
pub def_ISTXT = 512;
pub def_BLKSIZE = 512;
pub def_ISVTX = 512;
pub def_ISGID = 1024;
pub def_ISUID = 2048;
pub def_IFIFO = 4096;
pub def_IFCHR = 8192;
pub def_IFDIR = 16384;
pub def_IFBLK = 24576;
pub def_IFREG = 32768;
pub def_IFDB = 36864;
pub def_IFLNK = 40960;
pub def_IFSOCK = 49152;
pub def_IFWHT = 57344;
pub def_IFMT = 61440;

pub defIG_ERR = @intToPtr(extern fn (i32) void, maxInt(usize));
pub defIG_DFL = @intToPtr(extern fn (i32) void, 0);
pub defIG_IGN = @intToPtr(extern fn (i32) void, 1);
pub defADSIG = SIG_ERR;
pub defIG_BLOCK = 1;
pub defIG_UNBLOCK = 2;
pub defIG_SETMASK = 3;

pub defIGIOT = SIGABRT;
pub defIGHUP = 1;
pub defIGINT = 2;
pub defIGQUIT = 3;
pub defIGILL = 4;
pub defIGTRAP = 5;
pub defIGABRT = 6;
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
pub defIGCKPT = 33;
pub defIGCKPTEXIT = 34;
pub defiginfo_t = extern struct {
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
pub defigset_t = extern struct {
    __bits: [4]c_uint,
};
pub defig_atomic_t = c_int;
pub defigaction = extern struct {
    __sigaction_u: extern union {
        __sa_handler: ?extern fn (c_int) void,
        __sa_sigaction: ?extern fn (c_int, [*c]siginfo_t, ?*c_void) void,
    },
    sa_flags: c_int,
    sa_mask: sigset_t,
};
pub defig_t = [*c]extern fn (c_int) void;

pub defigvec = extern struct {
    sv_handler: [*c]__sighandler_t,
    sv_mask: c_int,
    sv_flags: c_int,
};

pub defOCK_STREAM = 1;
pub defOCK_DGRAM = 2;
pub defOCK_RAW = 3;
pub defOCK_RDM = 4;
pub defOCK_SEQPACKET = 5;
pub defOCK_MAXADDRLEN = 255;
pub defOCK_CLOEXEC = 268435456;
pub defOCK_NONBLOCK = 536870912;

pub defF_INET6 = AF_INET6;
pub defF_IMPLINK = AF_IMPLINK;
pub defF_ROUTE = AF_ROUTE;
pub defF_ISO = AF_ISO;
pub defF_PIP = pseudo_AF_PIP;
pub defF_CHAOS = AF_CHAOS;
pub defF_DATAKIT = AF_DATAKIT;
pub defF_INET = AF_INET;
pub defF_APPLETALK = AF_APPLETALK;
pub defF_SIP = AF_SIP;
pub defF_OSI = AF_ISO;
pub defF_CNT = AF_CNT;
pub defF_LINK = AF_LINK;
pub defF_HYLINK = AF_HYLINK;
pub defF_MAX = AF_MAX;
pub defF_KEY = pseudo_AF_KEY;
pub defF_PUP = AF_PUP;
pub defF_COIP = AF_COIP;
pub defF_SNA = AF_SNA;
pub defF_LOCAL = AF_LOCAL;
pub defF_NETBIOS = AF_NETBIOS;
pub defF_NATM = AF_NATM;
pub defF_BLUETOOTH = AF_BLUETOOTH;
pub defF_UNSPEC = AF_UNSPEC;
pub defF_NETGRAPH = AF_NETGRAPH;
pub defF_ECMA = AF_ECMA;
pub defF_IPX = AF_IPX;
pub defF_DLI = AF_DLI;
pub defF_ATM = AF_ATM;
pub defF_CCITT = AF_CCITT;
pub defF_ISDN = AF_ISDN;
pub defF_RTIP = pseudo_AF_RTIP;
pub defF_LAT = AF_LAT;
pub defF_UNIX = PF_LOCAL;
pub defF_XTP = pseudo_AF_XTP;
pub defF_DECnet = AF_DECnet;

pub defF_UNSPEC = 0;
pub defF_OSI = AF_ISO;
pub defF_UNIX = AF_LOCAL;
pub defF_LOCAL = 1;
pub defF_INET = 2;
pub defF_IMPLINK = 3;
pub defF_PUP = 4;
pub defF_CHAOS = 5;
pub defF_NETBIOS = 6;
pub defF_ISO = 7;
pub defF_ECMA = 8;
pub defF_DATAKIT = 9;
pub defF_CCITT = 10;
pub defF_SNA = 11;
pub defF_DLI = 13;
pub defF_LAT = 14;
pub defF_HYLINK = 15;
pub defF_APPLETALK = 16;
pub defF_ROUTE = 17;
pub defF_LINK = 18;
pub defF_COIP = 20;
pub defF_CNT = 21;
pub defF_IPX = 23;
pub defF_SIP = 24;
pub defF_ISDN = 26;
pub defF_NATM = 29;
pub defF_ATM = 30;
pub defF_NETGRAPH = 32;
pub defF_BLUETOOTH = 33;
pub defF_MPLS = 34;
pub defF_MAX = 36;

pub defa_family_t = u8;
pub defocklen_t = c_uint;
pub defockaddr_storage = extern struct {
    ss_len: u8,
    ss_family: sa_family_t,
    __ss_pad1: [6]u8,
    __ss_align: i64,
    __ss_pad2: [112]u8,
};
pub defl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};
pub defsghdr = extern struct {
    msg_name: ?*c_void,
    msg_namelen: socklen_t,
    msg_iov: [*c]iovec,
    msg_iovlen: c_int,
    msg_control: ?*c_void,
    msg_controllen: socklen_t,
    msg_flags: c_int,
};
pub defmsghdr = extern struct {
    cmsg_len: socklen_t,
    cmsg_level: c_int,
    cmsg_type: c_int,
};
pub defmsgcred = extern struct {
    cmcred_pid: pid_t,
    cmcred_uid: uid_t,
    cmcred_euid: uid_t,
    cmcred_gid: gid_t,
    cmcred_ngroups: c_short,
    cmcred_groups: [16]gid_t,
};
pub deff_hdtr = extern struct {
    headers: [*c]iovec,
    hdr_cnt: c_int,
    trailers: [*c]iovec,
    trl_cnt: c_int,
};

pub defS_SYNC = 0;
pub defS_ASYNC = 1;
pub defS_INVALIDATE = 2;

pub defOSIX_MADV_SEQUENTIAL = 2;
pub defOSIX_MADV_RANDOM = 1;
pub defOSIX_MADV_DONTNEED = 4;
pub defOSIX_MADV_NORMAL = 0;
pub defOSIX_MADV_WILLNEED = 3;

pub defADV_SEQUENTIAL = 2;
pub defADV_CONTROL_END = MADV_SETMAP;
pub defADV_DONTNEED = 4;
pub defADV_RANDOM = 1;
pub defADV_WILLNEED = 3;
pub defADV_NORMAL = 0;
pub defADV_CONTROL_START = MADV_INVAL;
pub defADV_FREE = 5;
pub defADV_NOSYNC = 6;
pub defADV_AUTOSYNC = 7;
pub defADV_NOCORE = 8;
pub defADV_CORE = 9;
pub defADV_INVAL = 10;
pub defADV_SETMAP = 11;

pub def_DUPFD = 0;
pub def_GETFD = 1;
pub def_RDLCK = 1;
pub def_SETFD = 2;
pub def_UNLCK = 2;
pub def_WRLCK = 3;
pub def_GETFL = 3;
pub def_SETFL = 4;
pub def_GETOWN = 5;
pub def_SETOWN = 6;
pub def_GETLK = 7;
pub def_SETLK = 8;
pub def_SETLKW = 9;
pub def_DUP2FD = 10;
pub def_DUPFD_CLOEXEC = 17;
pub def_DUP2FD_CLOEXEC = 18;

pub defOCK_SH = 1;
pub defOCK_EX = 2;
pub defOCK_UN = 8;
pub defOCK_NB = 4;

pub deflock = extern struct {
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
    l_type: c_short,
    l_whence: c_short,
};
