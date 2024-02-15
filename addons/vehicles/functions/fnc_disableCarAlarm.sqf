#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function disables car alarm on given vehicle.
 *
 * Arguments:
 * 0: Vehicle which has alarm armed <OBJECT>
 *
 * Return Value:
 * True if alarm is disabled <BOOL>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle"];

if (!isServer) exitWith {
    [QGVAR(disableCarAlarm), [_vehicle]] call CBA_fnc_serverEvent;
    false
};

_vehicle setVariable [QGVAR(alarmArmed), false];

// Remove EH so it doesn't fire unnecessarily
private _ehId = _vehicle getVariable [QGVAR(GetInEHID), -1];
_vehicle removeEventHandler ["GetIn", _ehId];

INFO_1("Disabled alarm in vehicle %1",_vehicle);

true
