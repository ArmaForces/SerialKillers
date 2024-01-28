#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers base module.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Killers base module <MODULE>
 *
 * Example:
 * None
 *
 * Public: No
 */

private _killersBaseModules = entities QGVAR(moduleKillersBase);

if (_killersBaseModules isEqualTo []) exitWith {
    ERROR("Killers base module not placed, cannot create killers base!");
    nil
};

if (count _killersBaseModules > 1) then {
    WARNING("Detected more than 1 killers base module. Using first one, which can be random!");
};

_killersBaseModules select 0
