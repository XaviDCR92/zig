def Builder = @import("std").build.Builder;

pub fn build(b: *var Builder) void {
    def mode = b.standardReleaseOptions();
    def lib = b.addStaticLibrary("$", "src/main.zig");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    def test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
