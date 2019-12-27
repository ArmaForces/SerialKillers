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

private _policeEquipment = [];
{
    private _itemRequiredScore = getNumber (_x >> "requiredScore");
    _policeEquipment pushBack [_itemRequiredScore, _x];
} forEach ("true" configClasses (_equipmentConfig >> "Police" >> "Equipment"));
_policeEquipment sort true;

{
    private _itemRequiredScore = _x select 0;
    private _item = _x select 1;
    private _itemClassName = configName _item;
    private _requiredScoreList = GVAR(policeEquipmentScores) getVariable [str _itemRequiredScore, []];
    if (_requiredScoreList isEqualTo []) then {
        GVAR(policeEquipmentScores) setVariable [str _itemRequiredScore, _requiredScoreList];
    };
    if (!((GVAR(policeEquipmentList) pushBackUnique _itemClassName) isEqualTo -1)) then {
        _requiredScoreList pushBack _itemClassName;
    };
    // If item is weapon, load it's magazines
    private _weaponConfig = (configFile >> "CfgWeapons" >> _itemClassName);
    if (isClass _weaponConfig) then {
        // Check if magazines for this weapon are disabled (must be "false")
        private _loadMagazines = getText (_item >> "loadMagazines");
        if (_loadMagazines isEqualTo "false") exitwith {};
        private _magazines = [_itemClassName] call CBA_fnc_compatibleMagazines;
        {
            if (!((GVAR(policeEquipmentList) pushBackUnique _x) isEqualTo -1)) then {
                _requiredScoreList pushBack _x;
            };
        } forEach _magazines;
    };
} forEach _policeEquipment;
