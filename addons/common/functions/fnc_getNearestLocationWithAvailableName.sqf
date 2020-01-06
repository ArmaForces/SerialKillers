#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest map location which has available name for given position/unit.
 *
 * Arguments:
 * 0: Unit/position to find nearest map location with name <UNIT/POSITION/LOCATION>
 * 1: Location search radius
 *
 * Return Value:
 * 0: Nearest map available location with name <LOCATION>
 *
 * Example:
 * [player] call afsk_common_fnc_getNearestLocationWithAvailableName
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

// Get nearest locations
private _locations = nearestLocations [_pos, GVAR(allLocationTypes), _searchRadius];

// Loop through all locations and find nearest with name
private _location = locationNull;
{
    private _locationName = [_x] call FUNC(getLocationName);
    if (!(_locationName isEqualTo "")) exitWith {_location = _x};
} forEach _locations;

_location
