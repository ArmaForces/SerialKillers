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

private _fnc_noEmptyPositionMsg = {
    params ["_vehicleClassname", "_spawner"];
    private _baseName = (_spawner getVariable "policeStation") getVariable "LocationName";
    private _vehicleName = getTextRaw (configFile >> "CfgVehicles" >> _vehicleClassname >> "displayName");
    [QGVAR(showFailedCreatingVehicleNotification), [_vehicleName, _baseName]] call CBA_fnc_globalEvent;
};

// Find spawn position
private _position = [];
private _direction = 0;

private _emptySpawnPointIndex = _spawnPoints findIf {getPosATL _x nearEntities SPAWNPOINT_SAFEZONE isEqualTo []};
if (_emptySpawnPointIndex isEqualTo -1) exitWith {
    // Maybe there is a position that has unoccupied vehicle
    LOG("Looking for unoccupied vehicles");
    private _fullSpawnPointsWithoutCrew = _spawnPoints select {
        private _nearEntities = getPosATL _x nearEntities SPAWNPOINT_SAFEZONE;
        if (_nearEntities isEqualTo []) exitWith { false };
        _nearEntities findIf {crew _x isEqualTo []} isNotEqualTo -1
    };

    if (_fullSpawnPointsWithoutCrew isEqualTo []) exitWith {
        [_vehicleClassname, _spawner] call _fnc_noEmptyPositionMsg;
    };

    LOG("Found unoccupied vehicles");
    private _spawnPoint = [_fullSpawnPointsWithoutCrew] call EFUNC(common,deleteAtRandom);

    // Clear the area
    LOG("Deleting vehicles");
    _spawnPoint nearEntities SPAWNPOINT_SAFEZONE
        apply {
            TRACE_1("Deleting vehicle %1",typeOf _x);
            deleteVehicle _x;
        };

    [FUNC(spawnVehicle), _this] call CBA_fnc_execNextFrame;
};

LOG("Found empty spawnpoint");
private _spawnPoint = _spawnPoints select _emptySpawnPointIndex;
private _position = getPosATL _spawnPoint findEmptyPosition [0, SPAWNPOINT_SAFEZONE, _vehicleClassname];
_direction = getDir _spawnPoint;

// Show message if no empty spawn position
if (_position isEqualTo []) exitWith {
    [_vehicleClassname, _spawner] call _fnc_noEmptyPositionMsg;
};

// Spawn vehicle
INFO_2("Creating vehicle %1 at position %2",_vehicleClassname,str _position);
[{
    private _vehicle = _this call EFUNC(vehicles,createVehicle);
    _vehicle setVariable [QGVAR(isPoliceVehicle), true, true];
    _vehicle addItemCargoGlobal ["TDD_Talon_Mag", 1];
}, [_vehicleClassname, _position, _direction, true, false, true]] call CBA_fnc_execNextFrame;
