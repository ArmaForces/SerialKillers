#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function spawns new police vehicle at given spawner
 *
 * Arguments:
 * 0: Vehicle classname <STRING>
 * 1: Spawner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["B_GEN_Offroad_01_gen_F", bob] call afsk_police_fnc_spawnVehicle
 *
 * Public: No
 */

params ["_vehicleClassname", "_spawner"];

private _vehicleType = (_vehicleClassname call BIS_fnc_objectType) select 1;

// Select approriate spawn point for given vehicle
private _spawnPoints = if (_vehicleType isEqualTo "Helicopter" || {_vehicleType isEqualTo "Plane"}) then {
    +(_spawner getVariable QGVAR(helipads))
} else {
    +(_spawner getVariable QGVAR(spawnPoints))
};

private _position = [];
private _direction = 0;
while {_position isEqualTo [] && {!(_spawnPoints isEqualTo [])}} do {
    private _spawnPoint = [_spawnPoints] call EFUNC(common,deleteAtRandom);
    _position = getPos (_spawnPoint) findEmptyPosition [0, 0, _vehicleClassname];
    if (!(_position isEqualTo [])) exitWith {
        _direction = getDir _spawnPoint;
    };
};

if (_position isEqualTo []) exitWith {
    private _baseName = (_spawner getVariable "policeStation") getVariable "LocationName";
    private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClassname >> "displayName");
    private _msg = format ["Cannot create %1 at %2.", _vehicleName, _baseName];
    [QEGVAR(common,showSideChatMsg), [WEST, _msg]] call CBA_fnc_globalEvent;
};

[_vehicleClassname, _position, _direction, true, false] call EFUNC(civilian,createVehicle);
