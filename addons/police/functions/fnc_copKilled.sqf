#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles cop killing event.
 *
 * Arguments:
 * 0: Killed cop <OBJECT>
 * 1: Cop killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, ted] call afsk_police_fnc_copKilled
 *
 * Public: No
 */

params ["_unit", "_killer"];

if !(isServer) exitWith {};

private _time = [daytime] call BIS_fnc_timeToString;
// Call function to create marker at killed unit's position.
[_unit, _time] call FUNC(copKilledMarker);
// Show message for all cops that cop has been killed near some location with timestamp
private _msg = [_unit, _time] call FUNC(copKilledMsg);
[QGVAR(showMsg), [_msg]] call CBA_fnc_globalEvent;
// Check why unit died and call funcion to change score.
if (side _killer == EAST || {_unit == _killer}) then {
    [2] call EFUNC(score,addPoliceScore);
    [2] call EFUNC(score,addKillersScore);
} else {
    [0] call EFUNC(score,addPoliceScore);
    [2] call EFUNC(score,addKillersScore);
};
