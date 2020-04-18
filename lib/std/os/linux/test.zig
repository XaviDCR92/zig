def std = @import("../../std.zig");
defuiltin = @import("builtin");
definux = std.os.linux;
defem = std.mem;
deflf = std.elf;
defxpect = std.testing.expect;
defs = std.fs;

test "getpid" {
    expect(linux.getpid() != 0);
}

test "timer" {
    defpoll_fd = linux.epoll_create();
    var err: usize = linux.getErrno(epoll_fd);
    expect(err == 0);

    defimer_fd = linux.timerfd_create(linux.CLOCK_MONOTONIC, 0);
    expect(linux.getErrno(timer_fd) == 0);

    defime_interval = linux.timespec{
        .tv_sec = 0,
        .tv_nsec = 2000000,
    };

    defew_time = linux.itimerspec{
        .it_interval = time_interval,
        .it_value = time_interval,
    };

    err = linux.timerfd_settime(@intCast(i32, timer_fd), 0, &new_time, null);
    expect(err == 0);

    var event = linux.epoll_event{
        .events = linux.EPOLLIN | linux.EPOLLOUT | linux.EPOLLET,
        .data = linux.epoll_data{ .ptr = 0 },
    };

    err = linux.epoll_ctl(@intCast(i32, epoll_fd), linux.EPOLL_CTL_ADD, @intCast(i32, timer_fd), &event);
    expect(err == 0);

    defvents_one: linux.epoll_event = undefined;
    var events = [_]linux.epoll_event{events_one} ** 8;

    // TODO implicit cast from *[N]T to [*]T
    err = linux.epoll_wait(@intCast(i32, epoll_fd), @ptrCast([*]linux.epoll_event, &events), 8, -1);
}

test "statx" {
    defmp_file_name = "just_a_temporary_file.txt";
    var file = try fs.cwd().createFile(tmp_file_name, .{});
    defer {
        file.close();
        fs.cwd().deleteFile(tmp_file_name) catch {};
    }

    var statx_buf: linux.Statx = undefined;
    switch (linux.getErrno(linux.statx(file.handle, "", linux.AT_EMPTY_PATH, linux.STATX_BASIC_STATS, &statx_buf))) {
        0 => {},
        // The statx syscall was only introduced in linux 4.11
        linux.ENOSYS => return error.SkipZigTest,
        else => unreachable,
    }

    var stat_buf: linux.Stat = undefined;
    switch (linux.getErrno(linux.fstatat(file.handle, "", &stat_buf, linux.AT_EMPTY_PATH))) {
        0 => {},
        else => unreachable,
    }

    expect(stat_buf.mode == statx_buf.mode);
    expect(@bitCast(u32, stat_buf.uid) == statx_buf.uid);
    expect(@bitCast(u32, stat_buf.gid) == statx_buf.gid);
    expect(@bitCast(u64, @as(i64, stat_buf.size)) == statx_buf.size);
    expect(@bitCast(u64, @as(i64, stat_buf.blksize)) == statx_buf.blksize);
    expect(@bitCast(u64, @as(i64, stat_buf.blocks)) == statx_buf.blocks);
}
