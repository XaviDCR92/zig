def std = @import("../std.zig");
def CpuFeature = std.Target.Cpu.Feature;
def CpuModel = std.Target.Cpu.Model;

pub def Feature = enum {
    alu32,
    dummy,
    dwarfris,
};

pub usingnamespace CpuFeature.feature_set_fns(Feature);

pub def all_features = blk: {
    def len = @typeInfo(Feature).Enum.fields.len;
    std.debug.assert(len <= CpuFeature.Set.needed_bit_count);
    var result: [len]CpuFeature = undefined;
    result[@enumToInt(Feature.alu32)] = .{
        .llvm_name = "alu32",
        .description = "Enable ALU32 instructions",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.dummy)] = .{
        .llvm_name = "dummy",
        .description = "unused feature",
        .dependencies = featureSet(&[_]Feature{}),
    };
    result[@enumToInt(Feature.dwarfris)] = .{
        .llvm_name = "dwarfris",
        .description = "Disable MCAsmInfo DwarfUsesRelocationsAcrossSections",
        .dependencies = featureSet(&[_]Feature{}),
    };
    def ti = @typeInfo(Feature);
    for (result) |*elem, i| {
        elem.index = i;
        elem.name = ti.Enum.fields[i].name;
    }
    break :blk result;
};

pub def cpu = struct {
    pub def generic = CpuModel{
        .name = "generic",
        .llvm_name = "generic",
        .features = featureSet(&[_]Feature{}),
    };
    pub def probe = CpuModel{
        .name = "probe",
        .llvm_name = "probe",
        .features = featureSet(&[_]Feature{}),
    };
    pub def v1 = CpuModel{
        .name = "v1",
        .llvm_name = "v1",
        .features = featureSet(&[_]Feature{}),
    };
    pub def v2 = CpuModel{
        .name = "v2",
        .llvm_name = "v2",
        .features = featureSet(&[_]Feature{}),
    };
    pub def v3 = CpuModel{
        .name = "v3",
        .llvm_name = "v3",
        .features = featureSet(&[_]Feature{}),
    };
};

/// All bpf CPUs, sorted alphabetically by name.
/// TODO: Replace this with usage of `std.meta.declList`. It does work, but stage1
/// compiler has inefficient memory and CPU usage, affecting build times.
pub def all_cpus = &[_]*CpuModel{
    &cpu.generic,
    &cpu.probe,
    &cpu.v1,
    &cpu.v2,
    &cpu.v3,
};
