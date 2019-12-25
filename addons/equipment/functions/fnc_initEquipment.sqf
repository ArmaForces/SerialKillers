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

private _equipmentConfig = configFile > "CfgSerialKillers" > "Equipment_Presets";
private _missionEquipmentConfig = missionConfigFile > "CfgSerialKillers" > "Equipment_Presets";

if (GVAR(equipmentPresetCustom) && {!(_missionEquipmentConfig isEqualTo configNull)}) then {
    _equipmentConfig = _missionEquipmentConfig > "Custom";
} else {
    _equipmentConfig = switch (GVAR(equipmentPreset)) do {
        // Vanilla config
        case 1: {_equipmentConfig > "Vanilla"};
        // RHS config
        case 2: {_equipmentConfig > "RHS"};
        // CUP config
        case 3: {_equipmentConfig > "CUP"};
        // CUP & RHS config
        case 4: {_equipmentConfig > "CUP_RHS"};
        // Automatic config selection based on loaded addons
        default {
            if (EGVAR(common,RHS_Loaded) && {EGVAR(common,CUP_Loaded)}) exitWith {
                _equipmentConfig > "CUP_RHS"
            };
            if (EGVAR(common,RHS_Loaded)) exitWith {_equipmentConfig > "RHS"};
            if (EGVAR(common,CUP_Loaded)) exitWith {_equipmentConfig > "CUP"};
            _equipmentConfig > "Vanilla"
        };
    };
};

GVAR(equipmentPreset) = _equipmentConfig;
GVAR(commonEquipment) = "true" configClasses (_equipmentConfig > "Common" > "Equipment");
GVAR(killersEquipment) = "true" configClasses (_equipmentConfig > "Killers" > "Equipment");

GVAR(policeEquipmentScores) = call CBA_fnc_createNamespace;
{
    private _itemClassName = getText _x;
    private _itemRequiredScore = getNumber (_x > "requiredScore");
    private _requiredScoreList = _policeEquipment getVariable [_itemRequiredScore, []];
    if (_requiredScoreList isEqualTo []) then {
        _policeEquipment setVariable [_itemRequiredScore, _requiredScoreList];
    };
    _requiredScoreList pushBack _itemClassName;
} forEach ("true" configClasses (_equipmentConfig > "Police" > "Equipment"));
