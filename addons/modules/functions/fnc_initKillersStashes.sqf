#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers stash modules.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * List of killers stash modules <ARRAY<OBJECT>>
 *
 * Example:
 * None
 *
 * Public: No
 */

private _killersStashModules = entities QGVAR(moduleKillersStash);

{
    [_x] call FUNC(moduleKillersStash);
} forEach _killersStashModules;

_killersStashModules
