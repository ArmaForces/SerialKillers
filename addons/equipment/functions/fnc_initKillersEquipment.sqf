#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares killers equipment from given config.
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

private _killersEquipment = [_equipmentPresetConfig >> "Killers" >> "Equipment"] call FUNC(readConfigToNamespace);

// Add killers equipment
{
    private _itemClassname = _x;
    private _item = _killersEquipment getVariable _itemClassname;
    private _availableOnStart = _item getVariable ["availableOnStart", 1];
    private _availableInStash = _item getVariable ["availableInStash", 1];
    if (_availableOnStart isEqualTo 1) then {
        GVAR(killersStartEquipment) pushBackUnique (_itemClassname);
    };
    if (_availableInStash isEqualTo 1) then {
        GVAR(killersStashEquipment) pushBackUnique (_itemClassname);
    };
} forEach (allVariables _killersEquipment);

// Add common equipment
{
    private _itemClassname = _x;
    private _item = GVAR(commonEquipment) getVariable _itemClassname;
    private _availableOnStart = _item getVariable ["availableOnStart", 1];
    private _availableInStash = _item getVariable ["availableInStash", 1];
    if (_availableOnStart isEqualTo 1) then {
        GVAR(killersStartEquipment) pushBackUnique (_itemClassname);
    };
    if (_availableInStash isEqualTo 1) then {
        GVAR(killersStashCommonEquipment) pushBackUnique (_itemClassname);
    };
} forEach (allVariables GVAR(commonEquipment));
