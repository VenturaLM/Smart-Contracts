pragma solidity >=0.4.4 <0.7.0;

contract enumerate {
    // Declaración de una enumeración de un interruptor.
    enum state {ON, OFF} // ON está en el índice 0 y OFF en el 1.

    // Variable de tipo enum state.
    state s;

    function turnOn() public {
        s = state.ON;
    }

    function setState(uint _k) public {
        s = state(_k);
    }

    // Cuando se ejecuta esta función devuelve el valor del índice del enum, es decir, 0 para ON.
    function getState() public view returns(state) {
        return s;
    }

    //----------

    // Declaración de una enumeración de direcciones.
    enum direction {UP, DOWN, RIGHT, LEFT}

    // Variable de tipo enum direction.
    direction d = direction.UP;

    function up() public {
        d = direction.UP;
    }

    function down() public {
        d = direction.DOWN;
    }

    function left() public {
        d = direction.LEFT;
    }

    function right() public {
        d = direction.RIGHT;
    }

    function setDirection(uint _k) public {
        d = direction(_k);
    }

    function getDirection() public view returns(direction) {
        return d;
    }
}