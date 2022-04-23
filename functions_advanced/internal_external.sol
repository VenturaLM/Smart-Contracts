pragma solidity >=0.4.4 <0.7.0;

/// @title Contrato Comida.
/// @author Ventura Lucena Martínez
/// @notice Contrato de ejemplo para poner en práctica los modificadores Internal y External.
/// @dev ...
contract Meal {
    struct plate {
        string name;
        string ingredients;
        uint256 time;
    }

    // Array dinámico de platos.
    plate[] plates;
    // Mapping que relaciona el nombre de cada plato con sus ingredientes.
    mapping(string => string) ingredients;

    /// @notice Función que permite dar de alta un nuevo plato.
    /// @dev Internal: permite que otros contratos puedan utilizar esta función, derivados de este.
    /// @param _name Nombre del plato.
    /// @param _ingredients Ingredientes del plato.
    /// @param _time Tiempo que se tarda en cocinar el plato.
    function newPlate(
        string memory _name,
        string memory _ingredients,
        uint256 _time
    ) internal {
        plates.push(plate(_name, _ingredients, _time));
        ingredients[_name] = _ingredients;
    }

    /// @notice Función que permite ver los ingredientes de un plato.
    /// @dev Internal: para que cada uno de los contratos puedan utilizar esta función, derivados de este.
    /// @param _name Nombre del plato.
    /// @return ingredients Ingredientes del plato.
    function getIngredients(string memory _name)
        internal
        view
        returns (string memory)
    {
        return ingredients[_name];
    }
}

contract Sandwitch is Meal {
    function sandwitch(string calldata _ingredients, uint256 _time) external {
        newPlate("Sandwitch", _ingredients, _time);
    }
}
