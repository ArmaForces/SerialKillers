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

params ["_equipmentConfig"];

private _killersEquipment = "true" configClasses (_equipmentConfig >> "Killers" >> "Equipment");

// Add killers equipment
{
    private _availableOnStart = getNumber (_x >> "availableOnStart");
    private _availableInStash = getNumber (_x >> "availableInStash");
    if (_availableOnStart isEqualTo 1) then {
        GVAR(killersStartEquipment) pushBackUnique (configName _x);
    };
    if (_availableInStash isEqualTo 1) then {
        GVAR(killersStashEquipment) pushBackUnique (configName _x);
    };
} forEach _killersEquipment;

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
