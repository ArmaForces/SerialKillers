#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function cośtam.
 *
 * Arguments:
 * 0: Killers base module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_module"];

if !(GVAR(killersBase) isEqualTo objNull) exitWith {
    LOG("Multiple killers base modules placed.");
};

LOG("Killers base module.");

GVAR(killersBase) = _module;
