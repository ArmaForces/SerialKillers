#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers start modules.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

private _killersStartModules = entities QGVAR(moduleKillersStart);

{
    [_x] call FUNC(moduleKillersStart);
} forEach _killersStartModules;

_killersStartModules
