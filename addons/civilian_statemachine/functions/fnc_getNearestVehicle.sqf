#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest vehicle for given group
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afsk_main_fnc_example
 *
 * Public: No
 */

params ["_group"];

[position leader _group] call EFUNC(civilian,getNearestVehicle);
