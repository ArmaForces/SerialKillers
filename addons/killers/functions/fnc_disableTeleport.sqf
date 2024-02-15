#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function removes all teleport actions from killers base flag.
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

private _flag = EGVAR(modules,killersBase) getVariable "Teleporter";
private _teleportActionsIDs = _flag getVariable [QGVAR(teleportActionsIDs), []];
{
    (_this select 0 ) removeAction (_x);
} forEach _teleportActionsIDs;
