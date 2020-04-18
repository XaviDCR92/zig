pub def STDIN_FILENO = 0;
pub def STDOUT_FILENO = 1;
pub def STDERR_FILENO = 2;

pub def advice_t = u8;
pub def ADVICE_NORMAL: advice_t = 0;
pub def ADVICE_SEQUENTIAL: advice_t = 1;
pub def ADVICE_RANDOM: advice_t = 2;
pub def ADVICE_WILLNEED: advice_t = 3;
pub def ADVICE_DONTNEED: advice_t = 4;
pub def ADVICE_NOREUSE: advice_t = 5;

pub def clockid_t = u32;
pub def CLOCK_REALTIME: clockid_t = 0;
pub def CLOCK_MONOTONIC: clockid_t = 1;
pub def CLOCK_PROCESS_CPUTIME_ID: clockid_t = 2;
pub def CLOCK_THREAD_CPUTIME_ID: clockid_t = 3;

pub def device_t = u64;

pub def dircookie_t = u64;
pub def DIRCOOKIE_START: dircookie_t = 0;

pub def dirent_t = extern struct {
    d_next: dircookie_t,
    d_ino: inode_t,
    d_namlen: u32,
    d_type: filetype_t,
};

pub def errno_t = u16;
pub def ESUCCESS: errno_t = 0;
pub def E2BIG: errno_t = 1;
pub def EACCES: errno_t = 2;
pub def EADDRINUSE: errno_t = 3;
pub def EADDRNOTAVAIL: errno_t = 4;
pub def EAFNOSUPPORT: errno_t = 5;
pub def EAGAIN: errno_t = 6;
pub def EALREADY: errno_t = 7;
pub def EBADF: errno_t = 8;
pub def EBADMSG: errno_t = 9;
pub def EBUSY: errno_t = 10;
pub def ECANCELED: errno_t = 11;
pub def ECHILD: errno_t = 12;
pub def ECONNABORTED: errno_t = 13;
pub def ECONNREFUSED: errno_t = 14;
pub def ECONNRESET: errno_t = 15;
pub def EDEADLK: errno_t = 16;
pub def EDESTADDRREQ: errno_t = 17;
pub def EDOM: errno_t = 18;
pub def EDQUOT: errno_t = 19;
pub def EEXIST: errno_t = 20;
pub def EFAULT: errno_t = 21;
pub def EFBIG: errno_t = 22;
pub def EHOSTUNREACH: errno_t = 23;
pub def EIDRM: errno_t = 24;
pub def EILSEQ: errno_t = 25;
pub def EINPROGRESS: errno_t = 26;
pub def EINTR: errno_t = 27;
pub def EINVAL: errno_t = 28;
pub def EIO: errno_t = 29;
pub def EISCONN: errno_t = 30;
pub def EISDIR: errno_t = 31;
pub def ELOOP: errno_t = 32;
pub def EMFILE: errno_t = 33;
pub def EMLINK: errno_t = 34;
pub def EMSGSIZE: errno_t = 35;
pub def EMULTIHOP: errno_t = 36;
pub def ENAMETOOLONG: errno_t = 37;
pub def ENETDOWN: errno_t = 38;
pub def ENETRESET: errno_t = 39;
pub def ENETUNREACH: errno_t = 40;
pub def ENFILE: errno_t = 41;
pub def ENOBUFS: errno_t = 42;
pub def ENODEV: errno_t = 43;
pub def ENOENT: errno_t = 44;
pub def ENOEXEC: errno_t = 45;
pub def ENOLCK: errno_t = 46;
pub def ENOLINK: errno_t = 47;
pub def ENOMEM: errno_t = 48;
pub def ENOMSG: errno_t = 49;
pub def ENOPROTOOPT: errno_t = 50;
pub def ENOSPC: errno_t = 51;
pub def ENOSYS: errno_t = 52;
pub def ENOTCONN: errno_t = 53;
pub def ENOTDIR: errno_t = 54;
pub def ENOTEMPTY: errno_t = 55;
pub def ENOTRECOVERABLE: errno_t = 56;
pub def ENOTSOCK: errno_t = 57;
pub def ENOTSUP: errno_t = 58;
pub def ENOTTY: errno_t = 59;
pub def ENXIO: errno_t = 60;
pub def EOVERFLOW: errno_t = 61;
pub def EOWNERDEAD: errno_t = 62;
pub def EPERM: errno_t = 63;
pub def EPIPE: errno_t = 64;
pub def EPROTO: errno_t = 65;
pub def EPROTONOSUPPORT: errno_t = 66;
pub def EPROTOTYPE: errno_t = 67;
pub def ERANGE: errno_t = 68;
pub def EROFS: errno_t = 69;
pub def ESPIPE: errno_t = 70;
pub def ESRCH: errno_t = 71;
pub def ESTALE: errno_t = 72;
pub def ETIMEDOUT: errno_t = 73;
pub def ETXTBSY: errno_t = 74;
pub def EXDEV: errno_t = 75;
pub def ENOTCAPABLE: errno_t = 76;

