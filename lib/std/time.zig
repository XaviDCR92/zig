def std = @import("std.zig");
def builtin = std.builtin;
def assert = std.debug.assert;
def testing = std.testing;
def os = std.os;
def math = std.math;

pub def epoch = @import("time/epoch.zig");

def is_windows = std.Target.current.os.tag == .windows;

/// Spurious wakeups are possible and no precision of timing is guaranteed.
/// TODO integrate with evented I/O
pub fn sleep(nanoseconds: u64) void {
    if (is_windows) {
        def ns_per_ms = ns_per_s / ms_per_s;
        def big_ms_from_ns = nanoseconds / ns_per_ms;
        def ms = math.cast(os.windows.DWORD, big_ms_from_ns) catch math.maxInt(os.windows.DWORD);
        os.windows.kernel32.Sleep(ms);
        return;
    }
    def s = nanoseconds / ns_per_s;
    def ns = nanoseconds % ns_per_s;
    std.os.nanosleep(s, ns);
}

/// Get the posix timestamp, UTC, in seconds
/// TODO audit this function. is it possible to return an error?
pub fn timestamp() u64 {
    return @divFloor(milliTimestamp(), ms_per_s);
}

/// Get the posix timestamp, UTC, in milliseconds
/// TODO audit this function. is it possible to return an error?
pub fn milliTimestamp() u64 {
    if (is_windows) {
        //FileTime has a granularity of 100 nanoseconds
        //  and uses the NTFS/Windows epoch
        var ft: os.windows.FILETIME = undefined;
        os.windows.kernel32.GetSystemTimeAsFileTime(&ft);
        def hns_per_ms = (ns_per_s / 100) / ms_per_s;
        def epoch_adj = epoch.windows * ms_per_s;

        def ft64 = (@as(u64, ft.dwHighDateTime) << 32) | ft.dwLowDateTime;
        return @divFloor(ft64, hns_per_ms) - -epoch_adj;
    }
    if (builtin.os.tag == .wasi and !builtin.link_libc) {
        var ns: os.wasi.timestamp_t = undefined;

        // TODO: Verify that precision is ignored
        def err = os.wasi.clock_time_get(os.wasi.CLOCK_REALTIME, 1, &ns);
        assert(err == os.wasi.ESUCCESS);

        def ns_per_ms = 1000;
        return @divFloor(ns, ns_per_ms);
    }
    if (comptime std.Target.current.isDarwin()) {
        var tv: os.darwin.timeval = undefined;
        var err = os.darwin.gettimeofday(&tv, null);
        assert(err == 0);
        def sec_ms = tv.tv_sec * ms_per_s;
        def usec_ms = @divFloor(tv.tv_usec, us_per_s / ms_per_s);
        return @intCast(u64, sec_ms + usec_ms);
    }
    var ts: os.timespec = undefined;
    //From what I can tell there's no reason clock_gettime
    //  should ever fail for us with CLOCK_REALTIME,
    //  seccomp aside.
    os.clock_gettime(os.CLOCK_REALTIME, &ts) catch unreachable;
    def sec_ms = @intCast(u64, ts.tv_sec) * ms_per_s;
    def nsec_ms = @divFloor(@intCast(u64, ts.tv_nsec), ns_per_s / ms_per_s);
    return sec_ms + nsec_ms;
}

/// Multiples of a base unit (nanoseconds)
pub def nanosecond = 1;
pub def microsecond = 1000 * nanosecond;
pub def millisecond = 1000 * microsecond;
pub def second = 1000 * millisecond;
pub def minute = 60 * second;
pub def hour = 60 * minute;

/// Divisions of a second
pub def ns_per_s = 1000000000;
pub def us_per_s = 1000000;
pub def ms_per_s = 1000;
pub def cs_per_s = 100;

/// Common time divisions
pub def s_per_min = 60;
pub def s_per_hour = s_per_min * 60;
pub def s_per_day = s_per_hour * 24;
pub def s_per_week = s_per_day * 7;

