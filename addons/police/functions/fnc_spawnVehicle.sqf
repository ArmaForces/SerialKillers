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

#define SPAWNPOINT_SAFEZONE 5

params ["_vehicleClassname", "_spawner"];

private _vehicleType = (_vehicleClassname call BIS_fnc_objectType) select 1;

// Select approriate spawn point for given vehicle
private _spawnPoints = if (_vehicleType isEqualTo "Helicopter" || {_vehicleType isEqualTo "Plane"}) then {
    +(_spawner getVariable QGVAR(helipads))
} else {
    +(_spawner getVariable QGVAR(spawnPoints))
};

// Find spawn position
private _position = [];
private _direction = 0;

private _emptySpawnPointIndex = _spawnPoints findIf {getPos _x nearEntities SPAWNPOINT_SAFEZONE isEqualTo []};
if (_emptySpawnPointIndex isNotEqualTo -1) then {
    LOG("Found empty spawnpoint");
    private _spawnPoint = _spawnPoints select _emptySpawnPointIndex;
    _position = getPos _spawnPoint;
    _direction = getDir _spawnPoint;
} else {
    // Maybe there is a position that has unoccupied vehicle
    LOG("Looking for unoccupied vehicles");
    private _fullSpawnPointsWithoutCrew = _spawnPoints select {
        private _nearEntities = getPos _x nearEntities SPAWNPOINT_SAFEZONE;
        if (_nearEntities isEqualTo []) exitWith { false };
        _nearEntities findIf {crew _x isEqualTo []} isNotEqualTo -1
    };

    if (_fullSpawnPointsWithoutCrew isNotEqualTo []) exitWith {
        LOG("Found unoccupied vehicles");
        private _spawnPoint = [_fullSpawnPointsWithoutCrew] call EFUNC(common,deleteAtRandom);

        // Clear the area
        LOG("Deleting vehicles");
        _spawnPoint nearEntities SPAWNPOINT_SAFEZONE
            apply {
                TRACE_1("Deleting vehicle %1",typeOf _x);
                deleteVehicle _x;
            };

        _position = getPos _spawnPoint;
        _direction = getDir _spawnPoint;
    };
};

if (_position isNotEqualTo []) then {
    _position = _position findEmptyPosition [0, SPAWNPOINT_SAFEZONE, _vehicleClassname];
};

// Show message if no empty spawn position
if (_position isEqualTo []) exitWith {
    private _baseName = (_spawner getVariable "policeStation") getVariable "LocationName";
    private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClassname >> "displayName");
    private _msg = format ["Cannot create %1 at %2.", _vehicleName, _baseName];
    [QEGVAR(common,showSideChatMsg), [WEST, _msg]] call CBA_fnc_globalEvent;
};

// Spawn vehicle
INFO_2("Creating vehicle %1 at position %2",_vehicleClassname,str _position);
[EFUNC(vehicles,createVehicle), [_vehicleClassname, _position, _direction, true, false, true]] call CBA_fnc_execNextFrame;
