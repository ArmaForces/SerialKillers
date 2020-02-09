#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns name of nearest map location for given position/unit.
 *
 * Arguments:
 * 0: Object/position to find nearest map location name <OBJECT/POSITION/LOCATION>
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

params ["_pos", ["_searchRadius", 2000]];

if (_pos isEqualType locationNull) then {
    _pos = position _pos;
};

if (_pos isEqualType objNull) then {
    _pos = getPosATL _pos;
};

// Get nearest location
private _nearestLocation = [_pos, _searchRadius] call FUNC(getNearestLocationWithAvailableName);
if (_nearestLocation isEqualTo locationNull) exitWith {""};

[_nearestLocation] call FUNC(getLocationName);
