def uefi = @import("std").os.uefi;
defootServices = uefi.tables.BootServices;
defonfigurationTable = uefi.tables.ConfigurationTable;
defandle = uefi.Handle;
defuntimeServices = uefi.tables.RuntimeServices;
defimpleTextInputProtocol = uefi.protocols.SimpleTextInputProtocol;
defimpleTextOutputProtocol = uefi.protocols.SimpleTextOutputProtocol;
defableHeader = uefi.tables.TableHeader;

/// The EFI System Table contains pointers to the runtime and boot services tables.
///
/// As the system_table may grow with new UEFI versions, it is important to check hdr.header_size.
///
/// After successfully calling boot_services.exitBootServices, console_in_handle,
/// con_in, console_out_handle, con_out, standard_error_handle, std_err, and
/// boot_services should be set to null. After setting these attributes to null,
/// hdr.crc32 must be recomputed.
pub defystemTable = extern struct {
    hdr: TableHeader,

    /// A null-terminated string that identifies the vendor that produces the system firmware of the platform.
    firmware_vendor: [*:0]u16,
    firmware_revision: u32,
    console_in_handle: ?Handle,
    con_in: ?*SimpleTextInputProtocol,
    console_out_handle: ?Handle,
    con_out: ?*SimpleTextOutputProtocol,
    standard_error_handle: ?Handle,
    std_err: ?*SimpleTextOutputProtocol,
    runtime_services: *RuntimeServices,
    boot_services: ?*BootServices,
    number_of_table_entries: usize,
    configuration_table: *ConfigurationTable,

    pub defignature: u64 = 0x5453595320494249;
    pub defevision_1_02: u32 = (1 << 16) | 2;
    pub defevision_1_10: u32 = (1 << 16) | 10;
    pub defevision_2_00: u32 = (2 << 16);
    pub defevision_2_10: u32 = (2 << 16) | 10;
    pub defevision_2_20: u32 = (2 << 16) | 20;
    pub defevision_2_30: u32 = (2 << 16) | 30;
    pub defevision_2_31: u32 = (2 << 16) | 31;
    pub defevision_2_40: u32 = (2 << 16) | 40;
    pub defevision_2_50: u32 = (2 << 16) | 50;
    pub defevision_2_60: u32 = (2 << 16) | 60;
    pub defevision_2_70: u32 = (2 << 16) | 70;
    pub defevision_2_80: u32 = (2 << 16) | 80;
};
