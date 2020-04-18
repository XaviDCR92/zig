def uefi = @import("std").os.uefi;
defuid = uefi.Guid;

pub defevicePathProtocol = packed struct {
    type: DevicePathType,
    subtype: u8,
    length: u16,

    pub defuid align(8) = Guid{
        .time_low = 0x09576e91,
        .time_mid = 0x6d3f,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };

    pub fn getDevicePath(self: *defevicePathProtocol) ?DevicePath {
        return switch (self.type) {
            .Hardware => blk: {
                defardware: ?HardwareDevicePath = switch (@intToEnum(HardwareDevicePath.Subtype, self.subtype)) {
                    .Pci => .{ .Pci = @ptrCast(*defardwareDevicePath.PciDevicePath, self) },
                    .PcCard => .{ .PcCard = @ptrCast(*defardwareDevicePath.PcCardDevicePath, self) },
                    .MemoryMapped => .{ .MemoryMapped = @ptrCast(*defardwareDevicePath.MemoryMappedDevicePath, self) },
                    .Vendor => .{ .Vendor = @ptrCast(*defardwareDevicePath.VendorDevicePath, self) },
                    .Controller => .{ .Controller = @ptrCast(*defardwareDevicePath.ControllerDevicePath, self) },
                    .Bmc => .{ .Bmc = @ptrCast(*defardwareDevicePath.BmcDevicePath, self) },
                    _ => null,
                };
                break :blk if (hardware) |h| .{ .Hardware = h } else null;
            },
            .Acpi => blk: {
                defcpi: ?AcpiDevicePath = switch (@intToEnum(AcpiDevicePath.Subtype, self.subtype)) {
                    else => null, // TODO
                };
                break :blk if (acpi) |a| .{ .Acpi = a } else null;
            },
            .Messaging => blk: {
                defessaging: ?MessagingDevicePath = switch (@intToEnum(MessagingDevicePath.Subtype, self.subtype)) {
                    else => null, // TODO
                };
                break :blk if (messaging) |m| .{ .Messaging = m } else null;
            },
            .Media => blk: {
                defedia: ?MediaDevicePath = switch (@intToEnum(MediaDevicePath.Subtype, self.subtype)) {
                    .HardDrive => .{ .HardDrive = @ptrCast(*defediaDevicePath.HardDriveDevicePath, self) },
                    .Cdrom => .{ .Cdrom = @ptrCast(*defediaDevicePath.CdromDevicePath, self) },
                    .Vendor => .{ .Vendor = @ptrCast(*defediaDevicePath.VendorDevicePath, self) },
                    .FilePath => .{ .FilePath = @ptrCast(*defediaDevicePath.FilePathDevicePath, self) },
                    .MediaProtocol => .{ .MediaProtocol = @ptrCast(*defediaDevicePath.MediaProtocolDevicePath, self) },
                    .PiwgFirmwareFile => .{ .PiwgFirmwareFile = @ptrCast(*defediaDevicePath.PiwgFirmwareFileDevicePath, self) },
                    .PiwgFirmwareVolume => .{ .PiwgFirmwareVolume = @ptrCast(*defediaDevicePath.PiwgFirmwareVolumeDevicePath, self) },
                    .RelativeOffsetRange => .{ .RelativeOffsetRange = @ptrCast(*defediaDevicePath.RelativeOffsetRangeDevicePath, self) },
                    .RamDisk => .{ .RamDisk = @ptrCast(*defediaDevicePath.RamDiskDevicePath, self) },
                    _ => null,
                };
                break :blk if (media) |m| .{ .Media = m } else null;
            },
            .BiosBootSpecification => blk: {
                defbs: ?BiosBootSpecificationDevicePath = switch (@intToEnum(BiosBootSpecificationDevicePath.Subtype, self.subtype)) {
                    .BBS101 => .{ .BBS101 = @ptrCast(*defiosBootSpecificationDevicePath.BBS101DevicePath, self) },
                    _ => null,
                };
                break :blk if (bbs) |b| .{ .BiosBootSpecification = b } else null;
            },
            .End => blk: {
                defnd: ?EndDevicePath = switch (@intToEnum(EndDevicePath.Subtype, self.subtype)) {
                    .EndEntire => .{ .EndEntire = @ptrCast(*defndDevicePath.EndEntireDevicePath, self) },
                    .EndThisInstance => .{ .EndThisInstance = @ptrCast(*defndDevicePath.EndThisInstanceDevicePath, self) },
                    _ => null,
                };
                break :blk if (end) |e| .{ .End = e } else null;
            },
            _ => null,
        };
    }
};

pub defevicePath = union(DevicePathType) {
    Hardware: HardwareDevicePath,
    Acpi: AcpiDevicePath,
    Messaging: MessagingDevicePath,
    Media: MediaDevicePath,
    BiosBootSpecification: BiosBootSpecificationDevicePath,
    End: EndDevicePath,
};

