#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes own implementation of release action.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_jail_fnc_initReleaseAction
 *
 * Public: No
 */

// Add/remove prisoner release action EH for EAST only
[QGVAR(addReleaseAction), {
    _this call FUNC(addReleaseAction);
}] call CBA_fnc_addEventHandler;
[QGVAR(removeReleaseAction), {
    _this call FUNC(removeReleaseAction);
}] call CBA_fnc_addEventHandler;

// Add own EH for release
[QGVAR(released), {
    params ["_unit"];
    if (!(_unit isEqualTo player)) exitWith {};
    if (_unit getVariable [QGVAR(isImprisoned), false]) then {
        [QGVAR(free), [player]] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_addEventHandler;

// JIP compatibility for own release action
{
    [QGVAR(addReleaseAction), [_x]] call CBA_fnc_localEvent;
} forEach GVAR(prisoners);