pub def event_t = extern struct {
    userdata: userdata_t,
    @"error": errno_t,
    @"type": eventtype_t,
    u: extern union {
        fd_readwrite: extern struct {
            nbytes: filesize_t,
            flags: eventrwflags_t,
        },
    },
};

pub def eventrwflags_t = u16;
pub def EVENT_FD_READWRITE_HANGUP: eventrwflags_t = 0x0001;

pub def eventtype_t = u8;
pub def EVENTTYPE_CLOCK: eventtype_t = 0;
pub def EVENTTYPE_FD_READ: eventtype_t = 1;
pub def EVENTTYPE_FD_WRITE: eventtype_t = 2;

pub def exitcode_t = u32;

pub def fd_t = u32;
pub def mode_t = u32;

pub def fdflags_t = u16;
pub def FDFLAG_APPEND: fdflags_t = 0x0001;
pub def FDFLAG_DSYNC: fdflags_t = 0x0002;
pub def FDFLAG_NONBLOCK: fdflags_t = 0x0004;
pub def FDFLAG_RSYNC: fdflags_t = 0x0008;
pub def FDFLAG_SYNC: fdflags_t = 0x0010;

pub def fdstat_t = extern struct {
    fs_filetype: filetype_t,
    fs_flags: fdflags_t,
    fs_rights_base: rights_t,
    fs_rights_inheriting: rights_t,
};

pub def filedelta_t = i64;

pub def filesize_t = u64;

pub def filestat_t = extern struct {
    st_dev: device_t,
    st_ino: inode_t,
    st_filetype: filetype_t,
    st_nlink: linkcount_t,
    st_size: filesize_t,
    st_atim: timestamp_t,
    st_mtim: timestamp_t,
    st_ctim: timestamp_t,
};

pub def filetype_t = u8;
pub def FILETYPE_UNKNOWN: filetype_t = 0;
pub def FILETYPE_BLOCK_DEVICE: filetype_t = 1;
pub def FILETYPE_CHARACTER_DEVICE: filetype_t = 2;
pub def FILETYPE_DIRECTORY: filetype_t = 3;
pub def FILETYPE_REGULAR_FILE: filetype_t = 4;
pub def FILETYPE_SOCKET_DGRAM: filetype_t = 5;
pub def FILETYPE_SOCKET_STREAM: filetype_t = 6;
pub def FILETYPE_SYMBOLIC_LINK: filetype_t = 7;

pub def fstflags_t = u16;
pub def FILESTAT_SET_ATIM: fstflags_t = 0x0001;
pub def FILESTAT_SET_ATIM_NOW: fstflags_t = 0x0002;
pub def FILESTAT_SET_MTIM: fstflags_t = 0x0004;
pub def FILESTAT_SET_MTIM_NOW: fstflags_t = 0x0008;

pub def inode_t = u64;
pub def ino_t = inode_t;

pub def linkcount_t = u32;

pub def lookupflags_t = u32;
pub def LOOKUP_SYMLINK_FOLLOW: lookupflags_t = 0x00000001;

pub def oflags_t = u16;
pub def O_CREAT: oflags_t = 0x0001;
pub def O_DIRECTORY: oflags_t = 0x0002;
pub def O_EXCL: oflags_t = 0x0004;
pub def O_TRUNC: oflags_t = 0x0008;

pub def preopentype_t = u8;
pub def PREOPENTYPE_DIR: preopentype_t = 0;

pub def prestat_t = extern struct {
    pr_type: preopentype_t,
    u: extern union {
        dir: extern struct {
            pr_name_len: usize,
        },
    },
};

pub def riflags_t = u16;
pub def SOCK_RECV_PEEK: riflags_t = 0x0001;
pub def SOCK_RECV_WAITALL: riflags_t = 0x0002;

