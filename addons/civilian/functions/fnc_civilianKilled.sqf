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
