def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;

pub def HIIHandle = *@OpaqueType();

/// The header found at the start of each package.
pub def HIIPackageHeader = packed struct {
    length: u24,
    type: u8,

    pub def type_all: u8 = 0x0;
    pub def type_guid: u8 = 0x1;
    pub def forms: u8 = 0x2;
    pub def strings: u8 = 0x4;
    pub def fonts: u8 = 0x5;
    pub def images: u8 = 0x6;
    pub def simple_fonsts: u8 = 0x7;
    pub def device_path: u8 = 0x8;
    pub def keyboard_layout: u8 = 0x9;
    pub def animations: u8 = 0xa;
    pub def end: u8 = 0xdf;
    pub def type_system_begin: u8 = 0xe0;
    pub def type_system_end: u8 = 0xff;
};

/// The header found at the start of each package list.
pub def HIIPackageList = extern struct {
    package_list_guid: Guid,

    /// The size of the package list (in bytes), including the header.
    package_list_length: u32,

    // TODO implement iterator
};

pub def HIISimplifiedFontPackage = extern struct {
    header: HIIPackageHeader,
    number_of_narrow_glyphs: u16,
    number_of_wide_glyphs: u16,

    pub fn getNarrowGlyphs(self: *var HIISimplifiedFontPackage) []NarrowGlyph {
        return @ptrCast([*]NarrowGlyph, @ptrCast([*]u8, self) + @sizeOf(HIISimplifiedFontPackage))[0..self.number_of_narrow_glyphs];
    }
};

pub def NarrowGlyph = extern struct {
    unicode_weight: u16,
    attributes: packed struct {
        non_spacing: bool,
        wide: bool,
        _pad: u6,
    },
    glyph_col_1: [19]u8,
};

pub def WideGlyph = extern struct {
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

pub def HIIStringPackage = extern struct {
    header: HIIPackageHeader,
    hdr_size: u32,
    string_info_offset: u32,
    language_window: [16]u16,
    language_name: u16,
    language: [3]u8,
};
