#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function makes civilian group walk randomly.
 *
 * Arguments:
 * 0: Idle civilian group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_group"];

// Add waypoint
private _leader = leader _group;
private _waypoint = _group addWaypoint [position _leader, 0];

// Randomize waypoint position
private _nearestCity = [_leader, 500] call FUNC(getNearestCity);
if (random 1 > 0.75 || {_nearestCity isEqualTo objNull}) then {
    _waypoint setWaypointPosition [[[[_leader, 500]]] call BIS_fnc_randomPos, 0];
} else {
    _waypoint setWaypointPosition [[_nearestCity, typeOf _leader, true, false, true] call FUNC(getCityRandomPos), 0];
};
