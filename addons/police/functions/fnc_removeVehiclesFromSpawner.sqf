#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function removes vehicles from spawner
 *
 * Arguments:
 * 0: Spawner object <OBJECT>
 * 1: Vehicles to remove <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, ["B_GEN_Offroad_01_gen_F"]] call afsk_police_fnc_removeVehiclesFromSpawner
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
    if (!(_actionID isEqualTo -1)) then {
        _spawner removeAction _actionID;
        _vehicleActions setVariable [_x, nil];
    };
} forEach _vehicles;
