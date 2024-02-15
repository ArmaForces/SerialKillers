#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function frees prisoner and terminates his spectator
 *
 * Arguments:
 * 0: Prisoner to free <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_jail_fnc_free
 *
 * Public: No
 */

params ["_prisoner"];

// Remove prisoner from prisoners list and remove assigned variable
GVAR(prisoners) deleteAt (GVAR(prisoners) findIf {_x isEqualTo _prisoner});
publicVariable QGVAR(prisoners);
_prisoner setVariable [QGVAR(isImprisoned), false, true];
_prisoner setVariable [QGVAR(wasImprisonedRecently), true, true];

[{[_this] call FUNC(isHandcuffed)}, {
    // Ignore if he's a prisoner again
}, _prisoner, RECENTLY_FREED_TIMEOUT, {
    // Clear the flag
    _this setVariable [QGVAR(wasImprisonedRecently), false, true];
}] call CBA_fnc_waitUntilAndExecute;

// Terminate prisoner spectator
[QEGVAR(common,terminateSpectator), [], _prisoner] call CBA_fnc_targetEvent;
