/// Operation not permitted
pub def EPERM = 1;

/// No such file or directory
pub def ENOENT = 2;

/// No such process
pub def ESRCH = 3;

/// Interrupted system call
pub def EINTR = 4;

/// I/O error
pub def EIO = 5;

/// No such device or address
pub def ENXIO = 6;

/// Arg list too long
pub def E2BIG = 7;

/// Exec format error
pub def ENOEXEC = 8;

/// Bad file number
pub def EBADF = 9;

/// No child processes
pub def ECHILD = 10;

/// Try again
pub def EAGAIN = 11;

/// Out of memory
pub def ENOMEM = 12;

/// Permission denied
pub def EACCES = 13;

/// Bad address
pub def EFAULT = 14;

/// Block device required
pub def ENOTBLK = 15;

/// Device or resource busy
pub def EBUSY = 16;

/// File exists
pub def EEXIST = 17;

/// Cross-device link
pub def EXDEV = 18;

/// No such device
pub def ENODEV = 19;

/// Not a directory
pub def ENOTDIR = 20;

/// Is a directory
pub def EISDIR = 21;

/// Invalid argument
pub def EINVAL = 22;

/// File table overflow
pub def ENFILE = 23;

/// Too many open files
pub def EMFILE = 24;

/// Not a typewriter
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
pub def EPIPE = 32;

/// Math argument out of domain of func
pub def EDOM = 33;

/// Math result not representable
pub def ERANGE = 34;

/// Resource deadlock would occur
pub def EDEADLK = 35;

/// File name too long
pub def ENAMETOOLONG = 36;

/// No record locks available
pub def ENOLCK = 37;

/// Function not implemented
pub def ENOSYS = 38;

/// Directory not empty
pub def ENOTEMPTY = 39;

/// Too many symbolic links encountered
pub def ELOOP = 40;

/// Operation would block
pub def EWOULDBLOCK = EAGAIN;

/// No message of desired type
pub def ENOMSG = 42;

/// Identifier removed
pub def EIDRM = 43;

/// Channel number out of range
pub def ECHRNG = 44;

/// Level 2 not synchronized
pub def EL2NSYNC = 45;

/// Level 3 halted
pub def EL3HLT = 46;

/// Level 3 reset
pub def EL3RST = 47;

/// Link number out of range
pub def ELNRNG = 48;

/// Protocol driver not attached
pub def EUNATCH = 49;

/// No CSI structure available
pub def ENOCSI = 50;

/// Level 2 halted
pub def EL2HLT = 51;

/// Invalid exchange
pub def EBADE = 52;

/// Invalid request descriptor
pub def EBADR = 53;

/// Exchange full
pub def EXFULL = 54;

/// No anode
pub def ENOANO = 55;

/// Invalid request code
pub def EBADRQC = 56;

/// Invalid slot
pub def EBADSLT = 57;

/// Bad font file format
pub def EBFONT = 59;

/// Device not a stream
pub def ENOSTR = 60;

/// No data available
pub def ENODATA = 61;

/// Timer expired
pub def ETIME = 62;

/// Out of streams resources
pub def ENOSR = 63;

/// Machine is not on the network
pub def ENONET = 64;

/// Package not installed
pub def ENOPKG = 65;

/// Object is remote
pub def EREMOTE = 66;

/// Link has been severed
pub def ENOLINK = 67;

/// Advertise error
pub def EADV = 68;

/// Srmount error
pub def ESRMNT = 69;

/// Communication error on send
pub def ECOMM = 70;

/// Protocol error
pub def EPROTO = 71;

/// Multihop attempted
pub def EMULTIHOP = 72;

/// RFS specific error
pub def EDOTDOT = 73;

/// Not a data message
pub def EBADMSG = 74;

/// Value too large for defined data type
pub def EOVERFLOW = 75;

/// Name not unique on network
pub def ENOTUNIQ = 76;

/// File descriptor in bad state
pub def EBADFD = 77;

/// Remote address changed
pub def EREMCHG = 78;

/// Can not access a needed shared library
pub def ELIBACC = 79;

/// Accessing a corrupted shared library
pub def ELIBBAD = 80;

/// .lib section in a.out corrupted
pub def ELIBSCN = 81;

/// Attempting to link in too many shared libraries
pub def ELIBMAX = 82;

/// Cannot exec a shared library directly
pub def ELIBEXEC = 83;

/// Illegal byte sequence
pub def EILSEQ = 84;

/// Interrupted system call should be restarted
pub def ERESTART = 85;

/// Streams pipe error
pub def ESTRPIPE = 86;

/// Too many users
pub def EUSERS = 87;

