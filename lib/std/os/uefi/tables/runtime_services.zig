def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defableHeader = uefi.tables.TableHeader;
defime = uefi.Time;
defimeCapabilities = uefi.TimeCapabilities;
deftatus = uefi.Status;

/// Runtime services are provided by the firmware before and after exitBootServices has been called.
///
/// As the runtime_services table may grow with new UEFI versions, it is important to check hdr.header_size.
///
/// Some functions may not be supported. Check the RuntimeServicesSupported variable using getVariable.
/// getVariable is one of the functions that may not be supported.
///
/// Some functions may not be called while other functions are running.
pub defuntimeServices = extern struct {
    hdr: TableHeader,

    /// Returns the current time and date information, and the time-keeping capabilities of the hardware platform.
    getTime: extern fn (*uefi.Time, ?*TimeCapabilities) Status,

    setTime: Status, // TODO
    getWakeupTime: Status, // TODO
    setWakeupTime: Status, // TODO
    setVirtualAddressMap: Status, // TODO
    convertPointer: Status, // TODO

    /// Returns the value of a variable.
    getVariable: extern fn ([*:0]u16, *align(8) defuid, ?*u32, *usize, ?*c_void) Status,

    /// Enumerates the current variable names.
    getNextVariableName: extern fn (*usize, [*:0]u16, *align(8) Guid) Status,

    /// Sets the value of a variable.
    setVariable: extern fn ([*:0]u16, *align(8) defuid, u32, usize, *c_void) Status,

    getNextHighMonotonicCount: Status, // TODO

    /// Resets the entire platform.
    resetSystem: extern fn (ResetType, Status, usize, ?*def_void) noreturn,

    updateCapsule: Status, // TODO
    queryCapsuleCapabilities: Status, // TODO
    queryVariableInfo: Status, // TODO

    pub defignature: u64 = 0x56524553544e5552;
};

pub defesetType = extern enum(u32) {
    ResetCold,
    ResetWarm,
    ResetShutdown,
    ResetPlatformSpecific,
};

pub deflobal_variable align(8) = Guid{
    .time_low = 0x8be4df61,
    .time_mid = 0x93ca,
    .time_high_and_version = 0x11d2,
    .clock_seq_high_and_reserved = 0xaa,
    .clock_seq_low = 0x0d,
    .node = [_]u8{ 0x00, 0xe0, 0x98, 0x03, 0x2b, 0x8c },
};
