pragma solidity >=0.4.4 <0.7.0;

contract Returns {
    // Función que devuelve un saludo.
    function greetings() public returns (string memory) {
        return "Saludos";
    }

    // Función que calcula el resultado de una multiplicación de enteros.
    function multiplication(uint256 _a, uint256 _b) public returns (uint256) {
        return _a * _b;
    }

    // Función que nos indica si un número es par o impar.
    function isEven(uint256 _a) public returns (bool) {
        if (_a % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    // Función que calcula la división de dos números y devuelve el cociente,
    // el resto y un true si son múltiplos.
    function division(uint256 _dividend, uint256 _divisor)
        public
        returns (
            uint256,
            uint256,
            bool
        )
    {
        uint256 quotient = _dividend / _divisor;
        uint256 remainder = _dividend % _divisor;
        bool multiple = false;

        if (remainder == 0) {
            multiple = true;
        }

        return (quotient, remainder, multiple);
    }

    // Manejo de los valores devueltos.
    function numbers()
        public
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        return (1, 2, 3);
    }

    // Asignación múltiple:
    function all_values()
        public
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 a;
        uint256 b;
        uint256 c;

        //Asignación parcial:
        (a, , c) = numbers();

        //Asignación completa.
        (a, b, c) = numbers();
        return (a, b, c);
    }
}
