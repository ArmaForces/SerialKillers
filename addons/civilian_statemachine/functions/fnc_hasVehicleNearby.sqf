#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if any unit from group has a vehicle nearby.
 *
 * Arguments:
 * 0: Checked group <GROUP>
 *
 * Return Value:
 * 0: Has vehicle nearby <BOOL>
 *
 * Example:
 * [group bob] call afsk_civilian_statemachine_fnc_hasVehicleNearby
 *
 * Public: No
 */

params ["_group"];

private _nearestVehicle = [_group] call FUNC(getGroupNearestVehicle);

((leader _group) distance (_nearestVehicle)) < VEHICLE_SEARCH_RADIUS
