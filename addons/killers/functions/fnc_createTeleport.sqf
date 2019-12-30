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

private _teleportActionsIDs = [];
{
    private _destinationName = _x getVariable ["LocationName", "Teleport"];
    private _teleportActionID = _flag addAction [_destinationName, {
        [QGVAR(teleport), [_this select 0, _this select 1, _this select 3 select 0]] call CBA_fnc_serverEvent;
        call FUNC(deleteStartPositionsMarkers);
        private _teleportActionsIDs = (_this select 0) getVariable [QGVAR(teleportActionsIDs), []];
        {
            (_this select 0 ) removeAction (_x);
        } forEach _teleportActionsIDs;
    }, [_x]];
    [_x] call FUNC(createStartPositionMarker);
    _teleportActionsIDs pushBack _teleportActionID;
} forEach EGVAR(modules,killersStartPositions);

_flag setVariable [QGVAR(teleportActionsIDs), _teleportActionsIDs];
