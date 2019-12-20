#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    [QGVAR(playerDisconnected), _this] call CBA_fnc_globalEvent;
}];

[QGVAR(playerDisconnected), {
    params ["_unit", "_id", "_uid", "_name"];
    [_unit] call FUNC(deleteUnitMarker);
}]
