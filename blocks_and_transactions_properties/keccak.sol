pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract hash {
    // Calcular el hash mediante la función keccak256, previamente pasando a bytes con la función abi.encodePacked().
    // (256 bits) / (8 bits/bytes) = 32 bytes.

    // Cómputo del hash de un string.
    function computeHash(string memory _text) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_text));
    }

    // Cómputo del hash de un string, un entero y una dirección.
    function computeHash2(string memory _text, uint _k, address _address) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_text, _k, _address));
    }

    // Cómputo del hash de un string, un entero, una dirección + un string y un entero adicionales.
    function computeHash3(string memory _text, uint _k, address _address) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_text, _k, _address, "hola", uint(2)));
    }
}