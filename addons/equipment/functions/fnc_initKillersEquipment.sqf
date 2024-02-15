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

// Fills starting and stash equipment lists using given namespace
private _fnc_fillEquipmentLists = {
    params ["_stuffNamespace", "_startEquipmentList", "_stashEquipmentList"];
    {
        private _itemClassname = _x;
        private _item = _stuffNamespace getVariable _itemClassname;

        private _availableOnStart = _item getVariable ["availableOnStart", 1];
        _availableOnStart = if (_availableOnStart isEqualType true) then {
            [0, 1] select _availableOnStart
        } else { _availableOnStart };

        private _availableInStash = _item getVariable ["availableInStash", 1];
        _availableInStash = if (_availableInStash isEqualType true) then {
            [0, 1] select _availableInStash
        } else { _availableInStash };

        // Add equipment available on start
        if (_availableOnStart > 0) then {
            _startEquipmentList pushBackUnique _itemClassname;
            // Load magazines if it is a weapon
            if (isClass (configFile >> "CfgWeapons" >> _itemClassname)) then {
                {
                    _startEquipmentList pushBackUnique _x;
                } forEach ([_itemClassname, true] call CBA_fnc_compatibleMagazines);
            };
        };
        // Add equipment available in stashes
        if (_availableInStash > 0) then {
            _stashEquipmentList pushBackUnique _itemClassname;
            // We don't load magazines here as they get picked from weapon compatible list when filling stash
        };
    } forEach (allVariables _stuffNamespace);
};

// Add killers equipment
[_killersEquipment, GVAR(killersStartEquipment), GVAR(killersStashEquipment)] call _fnc_fillEquipmentLists;
// Add common equipment
[GVAR(commonEquipment), GVAR(killersStartEquipment), GVAR(killersStashCommonEquipment)] call _fnc_fillEquipmentLists;

// Add civilian equipment
private _civilianEquipmentTypes = [EGVAR(civilian,backpacks), EGVAR(civilian,uniforms), EGVAR(civilian,vests), EGVAR(civilian,headgear)];
{
    {
        GVAR(killersCivilianEquipment) pushBackUnique _x;
    } forEach _x;
} forEach _civilianEquipmentTypes;

// Add ACRE radios
if (EGVAR(common,ACRE_Loaded)) then {
    GVAR(killersStartEquipment) pushBackUnique GVAR(killersRadio);
    GVAR(killersStashCommonEquipment) pushBackUnique GVAR(killersRadio);
};
