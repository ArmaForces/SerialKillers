#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads equipment configs.
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

private _equipmentConfig = (configFile >> "CfgSerialKillers" >> "Equipment_Presets");
private _missionEquipmentConfig = (missionConfigFile >> "CfgSerialKillers" >> "Equipment_Presets");

if (GVAR(equipmentPresetCustom) && {isClass _missionEquipmentConfig}) then {
    _equipmentConfig = (_missionEquipmentConfig >> "Custom");
} else {
    _equipmentConfig = switch (GVAR(equipmentPreset)) do {
        // Vanilla config
        case 1: {_equipmentConfig >> "Vanilla"};
        // RHS config
        case 2: {_equipmentConfig >> "RHS"};
        // CUP config
        case 3: {_equipmentConfig >> "CUP"};
        // CUP & RHS config
        case 4: {_equipmentConfig >> "CUP_RHS"};
        // Automatic config selection based on loaded addons
        default {
            if (EGVAR(common,RHS_Loaded) && {EGVAR(common,CUP_Loaded)}) exitWith {
                _equipmentConfig >> "CUP_RHS"
            };
            if (EGVAR(common,RHS_Loaded)) exitWith {_equipmentConfig >> "RHS"};
            if (EGVAR(common,CUP_Loaded)) exitWith {_equipmentConfig >> "CUP"};
            _equipmentConfig >> "Vanilla"
        };
    };
};

GVAR(equipmentPreset) = _equipmentConfig;
GVAR(commonEquipment) = "true" configClasses (_equipmentConfig >> "Common" >> "Equipment");
GVAR(killersEquipment) = "true" configClasses (_equipmentConfig >> "Killers" >> "Equipment");

[_equipmentConfig] call FUNC(initPoliceEquipment);

{
    private _availableOnStart = getNumber (_x >> "availableOnStart");
    private _availableInStash = getNumber (_x >> "availableInStash");
    if (_availableOnStart isEqualTo 1) then {
        GVAR(killersStartEquipment) pushBackUnique (configName _x);
    };
    if (_availableInStash isEqualTo 1) then {
        GVAR(killersStashEquipment) pushBackUnique (configName _x);
    };
} forEach GVAR(killersEquipment);