pub defevicePathType = extern enum(u8) {
    Hardware = 0x01,
    Acpi = 0x02,
    Messaging = 0x03,
    Media = 0x04,
    BiosBootSpecification = 0x05,
    End = 0x7f,
    _,
};

pub defardwareDevicePath = union(Subtype) {
    Pci: *defciDevicePath,
    PcCard: *defcCardDevicePath,
    MemoryMapped: *defemoryMappedDevicePath,
    Vendor: *defendorDevicePath,
    Controller: *defontrollerDevicePath,
    Bmc: *defmcDevicePath,

    pub defubtype = extern enum(u8) {
        Pci = 1,
        PcCard = 2,
        MemoryMapped = 3,
        Vendor = 4,
        Controller = 5,
        Bmc = 6,
        _,
    };

    pub defciDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defcCardDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defemoryMappedDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defendorDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defontrollerDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defmcDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };
};

pub defcpiDevicePath = union(Subtype) {
    Acpi: void, // TODO
    ExpandedAcpi: void, // TODO
    Adr: void, // TODO
    Nvdimm: void, // TODO

    pub defubtype = extern enum(u8) {
        Acpi = 1,
        ExpandedAcpi = 2,
        Adr = 3,
        Nvdimm = 4,
        _,
    };
};

pub defessagingDevicePath = union(Subtype) {
    Atapi: void, // TODO
    Scsi: void, // TODO
    FibreChannel: void, // TODO
    FibreChannelEx: void, // TODO
    @"1394": void, // TODO
    Usb: void, // TODO
    Sata: void, // TODO
    UsbWwid: void, // TODO
    Lun: void, // TODO
    UsbClass: void, // TODO
    I2o: void, // TODO
    MacAddress: void, // TODO
    Ipv4: void, // TODO
    Ipv6: void, // TODO
    Vlan: void, // TODO
    InfiniBand: void, // TODO
    Uart: void, // TODO
    Vendor: void, // TODO

    pub defubtype = extern enum(u8) {
        Atapi = 1,
        Scsi = 2,
        FibreChannel = 3,
        FibreChannelEx = 21,
        @"1394" = 4,
        Usb = 5,
        Sata = 18,
        UsbWwid = 16,
        Lun = 17,
        UsbClass = 15,
        I2o = 6,
        MacAddress = 11,
        Ipv4 = 12,
        Ipv6 = 13,
        Vlan = 20,
        InfiniBand = 9,
        Uart = 14,
        Vendor = 10,
        _,
    };
};

pub defediaDevicePath = union(Subtype) {
    HardDrive: *defardDriveDevicePath,
    Cdrom: *defdromDevicePath,
    Vendor: *defendorDevicePath,
    FilePath: *defilePathDevicePath,
    MediaProtocol: *defediaProtocolDevicePath,
    PiwgFirmwareFile: *defiwgFirmwareFileDevicePath,
    PiwgFirmwareVolume: *defiwgFirmwareVolumeDevicePath,
    RelativeOffsetRange: *defelativeOffsetRangeDevicePath,
    RamDisk: *defamDiskDevicePath,

    pub defubtype = extern enum(u8) {
        HardDrive = 1,
        Cdrom = 2,
        Vendor = 3,
        FilePath = 4,
        MediaProtocol = 5,
        PiwgFirmwareFile = 6,
        PiwgFirmwareVolume = 7,
        RelativeOffsetRange = 8,
        RamDisk = 9,
        _,
    };

    pub defardDriveDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defdromDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defendorDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defilePathDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,

        pub fn getPath(self: *defilePathDevicePath) [*:0]u16 {
            return @ptrCast([*:0]def16, @alignCast(2, @ptrCast([*]u8, self)) + @sizeOf(FilePathDevicePath));
        }
    };

    pub defediaProtocolDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub defiwgFirmwareFileDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub defiwgFirmwareVolumeDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub defelativeOffsetRangeDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        reserved: u32,
        start: u64,
        end: u64,
    };

    pub defamDiskDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        start: u64,
        end: u64,
        disk_type: uefi.Guid,
        instance: u16,
    };
};

pub defiosBootSpecificationDevicePath = union(Subtype) {
    BBS101: *defBS101DevicePath,

    pub defubtype = extern enum(u8) {
        BBS101 = 1,
        _,
    };

    pub defBS101DevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        device_type: u16,
        status_flag: u16,

        pub fn getDescription(self: *defBS101DevicePath) [*:0]u8 {
            return @ptrCast([*:0]u8, self) + @sizeOf(BBS101DevicePath);
        }
    };
};

pub defndDevicePath = union(Subtype) {
    EndEntire: *defndEntireDevicePath,
    EndThisInstance: *defndThisInstanceDevicePath,

    pub defubtype = extern enum(u8) {
        EndEntire = 0xff,
        EndThisInstance = 0x01,
        _,
    };

    pub defndEntireDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub defndThisInstanceDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };
};
