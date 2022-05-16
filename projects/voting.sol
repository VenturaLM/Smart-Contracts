pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

/// @title Voting.
/// @author Ventura Lucena Martínez.
/// @notice Ejemplo de contrato inteligente para gestionar un proceso de votación.
/// @dev ...
contract Voting {
    // Dirección del propietario del contrato.
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    // Relación entre el nombre del candidato y el hash de sus datos personales.
    mapping(string => bytes32) candidate_id;
    //Relación entre el nombre del candidato y el número de votos.
    mapping(string => uint256) candidate_votes;

    // Array para almacenar los nombres de los candidatos.
    string[] candidates;
    // Array para almacenar los hashes de los votantes.
    bytes32[] voters;

    /// @notice Función que permite presentarse como candidato a las elecciones.
    /// @dev ...
    /// @param _candidate_name Nombre del candidato.
    /// @param _age Edad del candidato.
    /// @param _candidate_id ID del candidato.
    function setCandidate(
        string memory _candidate_name,
        uint256 _age,
        string memory _candidate_id
    ) public {
        // Hash de los datos del candidato.
        bytes32 candidate_hash = keccak256(
            abi.encodePacked(_candidate_name, _age, _candidate_id)
        );

        // Relaciones el hash de los datos del candidato con su nombre.
        candidate_id[_candidate_name] = candidate_hash;

        // Guardar el nombre del candidato.
        candidates.push(_candidate_name);
    }

    /// @notice Función que devuelve los nombres de los candidatos.
    /// @dev ...
    /// @param ...
    /// @return candidates Array que almacena los nombres de los candidatos.
    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }

    /// @notice Función que permite votar a un candidato.
    /// @dev ...
    /// @param _candidate_name Nombre del candidato a votar.
    function vote(string memory _candidate_name) public {
        // Hash de la persona que ejecuta la función.
        bytes32 voter_hash = keccak256(abi.encodePacked(msg.sender));

        // Verificar que el votante no haya votado ya.
        for (uint256 i = 0; i < voters.length; i++) {
            require(voters[i] != voter_hash, "You have already voted.");
        }

        // Si no ha votado, añadir el votante a la lista de votantes.
        voters.push(voter_hash);

        // Añadir un voto al candidato.
        candidate_votes[_candidate_name]++;
    }

    /// @notice Función que permite ver cuántos votos tiene un candidato.
    /// @dev ...
    /// @param _candidate_name Nombre del candidato.
    /// @return uint256 Número de votos de un candidato.
    function getCandidateVotes(string memory _candidate_name)
        public
        view
        returns (uint256)
    {
        return candidate_votes[_candidate_name];
    }

    // -----------------------
    /// @notice Función que convierte un entero sin signo en un string.
    /// @dev Source: https://stackoverflow.com/questions/47129173/how-to-convert-uint-to-string-in-solidity
    /// @param _i Entero sin signo.
    /// @return string Entero sin signo de tipo cadena.
    function uint2str(uint256 _i)
        internal
        pure
        returns (string memory _uintAsString)
    {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        return string(bstr);
    }

    // -----------------------

    /// @notice Función que permite ver los resultados, es decir, ver cuantos votos tiene cada candidato.
    /// @dev ...
    /// @param ...
    /// @return results Resultados con los votos de cada candidato.
    function getResults() public view returns (string memory) {
        // Candidatos con los respectivos votos.
        string memory results = "";

        // Bucle que actualiza la variable resultados con todos los datos de cada candidato.
        for (uint256 i = 0; i < candidates.length; i++) {
            results = string(
                abi.encodePacked(
                    results,
                    "(",
                    candidates[i],
                    ", ",
                    uint2str(getCandidateVotes(candidates[i])),
                    ")"
                )
            );
        }
        return results;
    }

    /// @notice Función que devuelve el ganador de las elecciones.
    /// @dev ...
    /// @param ...
    /// @return winner Ganador de las elecciones.
    function getWinner() public view returns (string memory) {
        // Declarar al primer candidato como ganador. Esto implica una iteración menos en el bucle.
        string memory winner = candidates[0];
        // Bandera para notificar empate en caso de que se dé dicho caso.
        bool tie = false;

        // Comprobar los votos de cada candidato y reajustar el ganador.
        for (uint256 i = 1; i < candidates.length; i++) {
            if (candidate_votes[candidates[i]] > candidate_votes[winner]) {
                winner = candidates[i];
            } else {
                if (candidate_votes[candidates[i]] > candidate_votes[winner]) {
                    tie = true;
                }
            }
        }

        // En caso de empate, se notifica.
        if (tie) {
            winner = "There is a tie.";
        }

        return winner;
    }
}
