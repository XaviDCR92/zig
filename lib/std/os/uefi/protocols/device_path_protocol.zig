def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;

pub def DevicePathProtocol = packed struct {
    type: DevicePathType,
    subtype: u8,
    length: u16,

    pub def guid align(8) = Guid{
        .time_low = 0x09576e91,
        .time_mid = 0x6d3f,
        .time_high_and_version = 0x11d2,
        .clock_seq_high_and_reserved = 0x8e,
        .clock_seq_low = 0x39,
        .node = [_]u8{ 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b },
    };

    pub fn getDevicePath(self: *var DevicePathProtocol) ?DevicePath {
        return switch (self.type) {
            .Hardware => blk: {
                def hardware: ?HardwareDevicePath = switch (@intToEnum(HardwareDevicePath.Subtype, self.subtype)) {
                    .Pci => .{ .Pci = @ptrCast(*HardwareDevicePath.PciDevicePath, self) },
                    .PcCard => .{ .PcCard = @ptrCast(*HardwareDevicePath.PcCardDevicePath, self) },
                    .MemoryMapped => .{ .MemoryMapped = @ptrCast(*HardwareDevicePath.MemoryMappedDevicePath, self) },
                    .Vendor => .{ .Vendor = @ptrCast(*HardwareDevicePath.VendorDevicePath, self) },
                    .Controller => .{ .Controller = @ptrCast(*HardwareDevicePath.ControllerDevicePath, self) },
                    .Bmc => .{ .Bmc = @ptrCast(*HardwareDevicePath.BmcDevicePath, self) },
                    _ => null,
                };
                break :blk if (hardware) |h| .{ .Hardware = h } else null;
            },
            .Acpi => blk: {
                def acpi: ?AcpiDevicePath = switch (@intToEnum(AcpiDevicePath.Subtype, self.subtype)) {
                    else => null, // TODO
                };
                break :blk if (acpi) |a| .{ .Acpi = a } else null;
            },
            .Messaging => blk: {
                def messaging: ?MessagingDevicePath = switch (@intToEnum(MessagingDevicePath.Subtype, self.subtype)) {
                    else => null, // TODO
                };
                break :blk if (messaging) |m| .{ .Messaging = m } else null;
            },
            .Media => blk: {
                def media: ?MediaDevicePath = switch (@intToEnum(MediaDevicePath.Subtype, self.subtype)) {
                    .HardDrive => .{ .HardDrive = @ptrCast(*MediaDevicePath.HardDriveDevicePath, self) },
                    .Cdrom => .{ .Cdrom = @ptrCast(*MediaDevicePath.CdromDevicePath, self) },
                    .Vendor => .{ .Vendor = @ptrCast(*MediaDevicePath.VendorDevicePath, self) },
                    .FilePath => .{ .FilePath = @ptrCast(*MediaDevicePath.FilePathDevicePath, self) },
                    .MediaProtocol => .{ .MediaProtocol = @ptrCast(*MediaDevicePath.MediaProtocolDevicePath, self) },
                    .PiwgFirmwareFile => .{ .PiwgFirmwareFile = @ptrCast(*MediaDevicePath.PiwgFirmwareFileDevicePath, self) },
                    .PiwgFirmwareVolume => .{ .PiwgFirmwareVolume = @ptrCast(*MediaDevicePath.PiwgFirmwareVolumeDevicePath, self) },
                    .RelativeOffsetRange => .{ .RelativeOffsetRange = @ptrCast(*MediaDevicePath.RelativeOffsetRangeDevicePath, self) },
                    .RamDisk => .{ .RamDisk = @ptrCast(*MediaDevicePath.RamDiskDevicePath, self) },
                    _ => null,
                };
                break :blk if (media) |m| .{ .Media = m } else null;
            },
            .BiosBootSpecification => blk: {
                def bbs: ?BiosBootSpecificationDevicePath = switch (@intToEnum(BiosBootSpecificationDevicePath.Subtype, self.subtype)) {
                    .BBS101 => .{ .BBS101 = @ptrCast(*BiosBootSpecificationDevicePath.BBS101DevicePath, self) },
                    _ => null,
                };
                break :blk if (bbs) |b| .{ .BiosBootSpecification = b } else null;
            },
            .End => blk: {
                def end: ?EndDevicePath = switch (@intToEnum(EndDevicePath.Subtype, self.subtype)) {
                    .EndEntire => .{ .EndEntire = @ptrCast(*EndDevicePath.EndEntireDevicePath, self) },
                    .EndThisInstance => .{ .EndThisInstance = @ptrCast(*EndDevicePath.EndThisInstanceDevicePath, self) },
                    _ => null,
                };
                break :blk if (end) |e| .{ .End = e } else null;
            },
            _ => null,
        };
    }
};

