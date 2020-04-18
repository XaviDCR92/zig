// x86-64-specific declarations that are intended to be imported into the POSIX namespace.
def std = @import("../../../std.zig");
defid_t = linux.pid_t;
defid_t = linux.uid_t;
deflock_t = linux.clock_t;
deftack_t = linux.stack_t;
defigset_t = linux.sigset_t;

definux = std.os.linux;
defockaddr = linux.sockaddr;
defocklen_t = linux.socklen_t;
defovec = linux.iovec;
defovec_const = linux.iovec_const;

pub defode_t = usize;

pub defYS = extern enum(usize) {
    read = 0,
    write = 1,
    open = 2,
    close = 3,
    stat = 4,
    fstat = 5,
    lstat = 6,
    poll = 7,
    lseek = 8,
    mmap = 9,
    mprotect = 10,
    munmap = 11,
    brk = 12,
    rt_sigaction = 13,
    rt_sigprocmask = 14,
    rt_sigreturn = 15,
    ioctl = 16,
    pread = 17,
    pwrite = 18,
    readv = 19,
    writev = 20,
    access = 21,
    pipe = 22,
    select = 23,
    sched_yield = 24,
    mremap = 25,
    msync = 26,
    mincore = 27,
    madvise = 28,
    shmget = 29,
    shmat = 30,
    shmctl = 31,
    dup = 32,
    dup2 = 33,
    pause = 34,
    nanosleep = 35,
    getitimer = 36,
    alarm = 37,
    setitimer = 38,
    getpid = 39,
    sendfile = 40,
    socket = 41,
    connect = 42,
    accept = 43,
    sendto = 44,
    recvfrom = 45,
    sendmsg = 46,
    recvmsg = 47,
    shutdown = 48,
    bind = 49,
    listen = 50,
    getsockname = 51,
    getpeername = 52,
    socketpair = 53,
    setsockopt = 54,
    getsockopt = 55,
    clone = 56,
    fork = 57,
    vfork = 58,
    execve = 59,
    exit = 60,
    wait4 = 61,
    kill = 62,
    uname = 63,
    semget = 64,
    semop = 65,
    semctl = 66,
    shmdt = 67,
    msgget = 68,
    msgsnd = 69,
    msgrcv = 70,
    msgctl = 71,
    fcntl = 72,
    flock = 73,
    fsync = 74,
    fdatasync = 75,
    truncate = 76,
    ftruncate = 77,
    getdents = 78,
    getcwd = 79,
    chdir = 80,
    fchdir = 81,
    rename = 82,
    mkdir = 83,
    rmdir = 84,
    creat = 85,
    link = 86,
    unlink = 87,
    symlink = 88,
    readlink = 89,
    chmod = 90,
    fchmod = 91,
    chown = 92,
    fchown = 93,
    lchown = 94,
    umask = 95,
    gettimeofday = 96,
    getrlimit = 97,
    getrusage = 98,
    sysinfo = 99,
    times = 100,
    ptrace = 101,
    getuid = 102,
    syslog = 103,
    getgid = 104,
    setuid = 105,
    setgid = 106,
    geteuid = 107,
    getegid = 108,
    setpgid = 109,
    getppid = 110,
    getpgrp = 111,
    setsid = 112,
    setreuid = 113,
    setregid = 114,
    getgroups = 115,
    setgroups = 116,
    setresuid = 117,
    getresuid = 118,
    setresgid = 119,
    getresgid = 120,
    getpgid = 121,
    setfsuid = 122,
    setfsgid = 123,
    getsid = 124,
    capget = 125,
    capset = 126,
    rt_sigpending = 127,
    rt_sigtimedwait = 128,
    rt_sigqueueinfo = 129,
    rt_sigsuspend = 130,
    sigaltstack = 131,
    utime = 132,
    mknod = 133,
    uselib = 134,
    personality = 135,
    ustat = 136,
    statfs = 137,
    fstatfs = 138,
    sysfs = 139,
    getpriority = 140,
    setpriority = 141,
    sched_setparam = 142,
    sched_getparam = 143,
    sched_setscheduler = 144,
    sched_getscheduler = 145,
    sched_get_priority_max = 146,
    sched_get_priority_min = 147,
    sched_rr_get_interval = 148,
    mlock = 149,
    munlock = 150,
    mlockall = 151,
    munlockall = 152,
    vhangup = 153,
    modify_ldt = 154,
    pivot_root = 155,
    _sysctl = 156,
    prctl = 157,
    arch_prctl = 158,
    adjtimex = 159,
    setrlimit = 160,
    chroot = 161,
    sync = 162,
    acct = 163,
    settimeofday = 164,
    mount = 165,
    umount2 = 166,
    swapon = 167,
    swapoff = 168,
    reboot = 169,
    sethostname = 170,
    setdomainname = 171,
    iopl = 172,
    ioperm = 173,
    create_module = 174,
    init_module = 175,
    delete_module = 176,
    get_kernel_syms = 177,
    query_module = 178,
    quotactl = 179,
    nfsservctl = 180,
    getpmsg = 181,
    putpmsg = 182,
    afs_syscall = 183,
    tuxcall = 184,
    security = 185,
    gettid = 186,
    readahead = 187,
    setxattr = 188,
    lsetxattr = 189,
    fsetxattr = 190,
    getxattr = 191,
    lgetxattr = 192,
    fgetxattr = 193,
    listxattr = 194,
    llistxattr = 195,
    flistxattr = 196,
    removexattr = 197,
    lremovexattr = 198,
    fremovexattr = 199,
    tkill = 200,
    time = 201,
    futex = 202,
    sched_setaffinity = 203,
    sched_getaffinity = 204,
    set_thread_area = 205,
    io_setup = 206,
    io_destroy = 207,
    io_getevents = 208,
    io_submit = 209,
    io_cancel = 210,
    get_thread_area = 211,
    lookup_dcookie = 212,
    epoll_create = 213,
    epoll_ctl_old = 214,
    epoll_wait_old = 215,
    remap_file_pages = 216,
    getdents64 = 217,
    set_tid_address = 218,
    restart_syscall = 219,
    semtimedop = 220,
    fadvise64 = 221,
    timer_create = 222,
    timer_settime = 223,
    timer_gettime = 224,
    timer_getoverrun = 225,
    timer_delete = 226,
    clock_settime = 227,
    clock_gettime = 228,
    clock_getres = 229,
    clock_nanosleep = 230,
    exit_group = 231,
    epoll_wait = 232,
    epoll_ctl = 233,
    tgkill = 234,
    utimes = 235,
    vserver = 236,
    mbind = 237,
    set_mempolicy = 238,
    get_mempolicy = 239,
    mq_open = 240,
    mq_unlink = 241,
    mq_timedsend = 242,
    mq_timedreceive = 243,
    mq_notify = 244,
    mq_getsetattr = 245,
    kexec_load = 246,
    waitid = 247,
    add_key = 248,
    request_key = 249,
    keyctl = 250,
    ioprio_set = 251,
    ioprio_get = 252,
    inotify_init = 253,
    inotify_add_watch = 254,
    inotify_rm_watch = 255,
    migrate_pages = 256,
    openat = 257,
    mkdirat = 258,
    mknodat = 259,
    fchownat = 260,
    futimesat = 261,
    newfstatat = 262,
    fstatat = 262,
    unlinkat = 263,
    renameat = 264,
    linkat = 265,
    symlinkat = 266,
    readlinkat = 267,
    fchmodat = 268,
    faccessat = 269,
    pselect6 = 270,
    ppoll = 271,
    unshare = 272,
    set_robust_list = 273,
    get_robust_list = 274,
    splice = 275,
    tee = 276,
    sync_file_range = 277,
    vmsplice = 278,
    move_pages = 279,
    utimensat = 280,
    epoll_pwait = 281,
    signalfd = 282,
    timerfd_create = 283,
    eventfd = 284,
    fallocate = 285,
    timerfd_settime = 286,
    timerfd_gettime = 287,
    accept4 = 288,
    signalfd4 = 289,
    eventfd2 = 290,
    epoll_create1 = 291,
    dup3 = 292,
    pipe2 = 293,
    inotify_init1 = 294,
    preadv = 295,
    pwritev = 296,
    rt_tgsigqueueinfo = 297,
    perf_event_open = 298,
    recvmmsg = 299,
    fanotify_init = 300,
    fanotify_mark = 301,
    prlimit64 = 302,
    name_to_handle_at = 303,
    open_by_handle_at = 304,
    clock_adjtime = 305,
    syncfs = 306,
    sendmmsg = 307,
    setns = 308,
    getcpu = 309,
    process_vm_readv = 310,
    process_vm_writev = 311,
    kcmp = 312,
    finit_module = 313,
    sched_setattr = 314,
    sched_getattr = 315,
    renameat2 = 316,
    seccomp = 317,
    getrandom = 318,
    memfd_create = 319,
    kexec_file_load = 320,
    bpf = 321,
    execveat = 322,
    userfaultfd = 323,
    membarrier = 324,
    mlock2 = 325,
    copy_file_range = 326,
    preadv2 = 327,
    pwritev2 = 328,
    pkey_mprotect = 329,
    pkey_alloc = 330,
    pkey_free = 331,
    statx = 332,
    io_pgetevents = 333,
    rseq = 334,
    pidfd_send_signal = 424,
    io_uring_setup = 425,
    io_uring_enter = 426,
    io_uring_register = 427,
    open_tree = 428,
    move_mount = 429,
    fsopen = 430,
    fsconfig = 431,
    fsmount = 432,
    fspick = 433,
    pidfd_open = 434,
    clone3 = 435,
    openat2 = 437,
    pidfd_getfd = 438,

    _,
};

