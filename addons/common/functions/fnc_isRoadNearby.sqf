#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if there is any road nearby.
 *
 * Arguments:
 * 0: Position to check <POSITION>
 *
 * Return Value:
 * 0: Result <BOOL>
 *
 * Example:
 * [position player] call afsk_common_fnc_isRoadNearby
 *
 * Public: No
 */

params ["_position"];

private _roads = _position nearRoads 50;
if (_roads isEqualTo []) then {
    false
} else {
    true
};
