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

// Create spectator for killer so he won't get bored when he's dead or imprisoned.
[QEGVAR(common,initializeSpectator), [], _unit] call CBA_fnc_targetEvent;