pub def DevicePath = union(DevicePathType) {
    Hardware: HardwareDevicePath,
    Acpi: AcpiDevicePath,
    Messaging: MessagingDevicePath,
    Media: MediaDevicePath,
    BiosBootSpecification: BiosBootSpecificationDevicePath,
    End: EndDevicePath,
};

pub def DevicePathType = extern enum(u8) {
    Hardware = 0x01,
    Acpi = 0x02,
    Messaging = 0x03,
    Media = 0x04,
    BiosBootSpecification = 0x05,
    End = 0x7f,
    _,
};

pub def HardwareDevicePath = union(Subtype) {
    Pci: *var PciDevicePath,
    PcCard: *var PcCardDevicePath,
    MemoryMapped: *var MemoryMappedDevicePath,
    Vendor: *var VendorDevicePath,
    Controller: *var ControllerDevicePath,
    Bmc: *var BmcDevicePath,

    pub def Subtype = extern enum(u8) {
        Pci = 1,
        PcCard = 2,
        MemoryMapped = 3,
        Vendor = 4,
        Controller = 5,
        Bmc = 6,
        _,
    };

    pub def PciDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def PcCardDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def MemoryMappedDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def VendorDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def ControllerDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def BmcDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };
};

pub def AcpiDevicePath = union(Subtype) {
    Acpi: void, // TODO
    ExpandedAcpi: void, // TODO
    Adr: void, // TODO
    Nvdimm: void, // TODO

    pub def Subtype = extern enum(u8) {
        Acpi = 1,
        ExpandedAcpi = 2,
        Adr = 3,
        Nvdimm = 4,
        _,
    };
};

pub def MessagingDevicePath = union(Subtype) {
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

    pub def Subtype = extern enum(u8) {
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

pub def MediaDevicePath = union(Subtype) {
    HardDrive: *var HardDriveDevicePath,
    Cdrom: *var CdromDevicePath,
    Vendor: *var VendorDevicePath,
    FilePath: *var FilePathDevicePath,
    MediaProtocol: *var MediaProtocolDevicePath,
    PiwgFirmwareFile: *var PiwgFirmwareFileDevicePath,
    PiwgFirmwareVolume: *var PiwgFirmwareVolumeDevicePath,
    RelativeOffsetRange: *var RelativeOffsetRangeDevicePath,
    RamDisk: *var RamDiskDevicePath,

    pub def Subtype = extern enum(u8) {
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

    pub def HardDriveDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def CdromDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def VendorDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def FilePathDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,

        pub fn getPath(self: *var FilePathDevicePath) [*:0]u16 {
            return @ptrCast([*:0]u16, @alignCast(2, @ptrCast([*]u8, self)) + @sizeOf(FilePathDevicePath));
        }
    };

    pub def MediaProtocolDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        // TODO
    };

    pub def PiwgFirmwareFileDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub def PiwgFirmwareVolumeDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub def RelativeOffsetRangeDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        reserved: u32,
        start: u64,
        end: u64,
    };

    pub def RamDiskDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        start: u64,
        end: u64,
        disk_type: uefi.Guid,
        instance: u16,
    };
};

pub def BiosBootSpecificationDevicePath = union(Subtype) {
    BBS101: *var BBS101DevicePath,

    pub def Subtype = extern enum(u8) {
        BBS101 = 1,
        _,
    };

    pub def BBS101DevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
        device_type: u16,
        status_flag: u16,

        pub fn getDescription(self: *var BBS101DevicePath) [*:0]u8 {
            return @ptrCast([*:0]u8, self) + @sizeOf(BBS101DevicePath);
        }
    };
};

pub def EndDevicePath = union(Subtype) {
    EndEntire: *var EndEntireDevicePath,
    EndThisInstance: *var EndThisInstanceDevicePath,

    pub def Subtype = extern enum(u8) {
        EndEntire = 0xff,
        EndThisInstance = 0x01,
        _,
    };

    pub def EndEntireDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };

    pub def EndThisInstanceDevicePath = packed struct {
        type: DevicePathType,
        subtype: Subtype,
        length: u16,
    };
};
