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

if (_prisoner getVariable [QGVAR(isImprisoned), false]) exitWith {
    WARNING_1("Killer %1 is not in prison and can't be freed!",name _prisoner);
};

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
    INFO_1("Killer %1 is no longer considered as recently imprisoned.",name _prisoner);
}] call CBA_fnc_waitUntilAndExecute;

// Release prisoner. Supports ACE Captives untie.
if (EGVAR(common,ACE_Loaded)) then {
    // Untie the prisoner.
    [QACEGVAR(captives,setHandcuffed), [_prisoner, false], _prisoner] call CBA_fnc_targetEvent;
} else {
    // Own implementation
    [QGVAR(released), [_target], _target] call CBA_fnc_targetEvent;
    [QGVAR(removeReleaseAction)] call CBA_fnc_globalEvent;
};

// Terminate prisoner spectator
[QEGVAR(common,terminateSpectator), [], _prisoner] call CBA_fnc_targetEvent;

INFO_1("Killer %1 is now free",name _prisoner);
