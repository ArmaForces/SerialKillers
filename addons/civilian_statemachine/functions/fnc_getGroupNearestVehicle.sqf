#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest group's owned vehicle.
 *
 * Arguments:
 * 0: Group which nearest owned vehicle will be returned <GROUP>
 *
 * Return Value:
 * 0: Nearest vehicle <OBJECT>
 *
 * Example:
 * [group bob] call afsk_civilian_statemachine_fnc_getGroupNearestVehicle
 *
 * Public: No
 */

params ["_group"];

private _groupVehicles = [_group] call FUNC(getGroupVehicles);

[_groupVehicles, leader _group] call BIS_fnc_nearestPosition
