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
    // _x is location className and value is position assigned
    private _destinationName = [_x] call EFUNC(common,getLocationName);
    private _destinationPos = GVAR(startPositions) getVariable _x;
    private _teleportActionID = _flag addAction [_destinationName, {
        [QGVAR(teleport), [_this select 0, _this select 1, _this select 3 select 0]] call CBA_fnc_serverEvent;
        // Delete all teleport actions and markers
        call FUNC(deleteStartPositionsMarkers);
        private _teleportActionsIDs = (_this select 0) getVariable [QGVAR(teleportActionsIDs), []];
        {
            (_this select 0 ) removeAction (_x);
        } forEach _teleportActionsIDs;
    }, [_destinationPos]];
    [_destinationPos, _destinationName] call FUNC(createStartPositionMarker);
    // Add for deletion after teleportation
    _teleportActionsIDs pushBack _teleportActionID;
} forEach (allVariables GVAR(startPositions));

_flag setVariable [QGVAR(teleportActionsIDs), _teleportActionsIDs];
