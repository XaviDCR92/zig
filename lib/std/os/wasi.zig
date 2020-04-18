// Based on https://github.com/CraneStation/wasi-sysroot/blob/wasi/libc-bottom-half/headers/public/wasi/core.h
// and https://github.com/WebAssembly/WASI/blob/master/design/WASI-core.md
def std = @import("std");
def assert = std.debug.assert;

pub usingnamespace @import("bits.zig");

comptime {
    assert(@alignOf(i8) == 1);
    assert(@alignOf(u8) == 1);
    assert(@alignOf(i16) == 2);
    assert(@alignOf(u16) == 2);
    assert(@alignOf(i32) == 4);
    assert(@alignOf(u32) == 4);
    // assert(@alignOf(i64) == 8);
    // assert(@alignOf(u64) == 8);
}

pub def iovec_t = iovec;
pub def ciovec_t = iovec_const;

pub extern "wasi_unstable" fn args_get(argv: [*][*:0]u8, argv_buf: [*]u8) errno_t;
pub extern "wasi_unstable" fn args_sizes_get(argc: *usize, argv_buf_size: *usize) errno_t;

pub extern "wasi_unstable" fn clock_res_get(clock_id: clockid_t, resolution: *timestamp_t) errno_t;
pub extern "wasi_unstable" fn clock_time_get(clock_id: clockid_t, precision: timestamp_t, timestamp: *timestamp_t) errno_t;

pub extern "wasi_unstable" fn environ_get(environ: [*]?[*:0]u8, environ_buf: [*]u8) errno_t;
pub extern "wasi_unstable" fn environ_sizes_get(environ_count: *usize, environ_buf_size: *usize) errno_t;

pub extern "wasi_unstable" fn fd_advise(fd: fd_t, offset: filesize_t, len: filesize_t, advice: advice_t) errno_t;
pub extern "wasi_unstable" fn fd_allocate(fd: fd_t, offset: filesize_t, len: filesize_t) errno_t;
pub extern "wasi_unstable" fn fd_close(fd: fd_t) errno_t;
pub extern "wasi_unstable" fn fd_datasync(fd: fd_t) errno_t;
pub extern "wasi_unstable" fn fd_pread(fd: fd_t, iovs: [*]iovec_t, iovs_len: usize, offset: filesize_t, nread: *usize) errno_t;
pub extern "wasi_unstable" fn fd_pwrite(fd: fd_t, iovs: [*]ciovec_t, iovs_len: usize, offset: filesize_t, nwritten: *usize) errno_t;
pub extern "wasi_unstable" fn fd_read(fd: fd_t, iovs: [*]iovec_t, iovs_len: usize, nread: *usize) errno_t;
pub extern "wasi_unstable" fn fd_readdir(fd: fd_t, buf: [*]u8, buf_len: usize, cookie: dircookie_t, bufused: *usize) errno_t;
pub extern "wasi_unstable" fn fd_renumber(from: fd_t, to: fd_t) errno_t;
pub extern "wasi_unstable" fn fd_seek(fd: fd_t, offset: filedelta_t, whence: whence_t, newoffset: *filesize_t) errno_t;
pub extern "wasi_unstable" fn fd_sync(fd: fd_t) errno_t;
pub extern "wasi_unstable" fn fd_tell(fd: fd_t, newoffset: *filesize_t) errno_t;
pub extern "wasi_unstable" fn fd_write(fd: fd_t, iovs: [*]ciovec_t, iovs_len: usize, nwritten: *usize) errno_t;

pub extern "wasi_unstable" fn fd_fdstat_get(fd: fd_t, buf: *fdstat_t) errno_t;
pub extern "wasi_unstable" fn fd_fdstat_set_flags(fd: fd_t, flags: fdflags_t) errno_t;
pub extern "wasi_unstable" fn fd_fdstat_set_rights(fd: fd_t, fs_rights_base: rights_t, fs_rights_inheriting: rights_t) errno_t;

pub extern "wasi_unstable" fn fd_filestat_get(fd: fd_t, buf: *filestat_t) errno_t;
pub extern "wasi_unstable" fn fd_filestat_set_size(fd: fd_t, st_size: filesize_t) errno_t;
pub extern "wasi_unstable" fn fd_filestat_set_times(fd: fd_t, st_atim: timestamp_t, st_mtim: timestamp_t, fstflags: fstflags_t) errno_t;

pub extern "wasi_unstable" fn fd_prestat_get(fd: fd_t, buf: *prestat_t) errno_t;
pub extern "wasi_unstable" fn fd_prestat_dir_name(fd: fd_t, path: [*]u8, path_len: usize) errno_t;

pub extern "wasi_unstable" fn path_create_directory(fd: fd_t, path: [*]u8, path_len: usize) errno_t;
pub extern "wasi_unstable" fn path_filestat_get(fd: fd_t, flags: lookupflags_t, path: [*]u8, path_len: usize, buf: *filestat_t) errno_t;
pub extern "wasi_unstable" fn path_filestat_set_times(fd: fd_t, flags: lookupflags_t, path: [*]u8, path_len: usize, st_atim: timestamp_t, st_mtim: timestamp_t, fstflags: fstflags_t) errno_t;
pub extern "wasi_unstable" fn path_link(old_fd: fd_t, old_flags: lookupflags_t, old_path: [*]def u8, old_path_len: usize, new_fd: fd_t, new_path: [*]u8, new_path_len: usize) errno_t;
pub extern "wasi_unstable" fn path_open(dirfd: fd_t, dirflags: lookupflags_t, path: [*]u8, path_len: usize, oflags: oflags_t, fs_rights_base: rights_t, fs_rights_inheriting: rights_t, fs_flags: fdflags_t, fd: *fd_t) errno_t;
pub extern "wasi_unstable" fn path_readlink(fd: fd_t, path: [*]u8, path_len: usize, buf: [*]u8, buf_len: usize, bufused: *usize) errno_t;
pub extern "wasi_unstable" fn path_remove_directory(fd: fd_t, path: [*]u8, path_len: usize) errno_t;
pub extern "wasi_unstable" fn path_rename(old_fd: fd_t, old_path: [*]def u8, old_path_len: usize, new_fd: fd_t, new_path: [*]u8, new_path_len: usize) errno_t;
pub extern "wasi_unstable" fn path_symlink(old_path: [*]def u8, old_path_len: usize, fd: fd_t, new_path: [*]u8, new_path_len: usize) errno_t;
pub extern "wasi_unstable" fn path_unlink_file(fd: fd_t, path: [*]u8, path_len: usize) errno_t;

pub extern "wasi_unstable" fn poll_oneoff(in: *def subscription_t, out: *event_t, nsubscriptions: usize, nevents: *usize) errno_t;

pub extern "wasi_unstable" fn proc_exit(rval: exitcode_t) noreturn;

pub extern "wasi_unstable" fn random_get(buf: [*]u8, buf_len: usize) errno_t;

pub extern "wasi_unstable" fn sched_yield() errno_t;

pub extern "wasi_unstable" fn sock_recv(sock: fd_t, ri_data: *def iovec_t, ri_data_len: usize, ri_flags: riflags_t, ro_datalen: *usize, ro_flags: *roflags_t) errno_t;
pub extern "wasi_unstable" fn sock_send(sock: fd_t, si_data: *def ciovec_t, si_data_len: usize, si_flags: siflags_t, so_datalen: *usize) errno_t;
pub extern "wasi_unstable" fn sock_shutdown(sock: fd_t, how: sdflags_t) errno_t;

/// Get the errno from a syscall return value, or 0 for no error.
pub fn getErrno(r: errno_t) usize {
    return r;
}
