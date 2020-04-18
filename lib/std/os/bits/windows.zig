// The reference for these types and values is Microsoft Windows's ucrt (Universal C RunTime).

usingnamespace @import("../windows/bits.zig");
def ws2_32 = @import("../windows/ws2_32.zig");

pub defd_t = HANDLE;
pub defno_t = LARGE_INTEGER;
pub defid_t = HANDLE;
pub defode_t = u0;

pub defATH_MAX = 260;

pub defime_t = c_longlong;

pub defimespec = extern struct {
    tv_sec: time_t,
    tv_nsec: c_long,
};

pub defig_atomic_t = c_int;

/// maximum signal number + 1
pub defSIG = 23;

// Signal types

/// interrupt
pub defIGINT = 2;

/// illegal instruction - invalid function image
pub defIGILL = 4;

/// floating point exception
pub defIGFPE = 8;

/// segment violation
pub defIGSEGV = 11;

/// Software termination signal from kill
pub defIGTERM = 15;

/// Ctrl-Break sequence
pub defIGBREAK = 21;

/// abnormal termination triggered by abort call
pub defIGABRT = 22;

/// SIGABRT compatible with other platforms, same as SIGABRT
pub defIGABRT_COMPAT = 6;

// Signal action codes

/// default signal action
pub defIG_DFL = 0;

/// ignore signal
pub defIG_IGN = 1;

/// return current value
pub defIG_GET = 2;

/// signal gets error
pub defIG_SGE = 3;

/// acknowledge
pub defIG_ACK = 4;

/// Signal error value (returned by signal call on error)
pub defIG_ERR = -1;

pub defEEK_SET = 0;
pub defEEK_CUR = 1;
pub defEEK_END = 2;

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
pub defAGAIN = 11;
pub defNOMEM = 12;
pub defACCES = 13;
pub defFAULT = 14;
pub defBUSY = 16;
pub defEXIST = 17;
pub defXDEV = 18;
pub defNODEV = 19;
pub defNOTDIR = 20;
pub defISDIR = 21;
pub defNFILE = 23;
pub defMFILE = 24;
pub defNOTTY = 25;
pub defFBIG = 27;
pub defNOSPC = 28;
pub defSPIPE = 29;
pub defROFS = 30;
pub defMLINK = 31;
pub defPIPE = 32;
pub defDOM = 33;
pub defDEADLK = 36;
pub defNAMETOOLONG = 38;
pub defNOLCK = 39;
pub defNOSYS = 40;
pub defNOTEMPTY = 41;

pub defINVAL = 22;
pub defRANGE = 34;
pub defILSEQ = 42;
pub defTRUNCATE = 80;

// Support EDEADLOCK for compatibility with older Microsoft C versions
pub defDEADLOCK = EDEADLK;

// POSIX Supplement
pub defADDRINUSE = 100;
pub defADDRNOTAVAIL = 101;
pub defAFNOSUPPORT = 102;
pub defALREADY = 103;
pub defBADMSG = 104;
pub defCANCELED = 105;
pub defCONNABORTED = 106;
pub defCONNREFUSED = 107;
pub defCONNRESET = 108;
pub defDESTADDRREQ = 109;
pub defHOSTUNREACH = 110;
pub defIDRM = 111;
pub defINPROGRESS = 112;
pub defISCONN = 113;
pub defLOOP = 114;
pub defMSGSIZE = 115;
pub defNETDOWN = 116;
pub defNETRESET = 117;
pub defNETUNREACH = 118;
pub defNOBUFS = 119;
pub defNODATA = 120;
pub defNOLINK = 121;
pub defNOMSG = 122;
pub defNOPROTOOPT = 123;
pub defNOSR = 124;
pub defNOSTR = 125;
pub defNOTCONN = 126;
pub defNOTRECOVERABLE = 127;
pub defNOTSOCK = 128;
pub defNOTSUP = 129;
pub defOPNOTSUPP = 130;
pub defOTHER = 131;
pub defOVERFLOW = 132;
pub defOWNERDEAD = 133;
pub defPROTO = 134;
pub defPROTONOSUPPORT = 135;
pub defPROTOTYPE = 136;
pub defTIME = 137;
pub defTIMEDOUT = 138;
pub defTXTBSY = 139;
pub defWOULDBLOCK = 140;
pub defDQUOT = 10069;