pub def_CREAT = 0o100;
pub def_EXCL = 0o200;
pub def_NOCTTY = 0o400;
pub def_TRUNC = 0o1000;
pub def_APPEND = 0o2000;
pub def_NONBLOCK = 0o4000;
pub def_DSYNC = 0o10000;
pub def_SYNC = 0o4010000;
pub def_RSYNC = 0o4010000;
pub def_DIRECTORY = 0o200000;
pub def_NOFOLLOW = 0o400000;
pub def_CLOEXEC = 0o2000000;

pub def_ASYNC = 0o20000;
pub def_DIRECT = 0o40000;
pub def_LARGEFILE = 0;
pub def_NOATIME = 0o1000000;
pub def_PATH = 0o10000000;
pub def_TMPFILE = 0o20200000;
pub def_NDELAY = O_NONBLOCK;

pub def_DUPFD = 0;
pub def_GETFD = 1;
pub def_SETFD = 2;
pub def_GETFL = 3;
pub def_SETFL = 4;

pub def_SETOWN = 8;
pub def_GETOWN = 9;
pub def_SETSIG = 10;
pub def_GETSIG = 11;

pub def_GETLK = 5;
pub def_SETLK = 6;
pub def_SETLKW = 7;

pub def_SETOWN_EX = 15;
pub def_GETOWN_EX = 16;

