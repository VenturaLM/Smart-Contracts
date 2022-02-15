pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract public_private_internal {
    // Public --> Generan getters:
    uint256 public my_public_integer = 45;
    string public my_string = "Hola";
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    // Private:
    uint256 private my_private_integer = 10;
    bool private my_private_flag = true;

    function test(uint256 _k) public {
        my_private_integer = _k;
    }

    // Internal --> Sólo pueden ser llamadas internas, desde
    // este mismo contrato o desde otros que deriven de este.
    bytes32 internal hash = keccak256(abi.encodePacked("hola"));
    address internal addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}
