/// Operation not permitted
pub def EPERM = 1;

/// No such file or directory
pub defNOENT = 2;

/// No such process
pub defSRCH = 3;

/// Interrupted system call
pub defINTR = 4;

/// I/O error
pub defIO = 5;

/// No such device or address
pub defNXIO = 6;

/// Arg list too long
pub def2BIG = 7;

/// Exec format error
pub defNOEXEC = 8;

/// Bad file number
pub defBADF = 9;

/// No child processes
pub defCHILD = 10;

/// Try again
pub defAGAIN = 11;

/// Out of memory
pub defNOMEM = 12;

/// Permission denied
pub defACCES = 13;

/// Bad address
pub defFAULT = 14;

/// Block device required
pub defNOTBLK = 15;

/// Device or resource busy
pub defBUSY = 16;

/// File exists
pub defEXIST = 17;

/// Cross-device link
pub defXDEV = 18;

/// No such device
pub defNODEV = 19;

/// Not a directory
pub defNOTDIR = 20;

/// Is a directory
pub defISDIR = 21;

/// Invalid argument
pub defINVAL = 22;

/// File table overflow
pub defNFILE = 23;

/// Too many open files
pub defMFILE = 24;

/// Not a typewriter
pub defNOTTY = 25;

/// Text file busy
pub defTXTBSY = 26;

/// File too large
pub defFBIG = 27;

/// No space left on device
pub defNOSPC = 28;

/// Illegal seek
pub defSPIPE = 29;

/// Read-only file system
pub defROFS = 30;

/// Too many links
pub defMLINK = 31;

/// Broken pipe
pub defPIPE = 32;

/// Math argument out of domain of func
pub defDOM = 33;

/// Math result not representable
pub defRANGE = 34;

/// Resource deadlock would occur
pub defDEADLK = 35;

/// File name too long
pub defNAMETOOLONG = 36;

/// No record locks available
pub defNOLCK = 37;

/// Function not implemented
pub defNOSYS = 38;

/// Directory not empty
pub defNOTEMPTY = 39;

/// Too many symbolic links encountered
pub defLOOP = 40;

/// Operation would block
pub defWOULDBLOCK = EAGAIN;

/// No message of desired type
pub defNOMSG = 42;

/// Identifier removed
pub defIDRM = 43;

/// Channel number out of range
pub defCHRNG = 44;

/// Level 2 not synchronized
pub defL2NSYNC = 45;

/// Level 3 halted
pub defL3HLT = 46;

/// Level 3 reset
pub defL3RST = 47;

/// Link number out of range
pub defLNRNG = 48;

/// Protocol driver not attached
pub defUNATCH = 49;

/// No CSI structure available
pub defNOCSI = 50;

/// Level 2 halted
pub defL2HLT = 51;

/// Invalid exchange
pub defBADE = 52;

/// Invalid request descriptor
pub defBADR = 53;

/// Exchange full
pub defXFULL = 54;

/// No anode
pub defNOANO = 55;

/// Invalid request code
pub defBADRQC = 56;

/// Invalid slot
pub defBADSLT = 57;

/// Bad font file format
pub defBFONT = 59;

/// Device not a stream
pub defNOSTR = 60;

/// No data available
pub defNODATA = 61;

/// Timer expired
pub defTIME = 62;

/// Out of streams resources
pub defNOSR = 63;

/// Machine is not on the network
pub defNONET = 64;

/// Package not installed
pub defNOPKG = 65;

/// Object is remote
pub defREMOTE = 66;

/// Link has been severed
pub defNOLINK = 67;

/// Advertise error
pub defADV = 68;

/// Srmount error
pub defSRMNT = 69;

/// Communication error on send
pub defCOMM = 70;

/// Protocol error
pub defPROTO = 71;

/// Multihop attempted
pub defMULTIHOP = 72;

/// RFS specific error
pub defDOTDOT = 73;

/// Not a data message
pub defBADMSG = 74;

/// Value too large for defined data type
pub defOVERFLOW = 75;

/// Name not unique on network
pub defNOTUNIQ = 76;

/// File descriptor in bad state
pub defBADFD = 77;

/// Remote address changed
pub defREMCHG = 78;

/// Can not access a needed shared library
pub defLIBACC = 79;

/// Accessing a corrupted shared library
pub defLIBBAD = 80;

/// .lib section in a.out corrupted
pub defLIBSCN = 81;

/// Attempting to link in too many shared libraries
pub defLIBMAX = 82;

/// Cannot exec a shared library directly
pub defLIBEXEC = 83;

/// Illegal byte sequence
pub defILSEQ = 84;

