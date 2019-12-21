#include "script_component.hpp"

if (hasInterface) then {
    [QGVAR(createTeleport), {
        if !(playerSide isEqualTo EAST) exitWith {};
        _this call FUNC(createTeleport);
    }] call CBA_fnc_addEventHandler;

};

[QGVAR(teleport), {
    params ["_teleporter", "_caller", "_destination"];
    _caller setPos (getPos _destination);
}] call CBA_fnc_addEventHandler;
