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

private _equipmentPresetConfig = (configFile >> "CfgSerialKillers" >> "Equipment_Presets");
private _missionEquipmentConfig = (missionConfigFile >> "CfgSerialKillers" >> "Equipment_Presets");

if (GVAR(equipmentPresetCustom) && {isClass _missionEquipmentConfig}) then {
    _equipmentPresetConfig = (_missionEquipmentConfig >> "Custom");
} else {
    _equipmentPresetConfig = switch (GVAR(equipmentPreset)) do {
        // Vanilla config
        case 1: {_equipmentPresetConfig >> "Vanilla"};
        // RHS config
        case 2: {_equipmentPresetConfig >> "RHS"};
        // CUP config
        case 3: {_equipmentPresetConfig >> "CUP"};
        // CUP & RHS config
        case 4: {_equipmentPresetConfig >> "CUP_RHS"};
        // Automatic config selection based on loaded addons
        default {
            if (EGVAR(common,RHS_Loaded) && {EGVAR(common,CUP_Loaded)}) exitWith {
                _equipmentPresetConfig >> "CUP_RHS"
            };
            if (EGVAR(common,RHS_Loaded)) exitWith {_equipmentPresetConfig >> "RHS"};
            if (EGVAR(common,CUP_Loaded)) exitWith {_equipmentPresetConfig >> "CUP"};
            _equipmentPresetConfig >> "Vanilla"
        };
    };
};

GVAR(equipmentPreset) = _equipmentPresetConfig;

[GVAR(equipmentPreset)] call FUNC(initCommonEquipment);
[GVAR(equipmentPreset)] call FUNC(initPoliceEquipment);
[GVAR(equipmentPreset)] call FUNC(initPoliceVehicles);
[GVAR(equipmentPreset)] call FUNC(initKillersEquipment);
