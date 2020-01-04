#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function add release action to given prisoner.
 *
 * Arguments:
 * 0: Prisoner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_jail_fnc_addReleaseAction
 *
 * Public: No
 */

params ["_prisoner"];

if (GVAR(ACE_Loaded)) exitWith {};

private _actionID = [
    _prisoner,
    LLSTRING(Release_Prisoner),
    "",
    "",
    QUOTE([ARR_2(_this, _target)] call FUNC(canRelease)),
    QUOTE([ARR_2(_caller, _target)] call FUNC(canRelease)),
    {}, {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [QGVAR(released), [_target], _target] call CBA_fnc_targetEvent;
        [QGVAR(removeReleaseAction)] call CBA_fnc_globalEvent;
    }, {}, [], 1, 10, true, false
] call BIS_fnc_holdActionAdd;

GVAR(releaseActions) setVariable [str _prisoner, _actionID];
