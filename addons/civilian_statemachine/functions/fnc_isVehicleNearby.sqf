#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if there is any vehicle near given group.
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * 0: Is any vehicle nearby
 *
 * Example:
 * [group player] call afsk_civilian_statemachine_fnc_isVehicleNearby
 *
 * Public: No
 */

params ["_group"];

!(([_group] call FUNC(getNearestVehicle)) isEqualTo objNull)
