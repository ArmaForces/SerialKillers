#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if there is any house nearby.
 *
 * Arguments:
 * 0: Position to check <POSITION>
 *
 * Return Value:
 * 0: Result <BOOL>
 *
 * Example:
 * [position player] call afsk_common_fnc_isHouseNearby
 *
 * Public: No
 */

params ["_position"];

private _houses = nearestTerrainObjects [_position, ["House"], 50, false];

[true, false] select (_houses isEqualTo [])