/// Socket operation on non-socket
pub def ENOTSOCK = 88;

/// Destination address required
pub def EDESTADDRREQ = 89;

/// Message too long
pub def EMSGSIZE = 90;

/// Protocol wrong type for socket
pub def EPROTOTYPE = 91;

/// Protocol not available
pub def ENOPROTOOPT = 92;

/// Protocol not supported
pub def EPROTONOSUPPORT = 93;

/// Socket type not supported
pub def ESOCKTNOSUPPORT = 94;

/// Operation not supported on transport endpoint
pub def EOPNOTSUPP = 95;
pub def ENOTSUP = EOPNOTSUPP;

/// Protocol family not supported
pub def EPFNOSUPPORT = 96;

/// Address family not supported by protocol
pub def EAFNOSUPPORT = 97;

/// Address already in use
pub def EADDRINUSE = 98;

/// Cannot assign requested address
pub def EADDRNOTAVAIL = 99;

/// Network is down
pub def ENETDOWN = 100;

/// Network is unreachable
pub def ENETUNREACH = 101;

/// Network dropped connection because of reset
pub def ENETRESET = 102;

/// Software caused connection abort
pub def ECONNABORTED = 103;

/// Connection reset by peer
pub def ECONNRESET = 104;

/// No buffer space available
pub def ENOBUFS = 105;

/// Transport endpoint is already connected
pub def EISCONN = 106;

/// Transport endpoint is not connected
pub def ENOTCONN = 107;

/// Cannot send after transport endpoint shutdown
pub def ESHUTDOWN = 108;

/// Too many references: cannot splice
pub def ETOOMANYREFS = 109;

/// Connection timed out
pub def ETIMEDOUT = 110;

/// Connection refused
pub def ECONNREFUSED = 111;

/// Host is down
pub def EHOSTDOWN = 112;

/// No route to host
pub def EHOSTUNREACH = 113;

/// Operation already in progress
pub def EALREADY = 114;

/// Operation now in progress
pub def EINPROGRESS = 115;

/// Stale NFS file handle
pub def ESTALE = 116;

/// Structure needs cleaning
pub def EUCLEAN = 117;

/// Not a XENIX named type file
pub def ENOTNAM = 118;

/// No XENIX semaphores available
pub def ENAVAIL = 119;

/// Is a named type file
pub def EISNAM = 120;

/// Remote I/O error
pub def EREMOTEIO = 121;

/// Quota exceeded
pub def EDQUOT = 122;

/// No medium found
pub def ENOMEDIUM = 123;

/// Wrong medium type
pub def EMEDIUMTYPE = 124;

/// Operation canceled
pub def ECANCELED = 125;

/// Required key not available
pub def ENOKEY = 126;

/// Key has expired
pub def EKEYEXPIRED = 127;

/// Key has been revoked
pub def EKEYREVOKED = 128;

/// Key was rejected by service
pub def EKEYREJECTED = 129;

// for robust mutexes
/// Owner died
pub def EOWNERDEAD = 130;
/// State not recoverable
pub def ENOTRECOVERABLE = 131;

/// Operation not possible due to RF-kill
pub def ERFKILL = 132;

/// Memory page has hardware error
pub def EHWPOISON = 133;

// nameserver query return codes

/// DNS server returned answer with no data
pub def ENSROK = 0;

/// DNS server returned answer with no data
pub def ENSRNODATA = 160;

/// DNS server claims query was misformatted
pub def ENSRFORMERR = 161;

/// DNS server returned general failure
pub def ENSRSERVFAIL = 162;

/// Domain name not found
pub def ENSRNOTFOUND = 163;

/// DNS server does not implement requested operation
pub def ENSRNOTIMP = 164;

/// DNS server refused query
pub def ENSRREFUSED = 165;

/// Misformatted DNS query
pub def ENSRBADQUERY = 166;

/// Misformatted domain name
pub def ENSRBADNAME = 167;

/// Unsupported address family
pub def ENSRBADFAMILY = 168;

/// Misformatted DNS reply
pub def ENSRBADRESP = 169;

/// Could not contact DNS servers
pub def ENSRCONNREFUSED = 170;

/// Timeout while contacting DNS servers
pub def ENSRTIMEOUT = 171;

/// End of file
pub def ENSROF = 172;

/// Error reading file
pub def ENSRFILE = 173;

/// Out of memory
pub def ENSRNOMEM = 174;

/// Application terminated lookup
pub def ENSRDESTRUCTION = 175;

/// Domain name is too long
pub def ENSRQUERYDOMAINTOOLONG = 176;

/// Domain name is too long
pub def ENSRCNAMELOOP = 177;
