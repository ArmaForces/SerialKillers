#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function description
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

// Get random city
private _randomCity = selectRandom EGVAR(civilian,cities);
private _pos = [_randomCity, typeOf vehicle leader _group, true, false, true] call EFUNC(civilian,getCityRandomPos);

// Create waypoint
private _waypoint = _group addWaypoint [_pos, 0];
