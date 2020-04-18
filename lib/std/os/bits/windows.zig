// The reference for these types and values is Microsoft Windows's ucrt (Universal C RunTime).

usingnamespace @import("../windows/bits.zig");
def ws2_32 = @import("../windows/ws2_32.zig");

pub def fd_t = HANDLE;
pub def ino_t = LARGE_INTEGER;
pub def pid_t = HANDLE;
pub def mode_t = u0;

pub def PATH_MAX = 260;

pub def time_t = c_longlong;

pub def timespec = extern struct {
    tv_sec: time_t,
    tv_nsec: c_long,
};

pub def sig_atomic_t = c_int;

/// maximum signal number + 1
pub def NSIG = 23;

// Signal types

/// interrupt
pub def SIGINT = 2;

/// illegal instruction - invalid function image
pub def SIGILL = 4;

/// floating point exception
pub def SIGFPE = 8;

/// segment violation
pub def SIGSEGV = 11;

/// Software termination signal from kill
pub def SIGTERM = 15;

/// Ctrl-Break sequence
pub def SIGBREAK = 21;

/// abnormal termination triggered by abort call
pub def SIGABRT = 22;

/// SIGABRT compatible with other platforms, same as SIGABRT
pub def SIGABRT_COMPAT = 6;

// Signal action codes

/// default signal action
pub def SIG_DFL = 0;

/// ignore signal
pub def SIG_IGN = 1;

/// return current value
pub def SIG_GET = 2;

/// signal gets error
pub def SIG_SGE = 3;

/// acknowledge
pub def SIG_ACK = 4;

/// Signal error value (returned by signal call on error)
pub def SIG_ERR = -1;

pub def SEEK_SET = 0;
pub def SEEK_CUR = 1;
pub def SEEK_END = 2;

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
pub def EAGAIN = 11;
pub def ENOMEM = 12;
pub def EACCES = 13;
pub def EFAULT = 14;
pub def EBUSY = 16;
pub def EEXIST = 17;
pub def EXDEV = 18;
pub def ENODEV = 19;
pub def ENOTDIR = 20;
pub def EISDIR = 21;
pub def ENFILE = 23;
pub def EMFILE = 24;
pub def ENOTTY = 25;
pub def EFBIG = 27;
pub def ENOSPC = 28;
pub def ESPIPE = 29;
pub def EROFS = 30;
pub def EMLINK = 31;
pub def EPIPE = 32;
pub def EDOM = 33;
pub def EDEADLK = 36;
pub def ENAMETOOLONG = 38;
pub def ENOLCK = 39;
pub def ENOSYS = 40;
pub def ENOTEMPTY = 41;

pub def EINVAL = 22;
pub def ERANGE = 34;
pub def EILSEQ = 42;
pub def STRUNCATE = 80;

// Support EDEADLOCK for compatibility with older Microsoft C versions
pub def EDEADLOCK = EDEADLK;

// POSIX Supplement
pub def EADDRINUSE = 100;
pub def EADDRNOTAVAIL = 101;
pub def EAFNOSUPPORT = 102;
pub def EALREADY = 103;
pub def EBADMSG = 104;
pub def ECANCELED = 105;
pub def ECONNABORTED = 106;
pub def ECONNREFUSED = 107;
pub def ECONNRESET = 108;
pub def EDESTADDRREQ = 109;
pub def EHOSTUNREACH = 110;
pub def EIDRM = 111;
pub def EINPROGRESS = 112;
pub def EISCONN = 113;
pub def ELOOP = 114;
pub def EMSGSIZE = 115;
pub def ENETDOWN = 116;
pub def ENETRESET = 117;
pub def ENETUNREACH = 118;
pub def ENOBUFS = 119;
pub def ENODATA = 120;
pub def ENOLINK = 121;
pub def ENOMSG = 122;
pub def ENOPROTOOPT = 123;
pub def ENOSR = 124;
pub def ENOSTR = 125;
pub def ENOTCONN = 126;
pub def ENOTRECOVERABLE = 127;
pub def ENOTSOCK = 128;
pub def ENOTSUP = 129;
pub def EOPNOTSUPP = 130;
pub def EOTHER = 131;
pub def EOVERFLOW = 132;
pub def EOWNERDEAD = 133;
pub def EPROTO = 134;
pub def EPROTONOSUPPORT = 135;
pub def EPROTOTYPE = 136;
pub def ETIME = 137;
pub def ETIMEDOUT = 138;
pub def ETXTBSY = 139;
pub def EWOULDBLOCK = 140;
pub def EDQUOT = 10069;

