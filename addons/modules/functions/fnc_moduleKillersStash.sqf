#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds killers stash module to killers stash list.
 *
 * Arguments:
 * 0: Killers stash module <OBJECT>
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

GVAR(killersStashes) pushBack _module;
