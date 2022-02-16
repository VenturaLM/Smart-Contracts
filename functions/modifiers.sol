pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract view_pure_payable {
    // View: Nos permite leer datos pero no nos permitirá modificarlos.
    string[] students;

    function add_student(string memory student_) public {
        students.push(student_);
    }

    function get_student(uint256 index_) public view returns (string memory) {
        return students[index_];
    }

    uint256 x = 10;

    function add_to_x(uint256 a_) public view returns (uint256) {
        return x + a_;
    }

    // -----

    // Pure: No accede a los datos. Si pasásemos la variable "x", tendríamos que eliminar "pure".
    function power(uint256 a_, uint256 b_) public pure returns (uint256) {
        return a_**b_;
    }

    // -----

    // Payable: Nos permite recibir ether.

    struct wallet {
        string name;
        address addr;
        uint256 money;
    }

    // Mapping que relaciona la dirección con la cantidad de dinero.
    mapping(address => wallet) walletMoney;

    function pay(string memory name_, uint256 quantity_) public payable {
        // memory para que cuando termine la función, se elimine de memoria la variable.
        wallet memory my_wallet;
        my_wallet = wallet(name_, msg.sender, quantity_);
        walletMoney[msg.sender] = my_wallet;
    }

    function get_balance() public view returns (wallet memory) {
        return walletMoney[msg.sender];
    }
}
