#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function orders group to move into group's vehicle.
 *
 * Arguments:
 * 0: Group to assign get in order <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group bob] call afsk_civilian_statemachine_fnc_moveToVehicle
 *
 * Public: No
 */

params ["_group"];

private _vehicle = [_group] call FUNC(getNearestVehicle);

if (isNull _vehicle) exitWith {};

private _waypoint = _group addWaypoint [_vehicle, 0];
_waypoint waypointAttachVehicle _vehicle;
_waypoint setWaypointType "GETIN";

TRACE_2("Group %1 getting in a vehicle %2", _group, _vehicle);
