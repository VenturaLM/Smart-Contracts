pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

/// @title Contrato Require.
/// @author Ventura Lucena Martínez.
/// @notice Contrato para poner en práctica el uso de require().
/// @dev ...
contract Require {
    /// @notice Función que permite verificar si una contraseña es correcta o no.
    /// @dev ...
    /// @param _password Contraseña a comprobar.
    /// @return string Mensaje de error o éxito, dependiendo si es incorrecta o correcta, respectivamente.
    function verifyPassword(string memory _password)
        public
        pure
        returns (string memory)
    {
        require(
            keccak256(abi.encodePacked(_password)) ==
                keccak256(abi.encodePacked("12345")),
            "Invalid password."
        );
        return "Success!";
    }

    string[] names;

    /// @notice Función que permite añadir nombres a una lista, si y sólo si no se encuentran ya en ella.
    /// @dev ...
    /// @param _name Nombre a añadir.
    function addName(string memory _name) public {
        for (uint256 i = 0; i < names.length; i++) {
            require(
                keccak256(abi.encodePacked(_name)) !=
                    keccak256(abi.encodePacked(names[i])),
                string(abi.encodePacked(_name, " is already in the list."))
            );
        }

        names.push(_name);
    }
}
