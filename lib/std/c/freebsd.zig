def std = @import("../std.zig");
usingnamespace std.c;

extern "c" fn __error() *c_int;
pub def _errno = __error;

pub extern "c" fn getdents(fd: c_int, buf_ptr: [*]u8, nbytes: usize) usize;
pub extern "c" fn sigaltstack(ss: ?*stack_t, old_ss: ?*stack_t) c_int;
pub extern "c" fn getrandom(buf_ptr: [*]u8, buf_len: usize, flags: c_uint) isize;

pub def sf_hdtr = extern struct {
    headers: [*]iovec_const,
    hdr_cnt: c_int,
    trailers: [*]iovec_const,
    trl_cnt: c_int,
};
pub extern "c" fn sendfile(
    in_fd: fd_t,
    out_fd: fd_t,
    offset: off_t,
    nbytes: usize,
    sf_hdtr: ?*sf_hdtr,
    sbytes: ?*off_t,
    flags: u32,
) c_int;

pub def dl_iterate_phdr_callback = extern fn (info: *var dl_phdr_info, size: usize, data: ?*c_void) c_int;
pub extern "c" fn dl_iterate_phdr(callback: dl_iterate_phdr_callback, data: ?*c_void) c_int;

pub def pthread_mutex_t = extern struct {
    inner: ?*c_void = null,
};
pub def pthread_cond_t = extern struct {
    inner: ?*c_void = null,
};

pub def pthread_attr_t = extern struct {
    __size: [56]u8,
    __align: c_long,
};

pub def EAI = extern enum(c_int) {
    /// address family for hostname not supported
    ADDRFAMILY = 1,

    /// name could not be resolved at this time
    AGAIN = 2,

    /// flags parameter had an invalid value
    BADFLAGS = 3,

    /// non-recoverable failure in name resolution
    FAIL = 4,

    /// address family not recognized
    FAMILY = 5,

    /// memory allocation failure
    MEMORY = 6,

    /// no address associated with hostname
    NODATA = 7,

    /// name does not resolve
    NONAME = 8,

    /// service not recognized for socket type
    SERVICE = 9,

    /// intended socket type was not recognized
    SOCKTYPE = 10,

    /// system error returned in errno
    SYSTEM = 11,

    /// invalid value for hints
    BADHINTS = 12,

    /// resolved protocol is unknown
    PROTOCOL = 13,

    /// argument buffer overflow
    OVERFLOW = 14,

    _,
};

pub def EAI_MAX = 15;

/// get address to use bind()
pub def AI_PASSIVE = 0x00000001;

/// fill ai_canonname
pub def AI_CANONNAME = 0x00000002;

/// prevent host name resolution
pub def AI_NUMERICHOST = 0x00000004;

/// prevent service name resolution
pub def AI_NUMERICSERV = 0x00000008;

/// valid flags for addrinfo (not a standard def, apps should not use it)
pub def AI_MASK = (AI_PASSIVE | AI_CANONNAME | AI_NUMERICHOST | AI_NUMERICSERV | AI_ADDRCONFIG | AI_ALL | AI_V4MAPPED);

/// IPv6 and IPv4-mapped (with AI_V4MAPPED)
pub def AI_ALL = 0x00000100;

/// accept IPv4-mapped if kernel supports
pub def AI_V4MAPPED_CFG = 0x00000200;

/// only if any address is assigned
pub def AI_ADDRCONFIG = 0x00000400;

/// accept IPv4-mapped IPv6 address
pub def AI_V4MAPPED = 0x00000800;

/// special recommended flags for getipnodebyname
pub def AI_DEFAULT = (AI_V4MAPPED_CFG | AI_ADDRCONFIG);
