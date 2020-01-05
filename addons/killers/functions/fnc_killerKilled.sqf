#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles killer killing event.
 *
 * Arguments:
 * 0: Killed killer <OBJECT>
 * 1: Killer killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, ted] call afsk_killers_fnc_killerKilled
 *
 * Public: No
 */

params ["_unit", "_killer"];

if !(isServer) exitWith {};

private _aliveKillers = allPlayers select {side _x isEqualTo EAST && {!(_x getVariable [QGVAR(isImprisoned), false])}};
if (_aliveKillers isEqualTo []) then {
    [QEGVAR(score,killersKilled)] call CBA_fnc_serverEvent;
};
