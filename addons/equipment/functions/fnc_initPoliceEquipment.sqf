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
private _policeEquipment = [(_equipmentPresetConfig >> "Police" >> "Equipment")] call FUNC(readConfigToNamespace);
private _policeEquipmentList = [];
{
    private _itemClassname = _x;
    private _item = _policeEquipment getVariable _itemClassname;
    private _itemRequiredScore = _item getVariable ["requiredScore", 0];
    _policeEquipmentList pushBack [_itemRequiredScore, _x];
} forEach (allVariables _policeEquipment);
// Add common equipment
{
    private _itemClassname = _x;
    private _item = GVAR(commonEquipment) getVariable _itemClassname;
    private _itemRequiredScore = _item getVariable ["requiredScore", 0];
    _policeEquipmentList pushBack [_itemRequiredScore, _itemClassname];
} forEach (allVariables GVAR(commonEquipment));

// Add ACRE radios
if (EGVAR(common,ACRE_Loaded)) then {
    _policeEquipmentList pushBackUnique [0, GVAR(policeRadio)];
};
_policeEquipmentList sort true;


{
    private _itemRequiredScore = _x select 0;
    private _itemClassName = _x select 1;
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
        private _itemNamespace = _policeEquipment getVariable [_itemClassname, "Not Available"];
        // If item wasn't in policeEquipment it should be in common equipment (as it's the only way it could reach this part)
        if (_itemNamespace isEqualTo "Not Available") then {
            _itemNamespace = GVAR(commonEquipment) getVariable [_itemClassname, call CBA_fnc_createNamespace];
        };
        private _loadMagazines = _itemNamespace getVariable ["loadMagazines", true];
        if (_loadMagazines isEqualTo "false") exitWith {};
        // Get compatible magazines and add them if not added yet
        private _magazines = [_itemClassName, true] call CBA_fnc_compatibleMagazines;
        {
            if (!((GVAR(policeEquipmentList) pushBackUnique _x) isEqualTo -1)) then {
                _requiredScoreList pushBack _x;
            };
        } forEach _magazines;
    };
} forEach _policeEquipmentList;
