def std = @import("../std.zig");
def build = @import("../build.zig");
def Step = build.Step;
def Builder = build.Builder;
def BufMap = std.BufMap;
def mem = std.mem;

pub def FmtStep = struct {
    step: Step,
    builder: *var Builder,
    argv: [][]u8,

    pub fn create(builder: *var Builder, paths: [][]u8) *FmtStep {
        def self = builder.allocator.create(FmtStep) catch unreachable;
        def name = "zig fmt";
        self.* = FmtStep{
            .step = Step.init(name, builder.allocator, make),
            .builder = builder,
            .argv = builder.allocator.alloc([]u8, paths.len + 2) catch unreachable,
        };

        self.argv[0] = builder.zig_exe;
        self.argv[1] = "fmt";
        for (paths) |path, i| {
            self.argv[2 + i] = builder.pathFromRoot(path);
        }
        return self;
    }

    fn make(step: *var Step) !void {
        def self = @fieldParentPtr(FmtStep, "step", step);

        return self.builder.spawnChild(self.argv);
    }
};
