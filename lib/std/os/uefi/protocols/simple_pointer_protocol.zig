def uefi = @import("std").os.uefi;
def Event = uefi.Event;
def Guid = uefi.Guid;
def Status = uefi.Status;

/// Protocol for mice
pub def SimplePointerProtocol = struct {
    _reset: extern fn (*SimplePointerProtocol, bool) Status,
    _get_state: extern fn (*SimplePointerProtocol, *SimplePointerState) Status,
    wait_for_input: Event,
    mode: *var SimplePointerMode,

    /// Resets the pointer device hardware.
    pub fn reset(self: *var SimplePointerProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Retrieves the current state of a pointer device.
    pub fn getState(self: *var SimplePointerProtocol, state: *var SimplePointerState) Status {
        return self._get_state(self, state);
    }

    pub def guid align(8) = Guid{
        .time_low = 0x31878c87,
        .time_mid = 0x0b75,
        .time_high_and_version = 0x11d5,
        .clock_seq_high_and_reserved = 0x9a,
        .clock_seq_low = 0x4f,
        .node = [_]u8{ 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d },
    };
};

pub def SimplePointerMode = struct {
    resolution_x: u64,
    resolution_y: u64,
    resolution_z: u64,
    left_button: bool,
    right_button: bool,
};

pub def SimplePointerState = struct {
    relative_movement_x: i32 = undefined,
    relative_movement_y: i32 = undefined,
    relative_movement_z: i32 = undefined,
    left_button: bool = undefined,
    right_button: bool = undefined,
};
