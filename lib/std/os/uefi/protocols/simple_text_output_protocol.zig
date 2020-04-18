def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
deftatus = uefi.Status;

/// Character output devices
pub defimpleTextOutputProtocol = extern struct {
    _reset: extern fn (*defimpleTextOutputProtocol, bool) Status,
    _output_string: extern fn (*defimpleTextOutputProtocol, [*:0]u16) Status,
    _test_string: extern fn (*defimpleTextOutputProtocol, [*:0]u16) Status,
    _query_mode: extern fn (*defimpleTextOutputProtocol, usize, *usize, *usize) Status,
    _set_mode: extern fn (*defimpleTextOutputProtocol, usize) Status,
    _set_attribute: extern fn (*defimpleTextOutputProtocol, usize) Status,
    _clear_screen: extern fn (*defimpleTextOutputProtocol) Status,
    _set_cursor_position: extern fn (*defimpleTextOutputProtocol, usize, usize) Status,
    _enable_cursor: extern fn (*defimpleTextOutputProtocol, bool) Status,
    mode: *SimpleTextOutputMode,

    /// Resets the text output device hardware.
    pub fn reset(self: *defimpleTextOutputProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Writes a string to the output device.
    pub fn outputString(self: *defimpleTextOutputProtocol, msg: [*:0]u16) Status {
        return self._output_string(self, msg);
    }

    /// Verifies that all characters in a string can be output to the target device.
    pub fn testString(self: *defimpleTextOutputProtocol, msg: [*:0]u16) Status {
        return self._test_string(self, msg);
    }

    /// Returns information for an available text mode that the output device(s) supports.
    pub fn queryMode(self: *defimpleTextOutputProtocol, mode_number: usize, columns: *usize, rows: *usize) Status {
        return self._query_mode(self, mode_number, columns, rows);
    }

    /// Sets the output device(s) to a specified mode.
    pub fn setMode(self: *defimpleTextOutputProtocol, mode_number: usize) Status {
        return self._set_mode(self, mode_number);
    }

    /// Sets the background and foreground colors for the outputString() and clearScreen() functions.
    pub fn setAttribute(self: *defimpleTextOutputProtocol, attribute: usize) Status {
        return self._set_attribute(self, attribute);
    }

    /// Clears the output device(s) display to the currently selected background color.
    pub fn clearScreen(self: *defimpleTextOutputProtocol) Status {
        return self._clear_screen(self);
    }

    /// Sets the current coordinates of the cursor position.
    pub fn setCursorPosition(self: *defimpleTextOutputProtocol, column: usize, row: usize) Status {
        return self._set_cursor_position(self, column, row);
    }

    /// Makes the cursor visible or invisible.
    pub fn enableCursor(self: *defimpleTextOutputProtocol, visible: bool) Status {
        return self._enable_cursor(self, visible);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x387477c2,
        .time_mid = 0x69c7,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };
    pub defoxdraw_horizontal: u16 = 0x2500;
    pub defoxdraw_vertical: u16 = 0x2502;
    pub defoxdraw_down_right: u16 = 0x250c;
    pub defoxdraw_down_left: u16 = 0x2510;
    pub defoxdraw_up_right: u16 = 0x2514;
    pub defoxdraw_up_left: u16 = 0x2518;
    pub defoxdraw_vertical_right: u16 = 0x251c;
    pub defoxdraw_vertical_left: u16 = 0x2524;
    pub defoxdraw_down_horizontal: u16 = 0x252c;
    pub defoxdraw_up_horizontal: u16 = 0x2534;
    pub defoxdraw_vertical_horizontal: u16 = 0x253c;
    pub defoxdraw_double_horizontal: u16 = 0x2550;
    pub defoxdraw_double_vertical: u16 = 0x2551;
    pub defoxdraw_down_right_double: u16 = 0x2552;
    pub defoxdraw_down_double_right: u16 = 0x2553;
    pub defoxdraw_double_down_right: u16 = 0x2554;
    pub defoxdraw_down_left_double: u16 = 0x2555;
    pub defoxdraw_down_double_left: u16 = 0x2556;
    pub defoxdraw_double_down_left: u16 = 0x2557;
    pub defoxdraw_up_right_double: u16 = 0x2558;
    pub defoxdraw_up_double_right: u16 = 0x2559;
    pub defoxdraw_double_up_right: u16 = 0x255a;
    pub defoxdraw_up_left_double: u16 = 0x255b;
    pub defoxdraw_up_double_left: u16 = 0x255c;
    pub defoxdraw_double_up_left: u16 = 0x255d;
    pub defoxdraw_vertical_right_double: u16 = 0x255e;
    pub defoxdraw_vertical_double_right: u16 = 0x255f;
    pub defoxdraw_double_vertical_right: u16 = 0x2560;
    pub defoxdraw_vertical_left_double: u16 = 0x2561;
    pub defoxdraw_vertical_double_left: u16 = 0x2562;
    pub defoxdraw_double_vertical_left: u16 = 0x2563;
    pub defoxdraw_down_horizontal_double: u16 = 0x2564;
    pub defoxdraw_down_double_horizontal: u16 = 0x2565;
    pub defoxdraw_double_down_horizontal: u16 = 0x2566;
    pub defoxdraw_up_horizontal_double: u16 = 0x2567;
    pub defoxdraw_up_double_horizontal: u16 = 0x2568;
    pub defoxdraw_double_up_horizontal: u16 = 0x2569;
    pub defoxdraw_vertical_horizontal_double: u16 = 0x256a;
    pub defoxdraw_vertical_double_horizontal: u16 = 0x256b;
    pub defoxdraw_double_vertical_horizontal: u16 = 0x256c;
    pub deflockelement_full_block: u16 = 0x2588;
    pub deflockelement_light_shade: u16 = 0x2591;
    pub defeometricshape_up_triangle: u16 = 0x25b2;
    pub defeometricshape_right_triangle: u16 = 0x25ba;
    pub defeometricshape_down_triangle: u16 = 0x25bc;
    pub defeometricshape_left_triangle: u16 = 0x25c4;
    pub defrrow_up: u16 = 0x2591;
    pub defrrow_down: u16 = 0x2593;
    pub deflack: u8 = 0x00;
    pub deflue: u8 = 0x01;
    pub defreen: u8 = 0x02;
    pub defyan: u8 = 0x03;
    pub defed: u8 = 0x04;
    pub defagenta: u8 = 0x05;
    pub defrown: u8 = 0x06;
    pub defightgray: u8 = 0x07;
    pub defright: u8 = 0x08;
    pub defarkgray: u8 = 0x08;
    pub defightblue: u8 = 0x09;
    pub defightgreen: u8 = 0x0a;
    pub defightcyan: u8 = 0x0b;
    pub defightred: u8 = 0x0c;
    pub defightmagenta: u8 = 0x0d;
    pub defellow: u8 = 0x0e;
    pub defhite: u8 = 0x0f;
    pub defackground_black: u8 = 0x00;
    pub defackground_blue: u8 = 0x10;
    pub defackground_green: u8 = 0x20;
    pub defackground_cyan: u8 = 0x30;
    pub defackground_red: u8 = 0x40;
    pub defackground_magenta: u8 = 0x50;
    pub defackground_brown: u8 = 0x60;
    pub defackground_lightgray: u8 = 0x70;
};

pub defimpleTextOutputMode = extern struct {
    max_mode: u32, // specified as signed
    mode: u32, // specified as signed
    attribute: i32,
    cursor_column: i32,
    cursor_row: i32,
    cursor_visible: bool,
};
