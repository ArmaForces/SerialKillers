#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function orders group to leave vehicle.
 *
 * Arguments:
 * 0: Group to assign get out order <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group bob] call afsk_civilian_statemachine_fnc_getOut
 *
 * Public: No
 */

params ["_group"];

private _vehicle = vehicle leader _group;

if (isNull _vehicle) exitWith {};

private _waypoint = _group addWaypoint [_vehicle, 0];
_waypoint waypointAttachVehicle _vehicle;
_waypoint setWaypointType "GETOUT";

TRACE_2("Group %1 getting out of a vehicle %2",_group,_vehicle);
