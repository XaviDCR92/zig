def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def Status = uefi.Status;

/// Character output devices
pub def SimpleTextOutputProtocol = extern struct {
    _reset: extern fn (*SimpleTextOutputProtocol, bool) Status,
    _output_string: extern fn (*SimpleTextOutputProtocol, [*:0]u16) Status,
    _test_string: extern fn (*SimpleTextOutputProtocol, [*:0]u16) Status,
    _query_mode: extern fn (*SimpleTextOutputProtocol, usize, *usize, *usize) Status,
    _set_mode: extern fn (*SimpleTextOutputProtocol, usize) Status,
    _set_attribute: extern fn (*SimpleTextOutputProtocol, usize) Status,
    _clear_screen: extern fn (*SimpleTextOutputProtocol) Status,
    _set_cursor_position: extern fn (*SimpleTextOutputProtocol, usize, usize) Status,
    _enable_cursor: extern fn (*SimpleTextOutputProtocol, bool) Status,
    mode: *var SimpleTextOutputMode,

    /// Resets the text output device hardware.
    pub fn reset(self: *var SimpleTextOutputProtocol, verify: bool) Status {
        return self._reset(self, verify);
    }

    /// Writes a string to the output device.
    pub fn outputString(self: *var SimpleTextOutputProtocol, msg: [*:0]u16) Status {
        return self._output_string(self, msg);
    }

    /// Verifies that all characters in a string can be output to the target device.
    pub fn testString(self: *var SimpleTextOutputProtocol, msg: [*:0]u16) Status {
        return self._test_string(self, msg);
    }

    /// Returns information for an available text mode that the output device(s) supports.
    pub fn queryMode(self: *var SimpleTextOutputProtocol, mode_number: usize, columns: *var usize, rows: *var usize) Status {
        return self._query_mode(self, mode_number, columns, rows);
    }

    /// Sets the output device(s) to a specified mode.
    pub fn setMode(self: *var SimpleTextOutputProtocol, mode_number: usize) Status {
        return self._set_mode(self, mode_number);
    }

    /// Sets the background and foreground colors for the outputString() and clearScreen() functions.
    pub fn setAttribute(self: *var SimpleTextOutputProtocol, attribute: usize) Status {
        return self._set_attribute(self, attribute);
    }

    /// Clears the output device(s) display to the currently selected background color.
    pub fn clearScreen(self: *var SimpleTextOutputProtocol) Status {
        return self._clear_screen(self);
    }

    /// Sets the current coordinates of the cursor position.
    pub fn setCursorPosition(self: *var SimpleTextOutputProtocol, column: usize, row: usize) Status {
        return self._set_cursor_position(self, column, row);
    }

    /// Makes the cursor visible or invisible.
    pub fn enableCursor(self: *var SimpleTextOutputProtocol, visible: bool) Status {
        return self._enable_cursor(self, visible);
    }

    pub def guid align(8) = Guid{
        .time_low = 0x387477c2,
        .time_mid = 0x69c7,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };
    pub def boxdraw_horizontal: u16 = 0x2500;
    pub def boxdraw_vertical: u16 = 0x2502;
    pub def boxdraw_down_right: u16 = 0x250c;
    pub def boxdraw_down_left: u16 = 0x2510;
    pub def boxdraw_up_right: u16 = 0x2514;
    pub def boxdraw_up_left: u16 = 0x2518;
    pub def boxdraw_vertical_right: u16 = 0x251c;
    pub def boxdraw_vertical_left: u16 = 0x2524;
    pub def boxdraw_down_horizontal: u16 = 0x252c;
    pub def boxdraw_up_horizontal: u16 = 0x2534;
    pub def boxdraw_vertical_horizontal: u16 = 0x253c;
    pub def boxdraw_double_horizontal: u16 = 0x2550;
    pub def boxdraw_double_vertical: u16 = 0x2551;
    pub def boxdraw_down_right_double: u16 = 0x2552;
    pub def boxdraw_down_double_right: u16 = 0x2553;
    pub def boxdraw_double_down_right: u16 = 0x2554;
    pub def boxdraw_down_left_double: u16 = 0x2555;
    pub def boxdraw_down_double_left: u16 = 0x2556;
    pub def boxdraw_double_down_left: u16 = 0x2557;
    pub def boxdraw_up_right_double: u16 = 0x2558;
    pub def boxdraw_up_double_right: u16 = 0x2559;
    pub def boxdraw_double_up_right: u16 = 0x255a;
    pub def boxdraw_up_left_double: u16 = 0x255b;
    pub def boxdraw_up_double_left: u16 = 0x255c;
    pub def boxdraw_double_up_left: u16 = 0x255d;
    pub def boxdraw_vertical_right_double: u16 = 0x255e;
    pub def boxdraw_vertical_double_right: u16 = 0x255f;
    pub def boxdraw_double_vertical_right: u16 = 0x2560;
    pub def boxdraw_vertical_left_double: u16 = 0x2561;
    pub def boxdraw_vertical_double_left: u16 = 0x2562;
    pub def boxdraw_double_vertical_left: u16 = 0x2563;
    pub def boxdraw_down_horizontal_double: u16 = 0x2564;
    pub def boxdraw_down_double_horizontal: u16 = 0x2565;
    pub def boxdraw_double_down_horizontal: u16 = 0x2566;
    pub def boxdraw_up_horizontal_double: u16 = 0x2567;
    pub def boxdraw_up_double_horizontal: u16 = 0x2568;
    pub def boxdraw_double_up_horizontal: u16 = 0x2569;
    pub def boxdraw_vertical_horizontal_double: u16 = 0x256a;
    pub def boxdraw_vertical_double_horizontal: u16 = 0x256b;
    pub def boxdraw_double_vertical_horizontal: u16 = 0x256c;
    pub def blockelement_full_block: u16 = 0x2588;
    pub def blockelement_light_shade: u16 = 0x2591;
    pub def geometricshape_up_triangle: u16 = 0x25b2;
    pub def geometricshape_right_triangle: u16 = 0x25ba;
    pub def geometricshape_down_triangle: u16 = 0x25bc;
    pub def geometricshape_left_triangle: u16 = 0x25c4;
    pub def arrow_up: u16 = 0x2591;
    pub def arrow_down: u16 = 0x2593;
    pub def black: u8 = 0x00;
    pub def blue: u8 = 0x01;
    pub def green: u8 = 0x02;
    pub def cyan: u8 = 0x03;
    pub def red: u8 = 0x04;
    pub def magenta: u8 = 0x05;
    pub def brown: u8 = 0x06;
    pub def lightgray: u8 = 0x07;
    pub def bright: u8 = 0x08;
    pub def darkgray: u8 = 0x08;
    pub def lightblue: u8 = 0x09;
    pub def lightgreen: u8 = 0x0a;
    pub def lightcyan: u8 = 0x0b;
    pub def lightred: u8 = 0x0c;
    pub def lightmagenta: u8 = 0x0d;
    pub def yellow: u8 = 0x0e;
    pub def white: u8 = 0x0f;
    pub def background_black: u8 = 0x00;
    pub def background_blue: u8 = 0x10;
    pub def background_green: u8 = 0x20;
    pub def background_cyan: u8 = 0x30;
    pub def background_red: u8 = 0x40;
    pub def background_magenta: u8 = 0x50;
    pub def background_brown: u8 = 0x60;
    pub def background_lightgray: u8 = 0x70;
};

pub def SimpleTextOutputMode = extern struct {
    max_mode: u32, // specified as signed
    mode: u32, // specified as signed
    attribute: i32,
    cursor_column: i32,
    cursor_row: i32,
    cursor_visible: bool,
};