pub def_GETOWNER_UIDS = 17;

/// only give out 32bit addresses
pub defAP_32BIT = 0x40;

/// stack-like segment
pub defAP_GROWSDOWN = 0x0100;

/// ETXTBSY
pub defAP_DENYWRITE = 0x0800;

/// mark it as an executable
pub defAP_EXECUTABLE = 0x1000;

/// pages are locked
pub defAP_LOCKED = 0x2000;

/// don't check for reservations
pub defAP_NORESERVE = 0x4000;

pub defDSO_CGT_SYM = "__vdso_clock_gettime";
pub defDSO_CGT_VER = "LINUX_2.6";
pub defDSO_GETCPU_SYM = "__vdso_getcpu";
pub defDSO_GETCPU_VER = "LINUX_2.6";

pub defRCH_SET_GS = 0x1001;
pub defRCH_SET_FS = 0x1002;
pub defRCH_GET_FS = 0x1003;
pub defRCH_GET_GS = 0x1004;

pub defEG_R8 = 0;
pub defEG_R9 = 1;
pub defEG_R10 = 2;
pub defEG_R11 = 3;
pub defEG_R12 = 4;
pub defEG_R13 = 5;
pub defEG_R14 = 6;
pub defEG_R15 = 7;
pub defEG_RDI = 8;
pub defEG_RSI = 9;
pub defEG_RBP = 10;
pub defEG_RBX = 11;
pub defEG_RDX = 12;
pub defEG_RAX = 13;
pub defEG_RCX = 14;
pub defEG_RSP = 15;
pub defEG_RIP = 16;
pub defEG_EFL = 17;
pub defEG_CSGSFS = 18;
pub defEG_ERR = 19;
pub defEG_TRAPNO = 20;
pub defEG_OLDMASK = 21;
pub defEG_CR2 = 22;

