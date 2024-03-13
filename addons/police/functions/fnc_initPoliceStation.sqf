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
private _flag = createVehicle ["Flag_US_F", _basePos, [], 0, "NONE"];
_flag setVariable ["policeStation", _logic, true];

// Init arsenal
private _box = createVehicle ["B_CargoNet_01_ammo_F", _basePos, [], 0, "NONE"];
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
_logic setVariable ["Arsenal", _box, true];
_box setVariable ["policeStation", _logic, true];
[_box] call EFUNC(common,createArsenal);
GVAR(arsenals) pushBack _box;

// Init vehicle spawner
[_box] call FUNC(initSpawner);

// Create marker
private _marker = [_baseName, _basePos] call FUNC(policeStationMarker);
_logic setVariable ["Marker", _marker];

// Create teleporter
_logic setVariable ["Teleporter", _flag, true];
[QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;

private _stationArea = _logic getVariable ["objectArea", []];
[QGVAR(policeStationInitialized), [_logic]] call CBA_fnc_localEvent;
