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
private _basePos = getPosATL _logic;
private _flag = createVehicle [GVAR(FlagClassname), _basePos, [], 0, "NONE"];
_flag setVariable ["policeStation", _logic, true];

// Init arsenal
private _box = createVehicle [GVAR(arsenalBoxClassName), _basePos, [], 0, "NONE"];
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
[QGVAR(createPoliceStationMarkerLocal), [_baseName, _basePos]] call CBA_fnc_globalEventJIP;

// Create teleporter
_logic setVariable ["Teleporter", _flag, true];
[QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;

LOG_1("Initialized police station %1",_baseName);
