pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract Mappings {
    // Mapping para elegir un número.
    mapping(address => uint256) public chooseNumber;

    function choose(uint256 _number) public {
        chooseNumber[msg.sender] = _number;
    }

    function getNumber() public view returns (uint256) {
        return chooseNumber[msg.sender];
    }

    // Mapping que relaciona el nombre de una persona con su cantidad de dinero.
    mapping(string => uint256) moneyQuantity;

    // Desde la versión 0.5.0 es obligatorio el uso de la palabra clave 'memory' con strings y bytes.
    function money(string memory _name, uint256 _quantity) public {
        moneyQuantity[_name] = _quantity;
    }

    function getMoney(string memory _name) public view returns (uint256) {
        return moneyQuantity[_name];
    }

    // Ejemplo de mapping con un struct:
    struct Person {
        string name;
        uint256 edad;
    }

    mapping(uint256 => Person) people;

    function dni_person(
        uint256 _dni,
        string memory _name,
        uint256 _age
    ) public {
        people[_dni] = Person(_name, _age);
    }

    function getPerson(uint256 _dni) public view returns (Person memory) {
        return people[_dni];
    }
}
