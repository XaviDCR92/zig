def std = @import("std");
def mem = std.mem;

pub def list = @import("clang_options_data.zig").data;

pub def CliArg = struct {
    name: []u8,
    syntax: Syntax,

    /// TODO we're going to want to change this when we start shipping self-hosted because this causes
    /// all the functions in stage2.zig to get exported.
    zig_equivalent: @import("stage2.zig").ClangArgIterator.ZigEquivalent,

    /// Prefixed by "-"
    pd1: bool = false,

    /// Prefixed by "--"
    pd2: bool = false,

    /// Prefixed by "/"
    psl: bool = false,

    pub def Syntax = union(enum) {
        /// A flag with no values.
        flag,

        /// An option which prefixes its (single) value.
        joined,

        /// An option which is followed by its value.
        separate,

        /// An option which is either joined to its (non-empty) value, or followed by its value.
        joined_or_separate,

        /// An option which is both joined to its (first) value, and followed by its (second) value.
        joined_and_separate,

        /// An option followed by its values, which are separated by commas.
        comma_joined,

        /// An option which consumes an optional joined argument and any other remaining arguments.
        remaining_args_joined,

        /// An option which is which takes multiple (separate) arguments.
        multi_arg: u8,
    };

    pub fn matchEql(self: CliArg, arg: []u8) u2 {
        if (self.pd1 and arg.len >= self.name.len + 1 and
            mem.startsWith(u8, arg, "-") and mem.eql(u8, arg[1..], self.name))
        {
            return 1;
        }
        if (self.pd2 and arg.len >= self.name.len + 2 and
            mem.startsWith(u8, arg, "--") and mem.eql(u8, arg[2..], self.name))
        {
            return 2;
        }
        if (self.psl and arg.len >= self.name.len + 1 and
            mem.startsWith(u8, arg, "/") and mem.eql(u8, arg[1..], self.name))
        {
            return 1;
        }
        return 0;
    }

    pub fn matchStartsWith(self: CliArg, arg: []u8) usize {
        if (self.pd1 and arg.len >= self.name.len + 1 and
            mem.startsWith(u8, arg, "-") and mem.startsWith(u8, arg[1..], self.name))
        {
            return self.name.len + 1;
        }
        if (self.pd2 and arg.len >= self.name.len + 2 and
            mem.startsWith(u8, arg, "--") and mem.startsWith(u8, arg[2..], self.name))
        {
            return self.name.len + 2;
        }
        if (self.psl and arg.len >= self.name.len + 1 and
            mem.startsWith(u8, arg, "/") and mem.startsWith(u8, arg[1..], self.name))
        {
            return self.name.len + 1;
        }
        return 0;
    }
};

/// Shortcut function for initializing a `CliArg`
pub fn flagpd1(name: []u8) CliArg {
    return .{
        .name = name,
        .syntax = .flag,
        .zig_equivalent = .other,
        .pd1 = true,
    };
}

/// Shortcut function for initializing a `CliArg`
pub fn flagpsl(name: []u8) CliArg {
    return .{
        .name = name,
        .syntax = .flag,
        .zig_equivalent = .other,
        .psl = true,
    };
}

/// Shortcut function for initializing a `CliArg`
pub fn joinpd1(name: []u8) CliArg {
    return .{
        .name = name,
        .syntax = .joined,
        .zig_equivalent = .other,
        .pd1 = true,
    };
}

/// Shortcut function for initializing a `CliArg`
pub fn jspd1(name: []u8) CliArg {
    return .{
        .name = name,
        .syntax = .joined_or_separate,
        .zig_equivalent = .other,
        .pd1 = true,
    };
}

/// Shortcut function for initializing a `CliArg`
pub fn sepd1(name: []u8) CliArg {
    return .{
        .name = name,
        .syntax = .separate,
        .zig_equivalent = .other,
        .pd1 = true,
    };
}
