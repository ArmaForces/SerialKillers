#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers main base.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_killers_fnc_initKillersBase
 *
 * Public: No
 */

private _killersBase = EGVAR(modules,killersBase);

// Create teleporter to all start positions
private _flag = "Flag_Red_F" createVehicle (getPos _killersBase);
_flag setVariable ["killersBase", _killersBase, true];
_killersBase setVariable ["Teleporter", _flag, true];
[QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;
