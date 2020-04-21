#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares common equipment namespace from given config.
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

GVAR(commonEquipment) = [_equipmentPresetConfig >> "Common" >> "Equipment", GVAR(commonEquipment)] call FUNC(readConfigToNamespace);

// Add medical items
{
    GVAR(commonEquipment) setVariable [_x, call CBA_fnc_createNamespace];
} forEach EGVAR(medical,items);

if (EGVAR(common,ACE_Loaded)) then {
    // Check if any ACE items were already added, if so, skip autoadd
    if ((allVariables GVAR(commonEquipment) findIf {["ACE", _x, false] call BIS_fnc_inString}) isEqualTo -1) then {
        {
            GVAR(commonEquipment) setVariable [_x, call CBA_fnc_createNamespace];
        } forEach ["ACE_Flashlight_XL50", "ACE_MapTools"];
    };
};
