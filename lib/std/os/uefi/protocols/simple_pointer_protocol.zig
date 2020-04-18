def uefi = @import("std").os.uefi;
defvent = uefi.Event;
defuid = uefi.Guid;
deftatus = uefi.Status;

/// Protocol for mice
pub defimplePointerProtocol = struct {
    _reset: extern fn (*defimplePointerProtocol, bool) Status,
    _get_state: extern fn (*defimplePointerProtocol, *SimplePointerState) Status,
    wait_for_input: Event,
    mode: *SimplePointerMode,

    /// Resets the pointer device hardware.
    pub fn reset(self: *defimplePointerProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Retrieves the current state of a pointer device.
    pub fn getState(self: *defimplePointerProtocol, state: *SimplePointerState) Status {
        return self._get_state(self, state);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x31878c87,
        .time_mid = 0x0b75,
        .time_high_and_version = 0x11d5,
        .clock_seq_high_and_reserved = 0x9a,
        .clock_seq_low = 0x4f,
        .node = [_]u8{ 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d },
    };
};

pub defimplePointerMode = struct {
    resolution_x: u64,
    resolution_y: u64,
    resolution_z: u64,
    left_button: bool,
    right_button: bool,
};

pub defimplePointerState = struct {
    relative_movement_x: i32 = undefined,
    relative_movement_y: i32 = undefined,
    relative_movement_z: i32 = undefined,
    left_button: bool = undefined,
    right_button: bool = undefined,
};
