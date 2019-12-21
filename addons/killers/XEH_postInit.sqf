#include "script_component.hpp"

[QGVAR(createTeleport), {
    _this call FUNC(createTeleport);
}] call CBA_fnc_addEventHandler;

[QGVAR(teleport), {
    params ["_teleporter", "_caller", "_destination"];
    _caller setPos (getPos _destination);
}] call CBA_fnc_addEventHandler;