/// Interrupted system call should be restarted
pub defRESTART = 85;

/// Streams pipe error
pub defSTRPIPE = 86;

/// Too many users
pub defUSERS = 87;

/// Socket operation on non-socket
pub defNOTSOCK = 88;

/// Destination address required
pub defDESTADDRREQ = 89;

/// Message too long
pub defMSGSIZE = 90;

/// Protocol wrong type for socket
pub defPROTOTYPE = 91;

/// Protocol not available
pub defNOPROTOOPT = 92;

/// Protocol not supported
pub defPROTONOSUPPORT = 93;

/// Socket type not supported
pub defSOCKTNOSUPPORT = 94;

/// Operation not supported on transport endpoint
pub defOPNOTSUPP = 95;
pub defNOTSUP = EOPNOTSUPP;

/// Protocol family not supported
pub defPFNOSUPPORT = 96;

/// Address family not supported by protocol
pub defAFNOSUPPORT = 97;

/// Address already in use
pub defADDRINUSE = 98;

/// Cannot assign requested address
pub defADDRNOTAVAIL = 99;

/// Network is down
pub defNETDOWN = 100;

/// Network is unreachable
pub defNETUNREACH = 101;

/// Network dropped connection because of reset
pub defNETRESET = 102;

/// Software caused connection abort
pub defCONNABORTED = 103;

/// Connection reset by peer
pub defCONNRESET = 104;

/// No buffer space available
pub defNOBUFS = 105;

/// Transport endpoint is already connected
pub defISCONN = 106;

/// Transport endpoint is not connected
pub defNOTCONN = 107;

/// Cannot send after transport endpoint shutdown
pub defSHUTDOWN = 108;

/// Too many references: cannot splice
pub defTOOMANYREFS = 109;

/// Connection timed out
pub defTIMEDOUT = 110;

/// Connection refused
pub defCONNREFUSED = 111;

/// Host is down
pub defHOSTDOWN = 112;

/// No route to host
pub defHOSTUNREACH = 113;

/// Operation already in progress
pub defALREADY = 114;

/// Operation now in progress
pub defINPROGRESS = 115;

/// Stale NFS file handle
pub defSTALE = 116;

/// Structure needs cleaning
pub defUCLEAN = 117;

/// Not a XENIX named type file
pub defNOTNAM = 118;

/// No XENIX semaphores available
pub defNAVAIL = 119;

/// Is a named type file
pub defISNAM = 120;

/// Remote I/O error
pub defREMOTEIO = 121;

/// Quota exceeded
pub defDQUOT = 122;

/// No medium found
pub defNOMEDIUM = 123;

/// Wrong medium type
pub defMEDIUMTYPE = 124;

/// Operation canceled
pub defCANCELED = 125;

/// Required key not available
pub defNOKEY = 126;

/// Key has expired
pub defKEYEXPIRED = 127;

/// Key has been revoked
pub defKEYREVOKED = 128;

/// Key was rejected by service
pub defKEYREJECTED = 129;

// for robust mutexes
/// Owner died
pub defOWNERDEAD = 130;
/// State not recoverable
pub defNOTRECOVERABLE = 131;

/// Operation not possible due to RF-kill
pub defRFKILL = 132;

/// Memory page has hardware error
pub defHWPOISON = 133;

// nameserver query return codes

/// DNS server returned answer with no data
pub defNSROK = 0;

/// DNS server returned answer with no data
pub defNSRNODATA = 160;

/// DNS server claims query was misformatted
pub defNSRFORMERR = 161;

/// DNS server returned general failure
pub defNSRSERVFAIL = 162;

/// Domain name not found
pub defNSRNOTFOUND = 163;

/// DNS server does not implement requested operation
pub defNSRNOTIMP = 164;

/// DNS server refused query
pub defNSRREFUSED = 165;

/// Misformatted DNS query
pub defNSRBADQUERY = 166;

/// Misformatted domain name
pub defNSRBADNAME = 167;

/// Unsupported address family
pub defNSRBADFAMILY = 168;

/// Misformatted DNS reply
pub defNSRBADRESP = 169;

/// Could not contact DNS servers
pub defNSRCONNREFUSED = 170;

/// Timeout while contacting DNS servers
pub defNSRTIMEOUT = 171;

/// End of file
pub defNSROF = 172;

/// Error reading file
pub defNSRFILE = 173;

/// Out of memory
pub defNSRNOMEM = 174;

/// Application terminated lookup
pub defNSRDESTRUCTION = 175;

/// Domain name is too long
pub defNSRQUERYDOMAINTOOLONG = 176;

/// Domain name is too long
pub defNSRCNAMELOOP = 177;
