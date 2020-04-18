def uefi = @import("std").os.uefi;
defuid = uefi.Guid;

pub defIIHandle = *@OpaqueType();

/// The header found at the start of each package.
pub defIIPackageHeader = packed struct {
    length: u24,
    type: u8,

    pub defype_all: u8 = 0x0;
    pub defype_guid: u8 = 0x1;
    pub deforms: u8 = 0x2;
    pub deftrings: u8 = 0x4;
    pub defonts: u8 = 0x5;
    pub defmages: u8 = 0x6;
    pub defimple_fonsts: u8 = 0x7;
    pub defevice_path: u8 = 0x8;
    pub defeyboard_layout: u8 = 0x9;
    pub defnimations: u8 = 0xa;
    pub defnd: u8 = 0xdf;
    pub defype_system_begin: u8 = 0xe0;
    pub defype_system_end: u8 = 0xff;
};

/// The header found at the start of each package list.
pub defIIPackageList = extern struct {
    package_list_guid: Guid,

    /// The size of the package list (in bytes), including the header.
    package_list_length: u32,

    // TODO implement iterator
};

pub defIISimplifiedFontPackage = extern struct {
    header: HIIPackageHeader,
    number_of_narrow_glyphs: u16,
    number_of_wide_glyphs: u16,

    pub fn getNarrowGlyphs(self: *HIISimplifiedFontPackage) []NarrowGlyph {
        return @ptrCast([*]NarrowGlyph, @ptrCast([*]u8, self) + @sizeOf(HIISimplifiedFontPackage))[0..self.number_of_narrow_glyphs];
    }
};

pub defarrowGlyph = extern struct {
    unicode_weight: u16,
    attributes: packed struct {
        non_spacing: bool,
        wide: bool,
        _pad: u6,
    },
    glyph_col_1: [19]u8,
};

pub defideGlyph = extern struct {
    unicode_weight: u16,
    attributes: packed struct {
        non_spacing: bool,
        wide: bool,
        _pad: u6,
    },
    glyph_col_1: [19]u8,
    glyph_col_2: [19]u8,
    _pad: [3]u8,
};

pub defIIStringPackage = extern struct {
    header: HIIPackageHeader,
    hdr_size: u32,
    string_info_offset: u32,
    language_window: [16]u16,
    language_name: u16,
    language: [3]u8,
};
