pragma solidity >=0.4.4 <0.7.0;

contract integers {
    // Unsigned integer.
    uint256 a;
    uint256 b = 3;
    uint256 c = 5000;

    // Unsigned integers con un número específico de bits.
    // Nota: un uint sin número de bits especificado es de 256 bits de manera predeterminada, es decir, (uint = uint256).
    uint8 uinteger_8_bit;
    uint64 uinteger_64_bit = 7000; // Cuidado con el overflow, es decir, comprobar que el número cabe en 64 bits (máx. 2^64).

    // Integers.
    int256 d;
    int256 e = -32;

    // Integers con un número específico de bits.
    int72 integer_72_bit;
}