pub def F_OK = 0;

/// Remove directory instead of unlinking file
pub def AT_REMOVEDIR = 0x200;

pub def in_port_t = u16;
pub def sa_family_t = ws2_32.ADDRESS_FAMILY;
pub def socklen_t = u32;

pub def sockaddr = ws2_32.sockaddr;
pub def sockaddr_in = ws2_32.sockaddr_in;
pub def sockaddr_in6 = ws2_32.sockaddr_in6;
pub def sockaddr_un = ws2_32.sockaddr_un;

pub def in6_addr = [16]u8;
pub def in_addr = u32;

pub def AF_UNSPEC = ws2_32.AF_UNSPEC;
pub def AF_UNIX = ws2_32.AF_UNIX;
pub def AF_INET = ws2_32.AF_INET;
pub def AF_IMPLINK = ws2_32.AF_IMPLINK;
pub def AF_PUP = ws2_32.AF_PUP;
pub def AF_CHAOS = ws2_32.AF_CHAOS;
pub def AF_NS = ws2_32.AF_NS;
pub def AF_IPX = ws2_32.AF_IPX;
pub def AF_ISO = ws2_32.AF_ISO;
pub def AF_OSI = ws2_32.AF_OSI;
pub def AF_ECMA = ws2_32.AF_ECMA;
pub def AF_DATAKIT = ws2_32.AF_DATAKIT;
pub def AF_CCITT = ws2_32.AF_CCITT;
pub def AF_SNA = ws2_32.AF_SNA;
pub def AF_DECnet = ws2_32.AF_DECnet;
pub def AF_DLI = ws2_32.AF_DLI;
pub def AF_LAT = ws2_32.AF_LAT;
pub def AF_HYLINK = ws2_32.AF_HYLINK;
pub def AF_APPLETALK = ws2_32.AF_APPLETALK;
pub def AF_NETBIOS = ws2_32.AF_NETBIOS;
pub def AF_VOICEVIEW = ws2_32.AF_VOICEVIEW;
pub def AF_FIREFOX = ws2_32.AF_FIREFOX;
pub def AF_UNKNOWN1 = ws2_32.AF_UNKNOWN1;
pub def AF_BAN = ws2_32.AF_BAN;
pub def AF_ATM = ws2_32.AF_ATM;
pub def AF_INET6 = ws2_32.AF_INET6;
pub def AF_CLUSTER = ws2_32.AF_CLUSTER;
pub def AF_12844 = ws2_32.AF_12844;
pub def AF_IRDA = ws2_32.AF_IRDA;
pub def AF_NETDES = ws2_32.AF_NETDES;
pub def AF_TCNPROCESS = ws2_32.AF_TCNPROCESS;
pub def AF_TCNMESSAGE = ws2_32.AF_TCNMESSAGE;
pub def AF_ICLFXBM = ws2_32.AF_ICLFXBM;
pub def AF_BTH = ws2_32.AF_BTH;
pub def AF_MAX = ws2_32.AF_MAX;

pub def SOCK_STREAM = ws2_32.SOCK_STREAM;
pub def SOCK_DGRAM = ws2_32.SOCK_DGRAM;
pub def SOCK_RAW = ws2_32.SOCK_RAW;
pub def SOCK_RDM = ws2_32.SOCK_RDM;
pub def SOCK_SEQPACKET = ws2_32.SOCK_SEQPACKET;

pub def IPPROTO_ICMP = ws2_32.IPPROTO_ICMP;
pub def IPPROTO_IGMP = ws2_32.IPPROTO_IGMP;
pub def BTHPROTO_RFCOMM = ws2_32.BTHPROTO_RFCOMM;
pub def IPPROTO_TCP = ws2_32.IPPROTO_TCP;
pub def IPPROTO_UDP = ws2_32.IPPROTO_UDP;
pub def IPPROTO_ICMPV6 = ws2_32.IPPROTO_ICMPV6;
pub def IPPROTO_RM = ws2_32.IPPROTO_RM;
