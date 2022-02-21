pragma solidity >=0.4.4 <0.7.0;

/// @title Contrato para causas benéficas.
/// @author Ventura Lucena Martínez.
/// @notice Ejemplo de un contrato para causas benéficas.
/// @dev ...
contract charitableCauses {
    struct Cause {
        uint256 id;
        string name;
        uint256 target_price;
        uint256 collected_quantity;
    }

    uint256 causes_counter = 0;
    //Mapping para relacionar el nombre de la causa con la causa.
    mapping(string => Cause) causes;

    /// @notice Función que da de alta una nueva causa.
    /// @dev Función pública para que todo el mundo pueda dar de
    /// alta una nueva causa.
    /// @param name_ Nombre de la causa a dar de alta.
    /// @param target_price_ Precio objetivo de la causa a dar de alta.
    function addCause(string memory name_, uint256 target_price_)
        public
        payable
    {
        causes_counter++;
        causes[name_] = Cause(causes_counter, name_, target_price_, 0);
    }

    /// @notice Función que indica si el precio objetivo de una causa ha sido
    /// alcanzado.
    /// @dev Función private para que nadie pueda ejecutarla.
    /// @param name_ Nombre de la causa a comprobar.
    /// @param donation_ Donativo.
    /// @return True si se puede donar a una causa; False en caso contrario.
    function isTargetAchieved(string memory name_, uint256 donation_)
        private
        view
        returns (bool)
    {
        bool flag = false;

        // Buscamos la causa en el mapping creado anteriormente.
        Cause memory c = causes[name_];
        if (c.target_price >= c.collected_quantity + donation_) {
            flag = true;
        }

        return flag;
    }

    /// @notice Función que indica si el precio objetivo de una causa ha sido
    /// alcanzado.
    /// @dev Función pública para que todo el mundo pueda dar de
    /// alta una nueva causa.
    /// @param name_ Nombre de la causa.
    /// @return True si el precio objetivo ha sido alcanzado; False en caso contrario.
    /// @return Cantidad recaudada.
    function isTargetAchieved(string memory name_)
        public
        view
        returns (bool, uint256)
    {
        bool target_reached = false;
        Cause memory c = causes[name_];

        if (c.collected_quantity >= c.target_price) {
            target_reached = true;
        }

        return (target_reached, c.collected_quantity);
    }

    /// @notice Función que permite donar a una causa, siempre y cuando
    /// no se haya llegado al precio objetivo.
    /// @dev Función pública para que todo el mundo pueda donar a una causa.
    /// @param name_ Nombre de la causa.
    /// @param donation_ Donativo.
    /// @return True en caso de haber podido donar correctamente; False en caso
    /// contrario.
    function donateToCause(string memory name_, uint256 donation_)
        public
        returns (bool)
    {
        if (isTargetAchieved(name_, donation_)) {
            causes[name_].collected_quantity =
                causes[name_].collected_quantity +
                donation_;

            return true;
        }

        return false;
    }
}
