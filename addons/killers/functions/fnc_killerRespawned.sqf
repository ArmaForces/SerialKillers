#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles killed respawned event.
 *
 * Arguments:
 * 0: Respawned killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_killers_fnc_killerRespawned
 *
 * Public: No
 */

params ["_unit"];

INFO_1("Killer %1 has respawned",name _unit);

_unit setVariable [QGVAR(alreadyKilled), false];

[QEGVAR(jail,imprison), [_unit]] call CBA_fnc_serverEvent;
