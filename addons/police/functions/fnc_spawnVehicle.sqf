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

[_vehicleClassname, _spawner, getDir _spawner, true, false] call EFUNC(civilian,createVehicle);
