#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads civilian uniforms, vests, backpacks and headgear from config.
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

private _customCivilianUnits = getArray (missionConfigFile >> "CfgSerialKillers" >> "Civilian" >> "UnitTypes");

private _civilianUnitsConfigs = if (_customCivilianUnits isNotEqualTo []) then {
    _customCivilianUnits apply {configFile >> "CfgVehicles" >> _x};
} else {
    // By default load all civilian units
    QUOTE((configFile >> 'CfgVehicles' >> 'C_man_1') in ([_x] call EFUNC(common,configGetAllParents)) && getNumber (_x >> 'scope') > 1) configClasses (configFile >> "CfgVehicles");
};

// TODO: Add blacklisted units config to exclude VR guys

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
    private _uniform = getText (_x >> "uniformClass");
    if (!(_uniform isEqualTo "")) then {
        GVAR(uniforms) pushBackUnique _uniform;
    };
    // Get backpack
    private _backpack = getText (_x >> "backpack");
    if (!(_backpack isEqualTo "")) then {
        GVAR(backpacks) pushBackUnique _backpack;
    };
    // Get vest
    private _linkedItems = getArray (_x >> "linkedItems");
    {
        if (getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") isEqualTo 701) then {
            GVAR(vests) pushBackUnique _x;
        }
    } forEach _linkedItems;
} forEach _civilianUnitsConfigs;
