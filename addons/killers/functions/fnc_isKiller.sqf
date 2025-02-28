#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if given unit is a killer.
 *
 * Arguments:
 * 0: Unit to check if it's a killer <OBJECT>
 *
 * Return Value:
 * True if unit is a killer <BOOL>
 *
 * Example:
 * [player] call afsk_killers_fnc_isKiller
 *
 * Public: No
 */

params ["_unit"];

_unit getVariable [QEGVAR(common,side), side _unit] isEqualTo EAST
