#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns all vehicles owned by group members.
 *
 * Arguments:
 * 0: Group to return it's vehicles <GROUP>
 *
 * Return Value:
 * 0: Group's owned vehicles <ARRAY>
 *
 * Example:
 * [group bob] call afsk_civilian_statemachine_fnc_getGroupVehicles
 *
 * Public: No
 */

params ["_group"];

// Get all group vehicles
private _groupVehicles = units _group apply {_x getVariable [QGVAR(ownedVehicle), objNull]} select {!isNull _x};
_groupVehicles arrayIntersect _groupVehicles // return
