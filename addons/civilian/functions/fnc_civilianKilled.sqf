#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles civilian killed event.
 *
 * Arguments:
 * 0: Killed unit <OBJECT>
 * 1: Killer unit <OBJECT>
 * 2: useless anyway <ANYTHING>
 * 3: useless anyway <ANYTHING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, player] call afsk_civilian_fnc_civilianKilled
 *
 * Public: No
 */

params ["_civilian", "_killer", "_instigator", "_useEffects"];

// Remove civilian from game
[_civilian] call EFUNC(civilian,unassignCivilianFromCity);
GVAR(civilians) deleteAt (GVAR(civilians) findIf {_x isEqualTo _civilian});
[_civilian] call EFUNC(markers,deleteUnitMarker);

// Check if there any civilians left
if (count GVAR(civilians) isEqualTo 0) then {
    [QEGVAR(score,allCiviliansDead)] call CBA_fnc_serverEvent;
};

private _time = [daytime] call BIS_fnc_timeToString;
// Call function to create marker at killed unit's position.
[_civilian, _time] call FUNC(civilianKilledMarker);
// Show message for all cops that cop has been killed near some location with timestamp
private _msg = [_civilian, _time] call FUNC(civilianKilledMsg);
[QEGVAR(police,showMsg), [_msg]] call CBA_fnc_globalEvent;

// Killer can be vehicle sometimes so get driver
_killer = driver _killer;
// If killer was police, we need to change score accordingly
if (side _killer isEqualTo WEST) then {
    [QEGVAR(score,changeScore), [EAST, EGVAR(score,policekilledCivilianKillersScore), "CIVILIAN KILLED BY COP PLACEHOLDER"]] call CBA_fnc_serverEvent;
    [QEGVAR(score,changeScore), [WEST, EGVAR(score,policeKilledCivilianPoliceScore), "CIVILIAN KILLED BY COP PLACEHOLDER"]] call CBA_fnc_serverEvent;
} else {
    [QEGVAR(score,changeScore), [EAST, EGVAR(score,killedCivilianKillersScore), "CIVILIAN KILLED PLACEHOLDER"]] call CBA_fnc_serverEvent;
    [QEGVAR(score,changeScore), [WEST, EGVAR(score,killedCivilianPoliceScore), "CIVILIAN KILLED PLACEHOLDER"]] call CBA_fnc_serverEvent;
};
