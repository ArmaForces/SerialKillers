#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks whether given unit is a cop.
 *
 * Arguments:
 * 0: Unit <OBJECT>
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

_unit getVariable [QEGVAR(common,side), CIVILIAN] isEqualTo WEST
