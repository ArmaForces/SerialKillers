#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function assigns spawn points in base area to given spawner
 *
 * Arguments:
 * 0: Spawner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call afsk_police_fnc_initSpawner
 *
 * Public: No
 */

params ["_spawner"];

private _policeBase = _spawner getVariable "policeStation";
private _baseArea = [getPos _policeBase] + (_policeBase getVariable "objectArea");

// Variable contains vehicle classname -> action id connection
_spawner setVariable [QGVAR(vehicleActions), true call CBA_fnc_createNamespace];

// Find all spawn points within police base
private _spawnPoints = (allMissionObjects "VR_Area_01_circle_4_grey_F") inAreaArray _baseArea;
private _helipads = (allMissionObjects "Helipad_base_F") inAreaArray _baseArea;

// Assign found spawn points for easier access
_spawner setVariable [QGVAR(spawnPoints), _spawnPoints, true];
_spawner setVariable [QGVAR(helipads), _helipads, true];
