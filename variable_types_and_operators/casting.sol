pragma solidity >=0.4.4 <0.7.0

contract casting {

    uint8 uinteger_8_bits = 42;
    uint64 uinteger_64_bits = 60000;
    uint uinteger_256_bits = 1000000;

    int16 integer_16_bits = 156;
    int120 integer_120_bits = 900000;
    int integer = 5000000;

    // Casting:
    uint64 public casting_1 = uint64(uinteger_8_bits);
    uint64 public casting_2 = uint64(uinteger_256_bits);
    uint8 public casting_3 = uint8(integer_16_bits);

    int public casting_4 = int(integer_120_bits);
}