pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract more_variables {
    //Nota: se añadirá "public" para poder consultar el valor de las variables.

    // String variables.
    string public s = "Hola";
    string empty = "";

    // Boolean variables.
    bool public flag = true; // [true/false].

    // Bytes variables.
    bytes32 b; // [bytes1 - ... - bytes32].
    bytes32 public hash = keccak256(abi.encodePacked(s));
    bytes4 public id;

    function bytes4Example() public {
        // Devuelve los 4 primeros bytes de la transacción.
        id = msg.sig;
    }

    // Address variables.
    address public local_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}
