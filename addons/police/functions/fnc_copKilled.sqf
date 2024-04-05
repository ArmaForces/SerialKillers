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

private _isPlayerOrAi = isPlayer _killer select ["AI", "PLAYER"];
LOG_4("Cop %1 was killed by %2 %3 at %4",name _unit,_isPlayerOrAi,name _killer,_time);

// Call function to create marker at killed unit's position.
[_unit, _time] call FUNC(copKilledMarker);
// Show message for all cops that cop has been killed near some location with timestamp
[QGVAR(showcopKilledNotification), [_unit, _time]] call CBA_fnc_globalEvent;

// Check why unit died and call funcion to change score.
// BUG: side check returns false for dead cops
if ([_killer] call FUNC(isCop)) then {
    [QEGVAR(score,changeScore), [EAST, EGVAR(score,copKilledCopKillersScore), LSTRING(KilledByCop)]] call CBA_fnc_serverEvent;
    [QEGVAR(score,changeScore), [WEST, EGVAR(score,copKilledCopPoliceScore), LSTRING(KilledByCop)]] call CBA_fnc_serverEvent;
} else {
    [QEGVAR(score,changeScore), [EAST, EGVAR(score,killedCopKillersScore), LSTRING(Killed)]] call CBA_fnc_serverEvent;
    [QEGVAR(score,changeScore), [WEST, EGVAR(score,killedCopPoliceScore), LSTRING(Killed)]] call CBA_fnc_serverEvent;
};
