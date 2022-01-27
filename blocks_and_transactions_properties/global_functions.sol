// Indicar versión de compilador.
pragma solidity >=0.4.4 <0.7.0;

contract global_functions {
    // Devuelve la dirección del remitente de la llamada actual.
    function MsgSender() public view returns (address) {
        return msg.sender;
    }

    // Devuelve la dirección del minero.
    function BlockCoinbase() public view returns (address) {
        return block.coinbase;
    }

    // Devuelve la dificultad del bloque (número de enteros del hash).
    function BlockDifficulty() public view returns (uint256) {
        return block.difficulty;
    }

    // Devuelve el tiempo en segundos del bloque actual.
    function Now() public view returns (uint256) {
        return now;
    }

    // Devuelve el número de bloque actual.
    function BlockNumber() public view returns (uint256) {
        return block.number;
    }

    // Devuelve el identificador de la función.
    function MsgSig() public view returns (bytes4) {
        return msg.sig;
    }

    // Devuelve el precio del gas de la transacción.
    function TxGasPrize() public view returns (uint256) {
        return tx.gasprice;
    }
}
