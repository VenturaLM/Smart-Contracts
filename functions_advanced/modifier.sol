pragma solidity >=0.4.4 <0.7.0;

/// @title Contrato Modifier.
/// @author Ventura Lucena Martínez.
/// @notice Contrato para poner en práctica los modifiers.
/// @dev ...
contract Modifier {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    // Al añadir este modificador a una función se comprueba que únicamente el creador del contrato
    // pueda ejecutar ejecutarla.
    modifier justOwner() {
        require(
            msg.sender == owner,
            "You do not have permission to execute this function."
        );
        _; // Importante añadir esto en los modificadores.
    }

    function example_1() public justOwner {
        // ...
    }

    // ---

    modifier ageOver18(uint256 _age) {
        require(_age >= 18);
        _;
    }

    function vote(uint256 _age) public ageOver18(15) {
        // ...
    }
}