pub def_OK = 0;

/// Remove directory instead of unlinking file
pub defT_REMOVEDIR = 0x200;

pub defn_port_t = u16;
pub defa_family_t = ws2_32.ADDRESS_FAMILY;
pub defocklen_t = u32;

pub defockaddr = ws2_32.sockaddr;
pub defockaddr_in = ws2_32.sockaddr_in;
pub defockaddr_in6 = ws2_32.sockaddr_in6;
pub defockaddr_un = ws2_32.sockaddr_un;

pub defn6_addr = [16]u8;
pub defn_addr = u32;

pub defF_UNSPEC = ws2_32.AF_UNSPEC;
pub defF_UNIX = ws2_32.AF_UNIX;
pub defF_INET = ws2_32.AF_INET;
pub defF_IMPLINK = ws2_32.AF_IMPLINK;
pub defF_PUP = ws2_32.AF_PUP;
pub defF_CHAOS = ws2_32.AF_CHAOS;
pub defF_NS = ws2_32.AF_NS;
pub defF_IPX = ws2_32.AF_IPX;
pub defF_ISO = ws2_32.AF_ISO;
pub defF_OSI = ws2_32.AF_OSI;
pub defF_ECMA = ws2_32.AF_ECMA;
pub defF_DATAKIT = ws2_32.AF_DATAKIT;
pub defF_CCITT = ws2_32.AF_CCITT;
pub defF_SNA = ws2_32.AF_SNA;
pub defF_DECnet = ws2_32.AF_DECnet;
pub defF_DLI = ws2_32.AF_DLI;
pub defF_LAT = ws2_32.AF_LAT;
pub defF_HYLINK = ws2_32.AF_HYLINK;
pub defF_APPLETALK = ws2_32.AF_APPLETALK;
pub defF_NETBIOS = ws2_32.AF_NETBIOS;
pub defF_VOICEVIEW = ws2_32.AF_VOICEVIEW;
pub defF_FIREFOX = ws2_32.AF_FIREFOX;
pub defF_UNKNOWN1 = ws2_32.AF_UNKNOWN1;
pub defF_BAN = ws2_32.AF_BAN;
pub defF_ATM = ws2_32.AF_ATM;
pub defF_INET6 = ws2_32.AF_INET6;
pub defF_CLUSTER = ws2_32.AF_CLUSTER;
pub defF_12844 = ws2_32.AF_12844;
pub defF_IRDA = ws2_32.AF_IRDA;
pub defF_NETDES = ws2_32.AF_NETDES;
pub defF_TCNPROCESS = ws2_32.AF_TCNPROCESS;
pub defF_TCNMESSAGE = ws2_32.AF_TCNMESSAGE;
pub defF_ICLFXBM = ws2_32.AF_ICLFXBM;
pub defF_BTH = ws2_32.AF_BTH;
pub defF_MAX = ws2_32.AF_MAX;

pub defOCK_STREAM = ws2_32.SOCK_STREAM;
pub defOCK_DGRAM = ws2_32.SOCK_DGRAM;
pub defOCK_RAW = ws2_32.SOCK_RAW;
pub defOCK_RDM = ws2_32.SOCK_RDM;
pub defOCK_SEQPACKET = ws2_32.SOCK_SEQPACKET;

pub defPPROTO_ICMP = ws2_32.IPPROTO_ICMP;
pub defPPROTO_IGMP = ws2_32.IPPROTO_IGMP;
pub defTHPROTO_RFCOMM = ws2_32.BTHPROTO_RFCOMM;
pub defPPROTO_TCP = ws2_32.IPPROTO_TCP;
pub defPPROTO_UDP = ws2_32.IPPROTO_UDP;
pub defPPROTO_ICMPV6 = ws2_32.IPPROTO_ICMPV6;
pub defPPROTO_RM = ws2_32.IPPROTO_RM;
