#include "script_component.hpp"

[QGVAR(initCivilian), {
    _this call FUNC(initCivilian);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(civilianKilled), {
        params ["_unit"];
        // Check if unit was already killed (thanks to new ACE medical)
        if (_unit getVariable [QGVAR(ALREADY_KILLED), false]) exitWith {};
        _unit setVariable [QGVAR(ALREADY_KILLED), true];
        _this call FUNC(civilianKilled);
    }] call CBA_fnc_addEventHandler;
};
