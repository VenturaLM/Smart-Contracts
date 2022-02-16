pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract Functions {
    // Añadir dentro de un array de direcciones la dirección de la
    // persona que llame a la función.
    address[] public addresses;

    // Declaración pública para que todo el mundo la pueda ejecutar.
    function addAddress() public {
        addresses.push(msg.sender);
    }

    // -----

    // Calcular el hash de los datos proporcionados como parámetro.
    bytes32 public hash;

    function comouteHash(string memory _data) public {
        hash = keccak256(abi.encodePacked(_data));
    }

    // -----

    // Declaración del tipo de dato complejo "comida".
    struct food {
        string name;
        string ingredients;
    }

    // Creación del tipo de dato complejo comida.
    food public burguer;

    function burguers(string memory _ingredients) public {
        burguer = food("Hamburguesa", _ingredients);
    }

    // -----

    // Declaración del tipo de dato complejo "alumno".
    struct student {
        string name;
        address addr;
        uint256 age;
    }

    bytes32 public hash_id_student;

    // Calculamos el hash privado de los datos personales.
    function hashIdStudent(
        string memory _name,
        address _addr,
        uint256 _age
    ) private {
        hash_id_student = keccak256(abi.encodePacked(_name, _addr, _age));
    }

    // Guardamos con una función pública dentro de una lista los alumnos.
    student[] public students_list;
    // Mapping que nos relaciona los nombres de los alumnos con su hash.
    mapping(string => bytes32) students;

    function newStudent(string memory _name, uint256 _age) public {
        students_list.push(student(_name, msg.sender, _age));
        hashIdStudent(_name, msg.sender, _age);
        students[_name] = hash_id_student;
    }
}
