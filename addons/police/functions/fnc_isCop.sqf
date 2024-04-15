#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks whether given unit is a cop.
 *
 * Arguments:
 * 0: Unit to check if it's a cop <OBJECT>
 *
 * Return Value:
 * True if unit is a cop <BOOL>
 *
 * Example:
 * [player] call afsk_police_fnc_isCop
 *
 * Public: No
 */

params ["_unit"];

if (isNull _unit) exitWith { false };

_unit getVariable [QEGVAR(common,side), side _unit] isEqualTo WEST
