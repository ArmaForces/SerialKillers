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
private _positionID = 0;
{
    // _x is location name and value is position assigned
    private _destinationName = format ["%1 - %2", _positionID, _x];
    private _destinationPos = GVAR(startPositions) getVariable _x;
    private _teleportActionID = _flag addAction [_destinationName, {
        [QEGVAR(common,teleport), [_this select 1, _this select 3 select 0]] call CBA_fnc_serverEvent;
        [QGVAR(teleportedToStart), [_this select 0]] call CBA_fnc_localEvent;
    }, [_destinationPos]];
    [_destinationPos, _destinationName] call FUNC(createStartPositionMarker);
    // Add for deletion after teleportation
    _teleportActionsIDs pushBack _teleportActionID;
    _positionID = _positionID + 1;
} forEach (allVariables GVAR(startPositions));

_flag setVariable [QGVAR(teleportActionsIDs), _teleportActionsIDs];