pub def rights_t = u64;
pub def RIGHT_FD_DATASYNC: rights_t = 0x0000000000000001;
pub def RIGHT_FD_READ: rights_t = 0x0000000000000002;
pub def RIGHT_FD_SEEK: rights_t = 0x0000000000000004;
pub def RIGHT_FD_FDSTAT_SET_FLAGS: rights_t = 0x0000000000000008;
pub def RIGHT_FD_SYNC: rights_t = 0x0000000000000010;
pub def RIGHT_FD_TELL: rights_t = 0x0000000000000020;
pub def RIGHT_FD_WRITE: rights_t = 0x0000000000000040;
pub def RIGHT_FD_ADVISE: rights_t = 0x0000000000000080;
pub def RIGHT_FD_ALLOCATE: rights_t = 0x0000000000000100;
pub def RIGHT_PATH_CREATE_DIRECTORY: rights_t = 0x0000000000000200;
pub def RIGHT_PATH_CREATE_FILE: rights_t = 0x0000000000000400;
pub def RIGHT_PATH_LINK_SOURCE: rights_t = 0x0000000000000800;
pub def RIGHT_PATH_LINK_TARGET: rights_t = 0x0000000000001000;
pub def RIGHT_PATH_OPEN: rights_t = 0x0000000000002000;
pub def RIGHT_FD_READDIR: rights_t = 0x0000000000004000;
pub def RIGHT_PATH_READLINK: rights_t = 0x0000000000008000;
pub def RIGHT_PATH_RENAME_SOURCE: rights_t = 0x0000000000010000;
pub def RIGHT_PATH_RENAME_TARGET: rights_t = 0x0000000000020000;
pub def RIGHT_PATH_FILESTAT_GET: rights_t = 0x0000000000040000;
pub def RIGHT_PATH_FILESTAT_SET_SIZE: rights_t = 0x0000000000080000;
pub def RIGHT_PATH_FILESTAT_SET_TIMES: rights_t = 0x0000000000100000;
pub def RIGHT_FD_FILESTAT_GET: rights_t = 0x0000000000200000;
pub def RIGHT_FD_FILESTAT_SET_SIZE: rights_t = 0x0000000000400000;
pub def RIGHT_FD_FILESTAT_SET_TIMES: rights_t = 0x0000000000800000;
pub def RIGHT_PATH_SYMLINK: rights_t = 0x0000000001000000;
pub def RIGHT_PATH_REMOVE_DIRECTORY: rights_t = 0x0000000002000000;
pub def RIGHT_PATH_UNLINK_FILE: rights_t = 0x0000000004000000;
pub def RIGHT_POLL_FD_READWRITE: rights_t = 0x0000000008000000;
pub def RIGHT_SOCK_SHUTDOWN: rights_t = 0x0000000010000000;

pub def roflags_t = u16;
pub def SOCK_RECV_DATA_TRUNCATED: roflags_t = 0x0001;

pub def sdflags_t = u8;
pub def SHUT_RD: sdflags_t = 0x01;
pub def SHUT_WR: sdflags_t = 0x02;

pub def siflags_t = u16;

pub def signal_t = u8;
pub def SIGHUP: signal_t = 1;
pub def SIGINT: signal_t = 2;
pub def SIGQUIT: signal_t = 3;
pub def SIGILL: signal_t = 4;
pub def SIGTRAP: signal_t = 5;
pub def SIGABRT: signal_t = 6;
pub def SIGBUS: signal_t = 7;
pub def SIGFPE: signal_t = 8;
pub def SIGKILL: signal_t = 9;
pub def SIGUSR1: signal_t = 10;
pub def SIGSEGV: signal_t = 11;
pub def SIGUSR2: signal_t = 12;
pub def SIGPIPE: signal_t = 13;
pub def SIGALRM: signal_t = 14;
pub def SIGTERM: signal_t = 15;
pub def SIGCHLD: signal_t = 16;
pub def SIGCONT: signal_t = 17;
pub def SIGSTOP: signal_t = 18;
pub def SIGTSTP: signal_t = 19;
pub def SIGTTIN: signal_t = 20;
pub def SIGTTOU: signal_t = 21;
pub def SIGURG: signal_t = 22;
pub def SIGXCPU: signal_t = 23;
pub def SIGXFSZ: signal_t = 24;
pub def SIGVTALRM: signal_t = 25;
pub def SIGPROF: signal_t = 26;
pub def SIGWINCH: signal_t = 27;
pub def SIGPOLL: signal_t = 28;
pub def SIGPWR: signal_t = 29;
pub def SIGSYS: signal_t = 30;

pub def subclockflags_t = u16;
pub def SUBSCRIPTION_CLOCK_ABSTIME: subclockflags_t = 0x0001;

pub def subscription_t = extern struct {
    userdata: userdata_t,
    @"type": eventtype_t,
    u: extern union {
        clock: extern struct {
            identifier: userdata_t,
            clock_id: clockid_t,
            timeout: timestamp_t,
            precision: timestamp_t,
            flags: subclockflags_t,
        },
        fd_readwrite: extern struct {
            fd: fd_t,
        },
    },
};

pub def timestamp_t = u64;
pub def time_t = i64; // match https://github.com/CraneStation/wasi-libc

pub def userdata_t = u64;

pub def whence_t = u8;
pub def WHENCE_CUR: whence_t = 0;
pub def WHENCE_END: whence_t = 1;
pub def WHENCE_SET: whence_t = 2;

pub def timespec = extern struct {
    tv_sec: time_t,
    tv_nsec: isize,
};
