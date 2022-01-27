pragma solidity >=0.4.4 <0.7.0;

contract units_of_time {

    // Unidades de tiempo.
    // Nota: now devuelve el tiempo en segundos en el que se llama a la función.
    uint public current_timing = now;
    uint public one_minute = 1 minutes;
    uint public two_hours = 2 hours;
    uint public fifty_days = 50 days;
    uint public one_week = 1 weeks;

    function addSeconds() public view returns(uint) {
        return now + 50 seconds;
    }

    function add2Hours() public view returns(uint) {
        return now + two_hours;
    }

    function addWeeks() public view returns(uint) {
        return now + one_week;
    }

    //...
}