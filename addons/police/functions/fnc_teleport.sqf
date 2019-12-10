#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles teleportation request to any police station.
 *
 * Arguments:
 * 0: Teleporter <OBJECT>
 * 1: Unit requesting teleportation <OBJECT>
 * 2: Teleport destination <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, bob] call afsk_police_fnc_teleport
 *
 * Public: No
 */

params ["_teleporter", "_caller", "_destination"];

if !(side _caller isEqualTo WEST) exitWith {
    [GVAR(policeStationAlarm), [_teleporter]] call CBA_fnc_serverEvent;
};

_caller setPos (getPos _destination);
