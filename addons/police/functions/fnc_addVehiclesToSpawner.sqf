#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds vehicles to spawner
 *
 * Arguments:
 * 0: Spawner object <OBJECT>
 * 1: Vehicles to add <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, ["B_GEN_Offroad_01_gen_F"]] call afsk_police_fnc_addVehiclesToSpawner
 *
 * Public: No
 */

params ["_spawner", "_vehicles"];

if (_vehicles isEqualType "") then {
    _vehicles = [_vehicles];
};

private _vehicleActions = _spawner getVariable QGVAR(vehicleActions);
{
    private _actionID = _vehicleActions getVariable [_x, -1];
    if (_actionID isEqualTo -1) then {
        private _vehicleName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
        private _actionID = _spawner addAction [_vehicleName, {[QGVAR(spawnVehicle), _this select 3] call CBA_fnc_serverEvent}, [_x, _spawner]];
        _vehicleActions setVariable [_x, _actionID];
    };
} forEach _vehicles;
