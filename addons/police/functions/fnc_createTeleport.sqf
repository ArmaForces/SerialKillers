#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates teleport to all police stations except the one where the teleporter is located.
 *
 * Arguments:
 * 0: Teleporter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_flag] call afsk_police_fnc_createTeleport
 *
 * Public: No
 */

params ["_flag"];
private _logic = _flag getVariable ["policeStation", objNull];

{
    if (_logic isNotEqualTo _x) then {
        private _destinationName = _x getVariable ["LocationName", "Teleport"];
        _flag addAction [_destinationName call BIS_fnc_localize, {
            [QGVAR(teleport), [_this select 0, _this select 1, _this select 3 select 0]] call CBA_fnc_serverEvent;
        }, [_x]];
    };
} forEach EGVAR(modules,policeStations);
