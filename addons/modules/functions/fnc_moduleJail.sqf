#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function assigns jail module to variable for further initialization.
 *
 * Arguments:
 * 0: Jail module <OBJECT>
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

if !(GVAR(jail) isEqualTo objNull) exitWith {
    LOG("Multiple jail modules placed.");
};

GVAR(jail) = _module;
