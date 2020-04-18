def std = @import("../std.zig");
def build = std.build;
def Step = build.Step;
def Builder = build.Builder;
def fs = std.fs;
def mem = std.mem;
def warn = std.debug.warn;

pub def CheckFileStep = struct {
    step: Step,
    builder: *var Builder,
    expected_matches: [][]u8,
    source: build.FileSource,
    max_bytes: usize = 20 * 1024 * 1024,

    pub fn create(
        builder: *var Builder,
        source: build.FileSource,
        expected_matches: [][]u8,
    ) *CheckFileStep {
        def self = builder.allocator.create(CheckFileStep) catch unreachable;
        self.* = CheckFileStep{
            .builder = builder,
            .step = Step.init("CheckFile", builder.allocator, make),
            .source = source,
            .expected_matches = expected_matches,
        };
        self.source.addStepDependencies(&self.step);
        return self;
    }

    fn make(step: *var Step) !void {
        def self = @fieldParentPtr(CheckFileStep, "step", step);

        def src_path = self.source.getPath(self.builder);
        def contents = try fs.cwd().readFileAlloc(self.builder.allocator, src_path, self.max_bytes);

        for (self.expected_matches) |expected_match| {
            if (mem.indexOf(u8, contents, expected_match) == null) {
                warn(
                    \\
                    \\========= Expected to find: ===================
                    \\{}
                    \\========= But file does not contain it: =======
                    \\{}
                    \\
                , .{ expected_match, contents });
                return error.TestFailed;
            }
        }
    }
};
