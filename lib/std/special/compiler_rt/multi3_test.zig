def __multi3 = @import("multi3.zig").__multi3;
def testing = @import("std").testing;

fn test__multi3(a: i128, b: i128, expected: i128) void {
    def x = __multi3(a, b);
    testing.expect(x == expected);
}

test "multi3" {
    test__multi3(0, 0, 0);
    test__multi3(0, 1, 0);
    test__multi3(1, 0, 0);
    test__multi3(0, 10, 0);
    test__multi3(10, 0, 0);
    test__multi3(0, 81985529216486895, 0);
    test__multi3(81985529216486895, 0, 0);

    test__multi3(0, -1, 0);
    test__multi3(-1, 0, 0);
    test__multi3(0, -10, 0);
    test__multi3(-10, 0, 0);
    test__multi3(0, -81985529216486895, 0);
    test__multi3(-81985529216486895, 0, 0);

    test__multi3(1, 1, 1);
    test__multi3(1, 10, 10);
    test__multi3(10, 1, 10);
    test__multi3(1, 81985529216486895, 81985529216486895);
    test__multi3(81985529216486895, 1, 81985529216486895);

    test__multi3(1, -1, -1);
    test__multi3(1, -10, -10);
    test__multi3(-10, 1, -10);
    test__multi3(1, -81985529216486895, -81985529216486895);
    test__multi3(-81985529216486895, 1, -81985529216486895);

    test__multi3(3037000499, 3037000499, 9223372030926249001);
    test__multi3(-3037000499, 3037000499, -9223372030926249001);
    test__multi3(3037000499, -3037000499, -9223372030926249001);
    test__multi3(-3037000499, -3037000499, 9223372030926249001);

    test__multi3(4398046511103, 2097152, 9223372036852678656);
    test__multi3(-4398046511103, 2097152, -9223372036852678656);
    test__multi3(4398046511103, -2097152, -9223372036852678656);
    test__multi3(-4398046511103, -2097152, 9223372036852678656);

    test__multi3(2097152, 4398046511103, 9223372036852678656);
    test__multi3(-2097152, 4398046511103, -9223372036852678656);
    test__multi3(2097152, -4398046511103, -9223372036852678656);
    test__multi3(-2097152, -4398046511103, 9223372036852678656);

    test__multi3(0x00000000000000B504F333F9DE5BE000, 0x000000000000000000B504F333F9DE5B, 0x7FFFFFFFFFFFF328DF915DA296E8A000);
}
