#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates Arsenal on object
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_common_fnc_createArsenal
 *
 * Public: No
 */

params ["_object"];

if (GVAR(ACE_Loaded)) then {
    [_object, false, true] call ace_arsenal_fnc_initBox;
} else {
    ["AmmoboxInit", [_object]] call BIS_fnc_arsenal;
};
