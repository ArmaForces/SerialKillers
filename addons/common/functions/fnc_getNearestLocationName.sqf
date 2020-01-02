#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns name of nearest map location for given position/unit.
 *
 * Arguments:
 * 0: Unit/position to find nearest map location name <UNIT/POSITION/LOCATION>
 * 1: Location search radius
 *
 * Return Value:
 * 0: Nearest map location name <STRING>
 *
 * Example:
 * [player] call afsk_common_fnc_getNearestLocationName
 *
 * Public: No
 */

params ["_pos", ["_searchRadius", nil]];

// Get nearest location
private _nearestLocation = [_pos, _searchRadius] call FUNC(getNearestLocation);
if (_nearestLocation isEqualTo locationNull) exitWith {""};

name _nearestLocation