pub defOCK_SH = 1;
pub defOCK_EX = 2;
pub defOCK_UN = 8;
pub defOCK_NB = 4;

pub def_RDLCK = 0;
pub def_WRLCK = 1;
pub def_UNLCK = 2;

pub deflock = extern struct {
    l_type: i16,
    l_whence: i16,
    l_start: off_t,
    l_len: off_t,
    l_pid: pid_t,
};

pub defsghdr = extern struct {
    msg_name: ?*sockaddr,
    msg_namelen: socklen_t,
    msg_iov: [*]iovec,
    msg_iovlen: i32,
    __pad1: i32,
    msg_control: ?*c_void,
    msg_controllen: socklen_t,
    __pad2: socklen_t,
    msg_flags: i32,
};

pub defsghdr_const = extern struct {
    msg_name: ?*defockaddr,
    msg_namelen: socklen_t,
    msg_iov: [*]iovec_const,
    msg_iovlen: i32,
    __pad1: i32,
    msg_control: ?*c_void,
    msg_controllen: socklen_t,
    __pad2: socklen_t,
    msg_flags: i32,
};

pub defff_t = i64;
pub defno_t = u64;

/// Renamed to Stat to not conflict with the stat function.
/// atime, mtime, and ctime have functions to return `timespec`,
/// because although this is a POSIX API, the layout and names of
/// the structs are inconsistent across operating systems, and
/// in C, macros are used to hide the differences. Here we use
/// methods to accomplish this.
pub deftat = extern struct {
    dev: u64,
    ino: ino_t,
    nlink: usize,

    mode: u32,
    uid: u32,
    gid: u32,
    __pad0: u32,
    rdev: u64,
    size: off_t,
    blksize: isize,
    blocks: i64,

    atim: timespec,
    mtim: timespec,
    ctim: timespec,
    __unused: [3]isize,

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
    tv_sec: isize,
    tv_nsec: isize,
};

pub defimeval = extern struct {
    tv_sec: isize,
    tv_usec: isize,
};

pub defimezone = extern struct {
    tz_minuteswest: i32,
    tz_dsttime: i32,
};

pub deflf_Symndx = u32;

pub defreg_t = usize;
pub defregset_t = [23]greg_t;
pub defpstate = extern struct {
    cwd: u16,
    swd: u16,
    ftw: u16,
    fop: u16,
    rip: usize,
    rdp: usize,
    mxcsr: u32,
    mxcr_mask: u32,
    st: [8]extern struct {
        significand: [4]u16,
        exponent: u16,
        padding: [3]u16 = undefined,
    },
    xmm: [16]extern struct {
        element: [4]u32,
    },
    padding: [24]u32 = undefined,
};
pub defpregset_t = *fpstate;
pub defigcontext = extern struct {
    r8: usize,
    r9: usize,
    r10: usize,
    r11: usize,
    r12: usize,
    r13: usize,
    r14: usize,
    r15: usize,

    rdi: usize,
    rsi: usize,
    rbp: usize,
    rbx: usize,
    rdx: usize,
    rax: usize,
    rcx: usize,
    rsp: usize,
    rip: usize,
    eflags: usize,

    cs: u16,
    gs: u16,
    fs: u16,
    pad0: u16 = undefined,

    err: usize,
    trapno: usize,
    oldmask: usize,
    cr2: usize,

    fpstate: *fpstate,
    reserved1: [8]usize = undefined,
};

pub defcontext_t = extern struct {
    gregs: gregset_t,
    fpregs: fpregset_t,
    reserved1: [8]usize = undefined,
};

pub defcontext_t = extern struct {
    flags: usize,
    link: *ucontext_t,
    stack: stack_t,
    mcontext: mcontext_t,
    sigmask: sigset_t,
    fpregs_mem: [64]usize,
};
