#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes car alarm on given vehicle.
 *
 * Arguments:
 * 0: Vehicle which has alarm armed <OBJECT>
 * 1: Chance that the alarm will indeed go off <NUMBER>
 *
 * Return Value:
 * True if alarm has been armed <BOOL>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle", ["_offChance", 1]];

if (_vehicle getVariable [QGVAR(alarmArmed), false]) exitWith { false };

_vehicle setVariable [QGVAR(alarmArmed), true];
_vehicle setVariable [QGVAR(offChance), _offChance];

// Alarm should go off at most once, init a flag to keep that in mind
_vehicle setVariable [QGVAR(hasGoneOff), false];

_vehicle addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    if (side _unit isEqualTo CIVILIAN) exitWith {};

    [QGVAR(carAlarm), [_vehicle]] call CBA_fnc_serverEvent;
}];

true
