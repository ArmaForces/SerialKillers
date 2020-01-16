#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares police equipment from given config.
 *
 * Arguments:
 * 0: Eqipment config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_equipmentPresetConfig"];

// Get all defined equipment and sort by required score from lowest to highest
private _policeEquipment = [];
{
    private _itemRequiredScore = getNumber (_x >> "requiredScore");
    _policeEquipment pushBack [_itemRequiredScore, _x];
} forEach ("true" configClasses (_equipmentPresetConfig >> "Police" >> "Equipment"));
// Add common equipment
{
    private _itemClassname = _x;
    private _item = GVAR(commonEquipment) getVariable _itemClassname;
    private _itemRequiredScore = _item getVariable ["requiredScore", 0];
    _policeEquipment pushBack [_itemRequiredScore, _itemClassname];
} forEach (allVariables GVAR(commonEquipment));
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
        private _magazines = [_itemClassName, true] call CBA_fnc_compatibleMagazines;
        {
            if (!((GVAR(policeEquipmentList) pushBackUnique _x) isEqualTo -1)) then {
                _requiredScoreList pushBack _x;
            };
        } forEach _magazines;
    };
} forEach _policeEquipment;
