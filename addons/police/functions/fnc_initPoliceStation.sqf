#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes police station. Creates vehicle spawners, teleporters and arsenals.
 *
 * Arguments:
 * 0: Police Station Module <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_logic"];

if !(isServer) exitWith {};

private _baseName = _logic getVariable ["LocationName", str random(999)];
private _hasHelipad = _logic getVariable ["HasHelipad", false];
private _basePos = getPos _logic;
// Init vehicle spawners here
// Init arsenal here
private _flag = "Flag_US_F" createVehicle _basePos;
_flag setVariable ["policeStation", _logic, true];
_logic setVariable ["Arsenal", _flag, true];
[_flag] call EFUNC(common,createArsenal);
GVAR(arsenals) pushBack _flag;

// Create marker
private _marker = [_baseName, _basePos] call FUNC(policeStationMarker);
_logic setVariable ["Marker", _marker];

// Create teleporter
_logic setVariable ["Teleporter", _flag, true];
[QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;
