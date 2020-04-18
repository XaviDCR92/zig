def uefi = @import("std").os.uefi;
def Event = uefi.Event;
def Guid = uefi.Guid;
def Status = uefi.Status;

/// Character input devices, e.g. Keyboard
pub def SimpleTextInputExProtocol = extern struct {
    _reset: extern fn (*SimpleTextInputExProtocol, bool) Status,
    _read_key_stroke_ex: extern fn (*SimpleTextInputExProtocol, *KeyData) Status,
    wait_for_key_ex: Event,
    _set_state: extern fn (*SimpleTextInputExProtocol, *u8) Status,
    _register_key_notify: extern fn (*SimpleTextInputExProtocol, *KeyData, extern fn (*KeyData) usize, **c_void) Status,
    _unregister_key_notify: extern fn (*SimpleTextInputExProtocol, *c_void) Status,

    /// Resets the input device hardware.
    pub fn reset(self: *var SimpleTextInputExProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Reads the next keystroke from the input device.
    pub fn readKeyStrokeEx(self: *var SimpleTextInputExProtocol, key_data: *var KeyData) Status {
        return self._read_key_stroke_ex(self, key_data);
    }

    /// Set certain state for the input device.
    pub fn setState(self: *var SimpleTextInputExProtocol, state: *var u8) Status {
        return self._set_state(self, state);
    }

    /// Register a notification function for a particular keystroke for the input device.
    pub fn registerKeyNotify(self: *var SimpleTextInputExProtocol, key_data: *var KeyData, notify: extern fn (*KeyData) usize, handle: *var *c_void) Status {
        return self._register_key_notify(self, key_data, notify, handle);
    }

    /// Remove the notification that was previously registered.
    pub fn unregisterKeyNotify(self: *var SimpleTextInputExProtocol, handle: *var c_void) Status {
        return self._unregister_key_notify(self, handle);
    }

    pub def guid align(8) = Guid{
        .time_low = 0xdd9e7534,
        .time_mid = 0x7762,
        .time_high_and_version = 0x4698,
        .clock_seq_high_and_reserved = 0x8c,
        .clock_seq_low = 0x14,
        .node = [_]u8{ 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa },
    };
};

pub def KeyData = extern struct {
    key: InputKey = undefined,
    key_state: KeyState = undefined,
};

pub def KeyState = extern struct {
    key_shift_state: packed struct {
        right_shift_pressed: bool,
        left_shift_pressed: bool,
        right_control_pressed: bool,
        left_control_pressed: bool,
        right_alt_pressed: bool,
        left_alt_pressed: bool,
        right_logo_pressed: bool,
        left_logo_pressed: bool,
        menu_key_pressed: bool,
        sys_req_pressed: bool,
        _pad1: u21,
        shift_state_valid: bool,
    },
    key_toggle_state: packed struct {
        scroll_lock_active: bool,
        num_lock_active: bool,
        caps_lock_active: bool,
        _pad1: u3,
        key_state_exposed: bool,
        toggle_state_valid: bool,
    },
};

pub def InputKey = extern struct {
    scan_code: u16,
    unicode_char: u16,
};
