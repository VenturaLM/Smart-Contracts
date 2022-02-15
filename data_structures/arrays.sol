pragma solidity >=0.4.4 <0.7.0;

contract Arrays {
    // Arrays estáticos:
    uint256[5] public integer_array = [1, 2, 3];
    string[15] string_array;
    uint32[7] uinteger_array;

    // Arrays dinámicos:
    uint256[] public integer_darray;

    struct Person {
        string name;
        uint256 age;
    }

    Person[] public people_darray;

    function add_to_darray(uint256 _k) public {
        integer_darray.push(_k);
    }

    function add_to_darray(string memory _name, uint256 _age) public {
        people_darray.push(Person(_name, _age));
    }

    function add_to_array(uint256 _index, uint256 _value) public {
        integer_array[_index] = _value;
    }
}
