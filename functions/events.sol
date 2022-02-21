pragma solidity >=0.4.4 <0.7.0;

contract Events {
    // Declaración de eventos.
    event event_1(string name_);
    event event_2(string name_, uint256 age_);
    // No hace falta darle nombre a los tipos de datos.
    event event_3(string, uint256, address, bytes32);
    // Evento sin parámetros.
    event event_4();

    // Emitir el evento_1.
    function issueEvent_1(string memory name_) public {
        emit event_1(name_);
    }

    // Emitir el evento 2.
    function issueEvent_2(string memory name_, uint256 age_) public {
        emit event_2(name_, age_);
    }

    // Emitir el evento 3.
    function issueEvent_3(string name_, uint256 age_) public {
        bytes32 hash_id = keccak256(abi.encodePacked(name_, age_, msg.sender));
        emit event_3(name_, age_, msg.sender, hash_id);
    }

    function issueEvent_4() public {
        emit event_4();
    }
}
