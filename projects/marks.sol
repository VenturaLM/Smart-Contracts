// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

/// @title Marks.
/// @author Ventura Lucena Martínez.
/// @notice Ejemplo de un contrato inteligente que sirve para gestionar la evaluación de estudiantes.
/// @dev ...
contract Marks {
    // Professor's address.
    address public prof_addr;

    // Constructor.
    constructor() public {
        // Dirección del usuario que ha desplegado el contrato.
        prof_addr = msg.sender;
    }

    // Mapping para relacionar el hash de la identidad del alumno con su nota del examen.
    mapping(bytes32 => uint256) marks;

    // Array de los alumnos que pidan revisiones del examen.
    string[] revisions;

    // Eventos.
    event assessed_student(bytes32);
    event revised_event(string);

    // Modificador para que únicamente el profesor pueda ejecutar funciones que lo contengan.
    modifier justProfessor(address _addr) {
        require(
            _addr == prof_addr,
            "You do not have permission to execute this function."
        );
        _;
    }

    /// @notice Función que permite evaluar a un alumno.
    /// @dev Esta función únicamente puede ejecutarla el usuario que despliegue el contrato: Modificador justProfessor().
    /// @param _student_id ID del estudiante a evaluar.
    /// @param _mark Calificación del estudiante.
    function setMark(string memory _student_id, uint256 _mark)
        public
        justProfessor(msg.sender)
    {
        // Crear hash de la identificación del alumno.
        bytes32 student_id_hash = keccak256(abi.encodePacked(_student_id));

        // Relación entre el hash del ID del alumno y su nota.
        marks[student_id_hash] = _mark;

        // Emisión del evento.
        emit assessed_student(student_id_hash);
    }

    /// @notice Función que permite obtener la nota de un alumno a través de su ID.
    /// @dev ...
    /// @param _student_id ID del estudiante cuya nota se quiere obtener.
    /// @return mark Nota del estudiante.
    function getMark(string memory _student_id) public view returns (uint256) {
        // Obtener el hash del ID del alumno (y a su vez, su nota).
        bytes32 student_id_hash = keccak256(abi.encodePacked(_student_id));
        uint256 mark = marks[student_id_hash];

        return mark;
    }

    /// @notice Función que almacena las solicitudes de revisión de notas.
    /// @dev ...
    /// @param _student_id ID del estudiante que solicita la revisión.
    function requestForRevision(string memory _student_id) public {
        // Almacenar el ID del alumno que solicita la revisión en el array de revisiones.
        revisions.push(_student_id);
        emit revised_event(_student_id);
    }

    /// @notice Función que permite visualizar los alumnos que han solicitado la revisión de la nota.
    /// @dev Esta función únicamente puede ejecutarla el usuario que despliegue el contrato: Modificador justProfessor().
    /// @param ...
    /// @return revisions Array que almacena los alumnos que han solicitado la revisión de la nota.
    function getRevisions()
        public
        view
        justProfessor(msg.sender)
        returns (string[] memory)
    {
        return revisions;
    }
}
