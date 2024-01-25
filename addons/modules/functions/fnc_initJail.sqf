#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes jail module.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Jail module <MODULE>
 *
 * Example:
 * None
 *
 * Public: No
 */

private _jailModules = entities QGVAR(moduleJail);

if (_jailModules isEqualTo []) exitWith {
    ERROR("Jail module not placed, cannot create jail!");
    nil
};

if (count _jailModules > 1) then {
    WARNING("Detected more than 1 jail module. Using first one, which can be random!");
};

_jailModules select 0
