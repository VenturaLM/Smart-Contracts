pragma solidity >=0.4.4 <0.7.0;

/// @title Librería Operaciones_matemáticas.
/// @author Ventura Lucena Martínez.
/// @notice Ejemplo de librería que contiene las operaciones de división y multiplicación.
/// @dev ...
library Math_operations {
    /// @notice Función que calcula la división de dos enteros sin signo.
    /// @param _a Dividendo.
    /// @param _b Divisor.
    function division(uint256 _a, uint256 _b) public pure returns (uint256) {
        require(_b > 0, "Division by 0 not allowed.");

        return _a / _b;
    }

    /// @notice Función que calcula la multiplicación de dos enteros sin signo.
    /// @param _a Multiplicando.
    /// @param _b Multiplicador.
    function multiply(uint256 _a, uint256 _b) public pure returns (uint256) {
        if (_a == 0 || _b == 0) {
            return 0;
        }

        return _a * _b;
    }
}

/// @title Contrato Cálculos.
/// @author Ventura Lucena Martínez.
/// @notice Ejemplo de contrato para el uso de una librería.
/// @dev ...
contract Calculations {
    // Importar la librería y el tipo con el que va a ser usada.
    using Math_operations for uint256;

    /// @notice Función genérica para realizar las operaciones definidas en la librería.
    /// @param _a Entero sin signo 1.
    /// @param _b Entero sin signo 2.
    function calculate(uint256 _a, uint256 _b)
        public
        pure
        returns (uint256, uint256)
    {
        // Ojo a la forma de llamar a las funciones, las cuales reciben 2 parámetros, pero se las
        // llama como si fuesen métodos.
        return (_a.division(_b), _a.multiply(_b));
    }
}
