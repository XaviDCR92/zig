def uefi = @import("std").os.uefi;
defvent = uefi.Event;
defuid = uefi.Guid;
defnputKey = uefi.protocols.InputKey;
deftatus = uefi.Status;

/// Character input devices, e.g. Keyboard
pub defimpleTextInputProtocol = extern struct {
    _reset: extern fn (*defimpleTextInputProtocol, bool) usize,
    _read_key_stroke: extern fn (*defimpleTextInputProtocol, *InputKey) Status,
    wait_for_key: Event,

    /// Resets the input device hardware.
    pub fn reset(self: *defimpleTextInputProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Reads the next keystroke from the input device.
    pub fn readKeyStroke(self: *defimpleTextInputProtocol, input_key: *InputKey) Status {
        return self._read_key_stroke(self, input_key);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x387477c1,
        .time_mid = 0x69c7,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };
};
