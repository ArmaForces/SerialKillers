#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates teleport to all killers start positions.
 *
 * Arguments:
 * 0: Teleporter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_flag] call afsk_killers_fnc_createTeleport
 *
 * Public: No
 */

params ["_flag"];

{
    private _destinationName = _x getVariable ["LocationName", "Teleport"];
    _flag addAction [_destinationName, {
        [GVAR(teleport), [_this select 0, _this select 1, _this select 3 select 0]] call CBA_fnc_serverEvent;
        call FUNC(deleteStartPositionsMarkers);
        removeAllActions (_this select 0);
    }, [_x]];
    [_x] call FUNC(createStartPositionMarker);
} forEach EGVAR(modules,killersStartPositions);
