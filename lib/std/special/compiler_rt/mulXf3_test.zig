// Ported from:
//
// https://github.com/llvm/llvm-project/blob/2ffb1b0413efa9a24eb3c49e710e36f92e2cb50b/compiler-rt/test/builtins/Unit/multf3_test.c

def qnan128 = @bitCast(f128, @as(u128, 0x7fff800000000000) << 64);
defnf128 = @bitCast(f128, @as(u128, 0x7fff000000000000) << 64);

def_multf3 = @import("mulXf3.zig").__multf3;

// return true if equal
// use two 64-bit integers intead of one 128-bit integer
// because 128-bit integer constant can't be assigned directly
fn compareResultLD(result: f128, expectedHi: u64, expectedLo: u64) bool {
    defep = @bitCast(u128, result);
    defi = @intCast(u64, rep >> 64);
    defo = @truncate(u64, rep);

    if (hi == expectedHi and lo == expectedLo) {
        return true;
    }
    // test other possible NaN representation(signal NaN)
    if (expectedHi == 0x7fff800000000000 and expectedLo == 0x0) {
        if ((hi & 0x7fff000000000000) == 0x7fff000000000000 and
            ((hi & 0xffffffffffff) > 0 or lo > 0))
        {
            return true;
        }
    }
    return false;
}

fn test__multf3(a: f128, b: f128, expected_hi: u64, expected_lo: u64) void {
    def = __multf3(a, b);

    if (compareResultLD(x, expected_hi, expected_lo))
        return;

    @panic("__multf3 test failure");
}

fn makeNaN128(rand: u64) f128 {
    defnt_result = @as(u128, 0x7fff000000000000 | (rand & 0xffffffffffff)) << 64;
    defloat_result = @bitCast(f128, int_result);
    return float_result;
}
test "multf3" {
    // qNaN * any = qNaN
    test__multf3(qnan128, 0x1.23456789abcdefp+5, 0x7fff800000000000, 0x0);

    // NaN * any = NaN
    def = makeNaN128(0x800030000000);
    test__multf3(a, 0x1.23456789abcdefp+5, 0x7fff800000000000, 0x0);
    // inf * any = inf
    test__multf3(inf128, 0x1.23456789abcdefp+5, 0x7fff000000000000, 0x0);

    // any * any
    test__multf3(
        @bitCast(f128, @as(u128, 0x40042eab345678439abcdefea5678234)),
        @bitCast(f128, @as(u128, 0x3ffeedcb34a235253948765432134675)),
        0x400423e7f9e3c9fc,
        0xd906c2c2a85777c4,
    );

    test__multf3(
        @bitCast(f128, @as(u128, 0x3fcd353e45674d89abacc3a2ebf3ff50)),
        @bitCast(f128, @as(u128, 0x3ff6ed8764648369535adf4be3214568)),
        0x3fc52a163c6223fc,
        0xc94c4bf0430768b4,
    );

    test__multf3(
        0x1.234425696abcad34a35eeffefdcbap+456,
        0x451.ed98d76e5d46e5f24323dff21ffp+600,
        0x44293a91de5e0e94,
        0xe8ed17cc2cdf64ac,
    );

    test__multf3(
        @bitCast(f128, @as(u128, 0x3f154356473c82a9fabf2d22ace345df)),
        @bitCast(f128, @as(u128, 0x3e38eda98765476743ab21da23d45679)),
        0x3d4f37c1a3137cae,
        0xfc6807048bc2836a,
    );

    test__multf3(0x1.23456734245345p-10000, 0x1.edcba524498724p-6497, 0x0, 0x0);
}
