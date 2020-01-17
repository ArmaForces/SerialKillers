#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads civilian uniforms and headgear from config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

// Get all civilian units config
private _civilianUnitsConfigs = QUOTE((configFile >> 'CfgVehicles' >> 'C_man_1') in ([_x] call EFUNC(common,configGetAllParents))) configClasses (configFile >> "CfgVehicles");

{
    // Add to units list
    GVAR(units) pushBackUnique (configName _x);
    // Get all compatible headgear
    {
        if (_x isEqualType "") then {
            GVAR(headgear) pushBackUnique _x;
        };
    } forEach (getArray (_x >> "headgearList"));
    // Get uniform
    GVAR(uniforms) pushBackUnique (getText (_x >> "uniformClass"));
} forEach _civilianUnitsConfigs;
