pragma solidity >=0.4.4 <0.7.0;

/// @title Contrato Banco.
/// @author Ventura Lucena Martínez.
/// @notice Contrato de ejemplo para poner en práctica la herencia en Solidity.
/// @dev ...
contract Bank {
    struct client {
        string _name;
        address _addr;
        uint256 _money;
    }

    // Mapping que permite relacionar el nombre del cliente con el tipo de dato cliente.
    mapping(string => client) clients;

    /// @notice Función que da de alta un nuevo cliente.
    /// @param _name Nombre del cliente.
    function newClient(string memory _name) public {
        clients[_name] = client(_name, msg.sender, 0);
    }
}

contract Bank_2 {
    /// ...
}
