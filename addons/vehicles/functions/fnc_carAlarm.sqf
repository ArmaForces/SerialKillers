#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function triggers car alarm on given vehicle.
 *
 * Arguments:
 * 0: Vehicle which has alarm going off <OBJECT>
 *
 * Return Value:
 * True if alarm has gone off <BOOL>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable [QGVAR(alarmOn), false]) exitWith { false };
if (!GVAR(alarmAlwaysArmed) && {_vehicle getVariable [QGVAR(hasGoneOff), false]}) exitWith { false };
if (_vehicle getVariable [QGVAR(offChance), 1] < random 1) exitWith {
    if (GVAR(alarmDisarmIfFailed)) then {
        _vehicle setVariable [QGVAR(alarmArmed), false];
    };

    false
};

_vehicle setVariable [QGVAR(alarmOn), true];
_vehicle setVariable [QGVAR(hasGoneOff), true];

[_vehicle, true, 120] call FUNC(carAlarmLoop);

[QGVAR(alarmOff), [_vehicle]] call CBA_fnc_globalEvent;

true
