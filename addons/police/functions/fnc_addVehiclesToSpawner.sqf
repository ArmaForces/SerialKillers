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

// Variable contains namespace (classname -> actionID) for easy action removal
private _vehicleActions = _spawner getVariable QGVAR(vehicleActions);

// Add actions for all vehicles
{
    // Check if action for given classname is already added
    private _actionID = _vehicleActions getVariable [_x, -1];
    if (_actionID isEqualTo -1) then {
        // Create action
        private _vehicleName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
        private _vehicleRequiredScore = [_x] call EFUNC(equipment,getRequiredScoreForItem);
        private _actionText = format ["(%1) %2", _vehicleRequiredScore, _vehicleName];
        private _actionID = _spawner addAction [_actionText, {[QGVAR(spawnVehicle), _this select 3] call CBA_fnc_serverEvent}, [_x, _spawner], _vehicleRequiredScore, true, true, "", "true", 3];

        // Assign to namespace
        _vehicleActions setVariable [_x, _actionID];
    };
} forEach _vehicles;
