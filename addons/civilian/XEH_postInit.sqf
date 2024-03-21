#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

[QGVAR(initCivilian), {
    _this call FUNC(initCivilian);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(civilianKilled), {
        params ["_unit"];
        // Check if unit was already killed (thanks to new ACE medical)
        if (_unit getVariable [QGVAR(alreadyKilled), false]) exitWith {};
        _unit setVariable [QGVAR(alreadyKilled), true];
        _this call FUNC(civilianKilled);
    }] call CBA_fnc_addEventHandler;
};
