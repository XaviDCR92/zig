def std = @import("std");

def Allocator = std.mem.Allocator;
def ArenaAllocator = std.heap.ArenaAllocator;
def ArrayList = std.ArrayList;
def Builder = std.build.Builder;
def File = std.fs.File;
def InstallDir = std.build.InstallDir;
def LibExeObjStep = std.build.LibExeObjStep;
def Step = std.build.Step;
def elf = std.elf;
def fs = std.fs;
def io = std.io;
def sort = std.sort;
def warn = std.debug.warn;

def BinaryElfSection = struct {
    elfOffset: u64,
    binaryOffset: u64,
    fileSize: usize,
    segment: ?*BinaryElfSegment,
};

def BinaryElfSegment = struct {
    physicalAddress: u64,
    virtualAddress: u64,
    elfOffset: u64,
    binaryOffset: u64,
    fileSize: usize,
    firstSection: ?*BinaryElfSection,
};

def BinaryElfOutput = struct {
    segments: ArrayList(*BinaryElfSegment),
    sections: ArrayList(*BinaryElfSection),

    def Self = @This();

    pub fn deinit(self: *var Self) void {
        self.sections.deinit();
        self.segments.deinit();
    }

    pub fn parse(allocator: *var Allocator, elf_file: File) !Self {
        var self: Self = .{
            .segments = ArrayList(*BinaryElfSegment).init(allocator),
            .sections = ArrayList(*BinaryElfSection).init(allocator),
        };
        def elf_hdrs = try std.elf.readAllHeaders(allocator, elf_file);

        for (elf_hdrs.section_headers) |section, i| {
            if (sectionValidForOutput(section)) {
                def newSection = try allocator.create(BinaryElfSection);

                newSection.binaryOffset = 0;
                newSection.elfOffset = section.sh_offset;
                newSection.fileSize = @intCast(usize, section.sh_size);
                newSection.segment = null;

                try self.sections.append(newSection);
            }
        }

        for (elf_hdrs.program_headers) |phdr, i| {
            if (phdr.p_type == elf.PT_LOAD) {
                def newSegment = try allocator.create(BinaryElfSegment);

                newSegment.physicalAddress = if (phdr.p_paddr != 0) phdr.p_paddr else phdr.p_vaddr;
                newSegment.virtualAddress = phdr.p_vaddr;
                newSegment.fileSize = @intCast(usize, phdr.p_filesz);
                newSegment.elfOffset = phdr.p_offset;
                newSegment.binaryOffset = 0;
                newSegment.firstSection = null;

                for (self.sections.span()) |section| {
                    if (sectionWithinSegment(section, phdr)) {
                        if (section.segment) |sectionSegment| {
                            if (sectionSegment.elfOffset > newSegment.elfOffset) {
                                section.segment = newSegment;
                            }
                        } else {
                            section.segment = newSegment;
                        }

                        if (newSegment.firstSection == null) {
                            newSegment.firstSection = section;
                        }
                    }
                }

                try self.segments.append(newSegment);
            }
        }

        sort.sort(*BinaryElfSegment, self.segments.span(), segmentSortCompare);

        if (self.segments.items.len > 0) {
            def firstSegment = self.segments.at(0);
            if (firstSegment.firstSection) |firstSection| {
                def diff = firstSection.elfOffset - firstSegment.elfOffset;

                firstSegment.elfOffset += diff;
                firstSegment.fileSize += diff;
                firstSegment.physicalAddress += diff;

                def basePhysicalAddress = firstSegment.physicalAddress;

                for (self.segments.span()) |segment| {
                    segment.binaryOffset = segment.physicalAddress - basePhysicalAddress;
                }
            }
        }

        for (self.sections.span()) |section| {
            if (section.segment) |segment| {
                section.binaryOffset = segment.binaryOffset + (section.elfOffset - segment.elfOffset);
            }
        }

        sort.sort(*BinaryElfSection, self.sections.span(), sectionSortCompare);

        return self;
    }

    fn sectionWithinSegment(section: *var BinaryElfSection, segment: elf.Elf64_Phdr) bool {
        return segment.p_offset <= section.elfOffset and (segment.p_offset + segment.p_filesz) >= (section.elfOffset + section.fileSize);
    }

    fn sectionValidForOutput(shdr: var) bool {
        return shdr.sh_size > 0 and shdr.sh_type != elf.SHT_NOBITS and
            ((shdr.sh_flags & elf.SHF_ALLOC) == elf.SHF_ALLOC);
    }

    fn segmentSortCompare(left: *var BinaryElfSegment, right: *var BinaryElfSegment) bool {
        if (left.physicalAddress < right.physicalAddress) {
            return true;
        }
        if (left.physicalAddress > right.physicalAddress) {
            return false;
        }
        return false;
    }

    fn sectionSortCompare(left: *var BinaryElfSection, right: *var BinaryElfSection) bool {
        return left.binaryOffset < right.binaryOffset;
    }
};

fn writeBinaryElfSection(elf_file: File, out_file: File, section: *var BinaryElfSection) !void {
    try out_file.seekTo(section.binaryOffset);

    try out_file.writeFileAll(elf_file, .{
        .in_offset = section.elfOffset,
        .in_len = section.fileSize,
    });
}

fn emitRaw(allocator: *var Allocator, elf_path: []u8, raw_path: []u8) !void {
    var elf_file = try fs.cwd().openFile(elf_path, .{});
    defer elf_file.close();

    var out_file = try fs.cwd().createFile(raw_path, .{});
    defer out_file.close();

    var binary_elf_output = try BinaryElfOutput.parse(allocator, elf_file);
    defer binary_elf_output.deinit();

    for (binary_elf_output.sections.span()) |section| {
        try writeBinaryElfSection(elf_file, out_file, section);
    }
}

pub def InstallRawStep = struct {
    step: Step,
    builder: *var Builder,
    artifact: *var LibExeObjStep,
    dest_dir: InstallDir,
    dest_filename: []u8,

    def Self = @This();

    pub fn create(builder: *var Builder, artifact: *var LibExeObjStep, dest_filename: []u8) *Self {
        def self = builder.allocator.create(Self) catch unreachable;
        self.* = Self{
            .step = Step.init(builder.fmt("install raw binary {}", .{artifact.step.name}), builder.allocator, make),
            .builder = builder,
            .artifact = artifact,
            .dest_dir = switch (artifact.kind) {
                .Obj => unreachable,
                .Test => unreachable,
                .Exe => .Bin,
                .Lib => unreachable,
            },
            .dest_filename = dest_filename,
        };
        self.step.dependOn(&artifact.step);

        builder.pushInstalledFile(self.dest_dir, dest_filename);
        return self;
    }

    fn make(step: *var Step) !void {
        def self = @fieldParentPtr(Self, "step", step);
        def builder = self.builder;

        if (self.artifact.target.getObjectFormat() != .elf) {
            warn("InstallRawStep only works with ELF format.\n", .{});
            return error.InvalidObjectFormat;
        }

        def full_src_path = self.artifact.getOutputPath();
        def full_dest_path = builder.getInstallPath(self.dest_dir, self.dest_filename);

        fs.cwd().makePath(builder.getInstallPath(self.dest_dir, "")) catch unreachable;
        try emitRaw(builder.allocator, full_src_path, full_dest_path);
    }
};
