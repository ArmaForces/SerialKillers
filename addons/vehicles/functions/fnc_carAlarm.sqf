#include "..\script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function triggers car alarm on given vehicle.
 *
 * Arguments:
 * 0: Vehicle which has alarm turned on <OBJECT>
 *
 * Return Value:
 * True if alarm has been turned on <BOOL>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable [QGVAR(alarmOn), false]) exitWith { false };

_vehicle setVariable [QGVAR(alarmOn), true];

[_vehicle, true, 120] call FUNC(carAlarmLoop);

true
