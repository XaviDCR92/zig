def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def FileHandle = uefi.FileHandle;

pub def ShellParametersProtocol = extern struct {
    argv: [*][*:0]u16,
    argc: usize,
    stdin: FileHandle,
    stdout: FileHandle,
    stderr: FileHandle,

    pub def guid align(8) = Guid{
        .time_low = 0x752f3136,
        .time_mid = 0x4e16,
        .time_high_and_version = 0x4fdc,
        .clock_seq_high_and_reserved = 0xa2,
        .clock_seq_low = 0x2a,
        .node = [_]u8{ 0xe5, 0xf4, 0x68, 0x12, 0xf4, 0xca },
    };
};
