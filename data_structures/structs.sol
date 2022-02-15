pragma solidity >=0.4.4 <0.7.0;

contract structs {
    // Cliente de una página web de pago:
    struct client {
        uint256 id;
        string name;
        string dni;
        string email;
        uint256 phone_number;
        uint256 credit_card_number;
        uint256 credit_card_code;
    }

    client c1 =
        client(
            1,
            "Ventura",
            "12345678A",
            "email@email.com",
            987654321,
            1234,
            11
        );

    // Producto:
    struct product {
        string name;
        uint256 price;
    }

    product p = product("Samsung", 300);

    // Proyecto cooperativo de ONG:
    struct ong {
        address ong;
        string name;
    }

    ong o = ong(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Caritas");

    // Causas para la ONG:
    struct cause {
        uint256 id;
        string name;
        uint256 price;
    }

    cause c2 = cause(1, "Medicamentos", 1000);
}
