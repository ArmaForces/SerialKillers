#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function removes release action from given prisoner.
 *
 * Arguments:
 * 0: Prisoner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_jail_fnc_removeReleaseAction
 *
 * Public: No
 */

params ["_prisoner"];

if (GVAR(ACE_Loaded)) exitWith {};

private _actionID = GVAR(releaseActions) getVariable [_prisoner, -1];
[_prisoner, _actionID] call BIS_fnc_holdActionRemove;