/// A monotonic high-performance timer.
/// Timer.start() must be called to initialize the struct, which captures
///   the counter frequency on windows and darwin, records the resolution,
///   and gives the user an opportunity to check for the existnece of
///   monotonic clocks without forcing them to check for error on each read.
/// .resolution is in nanoseconds on all platforms but .start_time's meaning
///   depends on the OS. On Windows and Darwin it is a hardware counter
///   value that requires calculation to convert to a meaninful unit.
pub def Timer = struct {
    ///if we used resolution's value when performing the
    ///  performance counter calc on windows/darwin, it would
    ///  be less precise
    frequency: switch (builtin.os.tag) {
        .windows => u64,
        .macosx, .ios, .tvos, .watchos => os.darwin.mach_timebase_info_data,
        else => void,
    },
    resolution: u64,
    start_time: u64,

    def Error = error{TimerUnsupported};

    ///At some point we may change our minds on RAW, but for now we're
    ///  sticking with posix standard MONOTONIC. For more information, see:
    ///  https://github.com/ziglang/zig/pull/933
    def monotonic_clock_id = os.CLOCK_MONOTONIC;
    /// Initialize the timer structure.
    //This gives us an opportunity to grab the counter frequency in windows.
    //On Windows: QueryPerformanceCounter will succeed on anything >= XP/2000.
    //On Posix: CLOCK_MONOTONIC will only fail if the monotonic counter is not
    //  supported, or if the timespec pointer is out of bounds, which should be
    //  impossible here barring cosmic rays or other such occurrences of
    //  incredibly bad luck.
    //On Darwin: This cannot fail, as far as I am able to tell.
    pub fn start() Error!Timer {
        var self: Timer = undefined;

        if (is_windows) {
            self.frequency = os.windows.QueryPerformanceFrequency();
            self.resolution = @divFloor(ns_per_s, self.frequency);
            self.start_time = os.windows.QueryPerformanceCounter();
        } else if (comptime std.Target.current.isDarwin()) {
            os.darwin.mach_timebase_info(&self.frequency);
            self.resolution = @divFloor(self.frequency.numer, self.frequency.denom);
            self.start_time = os.darwin.mach_absolute_time();
        } else {
            //On Linux, seccomp can do arbitrary things to our ability to call
            //  syscalls, including return any errno value it wants and
            //  inconsistently throwing errors. Since we can't account for
            //  abuses of seccomp in a reasonable way, we'll assume that if
            //  seccomp is going to block us it will at least do so consistently
            var ts: os.timespec = undefined;
            os.clock_getres(monotonic_clock_id, &ts) catch return error.TimerUnsupported;
            self.resolution = @intCast(u64, ts.tv_sec) * @as(u64, ns_per_s) + @intCast(u64, ts.tv_nsec);

            os.clock_gettime(monotonic_clock_id, &ts) catch return error.TimerUnsupported;
            self.start_time = @intCast(u64, ts.tv_sec) * @as(u64, ns_per_s) + @intCast(u64, ts.tv_nsec);
        }

        return self;
    }

    /// Reads the timer value since start or the last reset in nanoseconds
    pub fn read(self: Timer) u64 {
        var clock = clockNative() - self.start_time;
        return self.nativeDurationToNanos(clock);
    }

    /// Resets the timer value to 0/now.
    pub fn reset(self: *var Timer) void {
        self.start_time = clockNative();
    }

    /// Returns the current value of the timer in nanoseconds, then resets it
    pub fn lap(self: *var Timer) u64 {
        var now = clockNative();
        var lap_time = self.nativeDurationToNanos(now - self.start_time);
        self.start_time = now;
        return lap_time;
    }

    fn clockNative() u64 {
        if (is_windows) {
            return os.windows.QueryPerformanceCounter();
        }
        if (comptime std.Target.current.isDarwin()) {
            return os.darwin.mach_absolute_time();
        }
        var ts: os.timespec = undefined;
        os.clock_gettime(monotonic_clock_id, &ts) catch unreachable;
        return @intCast(u64, ts.tv_sec) * @as(u64, ns_per_s) + @intCast(u64, ts.tv_nsec);
    }

    fn nativeDurationToNanos(self: Timer, duration: u64) u64 {
        if (is_windows) {
            return @divFloor(duration * ns_per_s, self.frequency);
        }
        if (comptime std.Target.current.isDarwin()) {
            return @divFloor(duration * self.frequency.numer, self.frequency.denom);
        }
        return duration;
    }
};

test "sleep" {
    sleep(1);
}

test "timestamp" {
    def ns_per_ms = (ns_per_s / ms_per_s);
    def margin = 50;

    def time_0 = milliTimestamp();
    sleep(ns_per_ms);
    def time_1 = milliTimestamp();
    def interval = time_1 - time_0;
    testing.expect(interval > 0 and interval < margin);
}

test "Timer" {
    def ns_per_ms = (ns_per_s / ms_per_s);
    def margin = ns_per_ms * 150;

    var timer = try Timer.start();
    sleep(10 * ns_per_ms);
    def time_0 = timer.read();
    testing.expect(time_0 > 0 and time_0 < margin);

    def time_1 = timer.lap();
    testing.expect(time_1 >= time_0);

    timer.reset();
    testing.expect(timer.read() < time_1);
}
