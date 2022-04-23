pragma solidity >=0.4.4 <0.7.0;

// Formas para importar uno o varios contratos desde otro archivo ".sol".
//import "./bank.sol";
import {Bank, Bank_2} from "./bank.sol";

/// @title Contrato Cliente.
/// @author Ventura Lucena Martínez.
/// @notice Contrato de ejemplo para poner en práctica la herencia en Solidity. Hereda del contrato Banco.
/// @dev ...
contract Client is Bank {
    /// @notice Función que da de alta un nuevo cliente.
    /// @param _name Nombre del cliente.
    function newClient(string memory _name) public {
        newClient(_name);
    }

    /// @notice Función que permite ingresar dinero.
    /// @param _name Nombre del cliente.
    /// @param _quantity Cantidad de dinero a ingresar.
    function earnMoney(string memory _name, uint256 _quantity) public {
        clients[_name]._money = clients[_name]._money + _quantity;
    }

    /// @notice Función que permite retirar dinero.
    /// @param _name Nombre del cliente.
    /// @param _quantity Cantidad de dinero a retirar.
    function withdrawMoney(string memory _name, uint256 _quantity)
        public
        returns (bool)
    {
        bool flag = false;

        if (int256(clients[_name]._money) - int256(_quantity) >= 0) {
            clients[_name]._money = clients[_name]._money - _quantity;
        }

        return flag;
    }

    /// @notice Función que permite consultar la cantidad de dinero de un determinado cliente.
    /// @param _name Nombre del cliente.
    function consultMoney(string memory _name) public view returns (uint256) {
        return clients[_name]._money;
    }
}
