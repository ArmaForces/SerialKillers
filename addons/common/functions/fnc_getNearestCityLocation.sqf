#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest map location of city type for given position/unit.
 *
 * Arguments:
 * 0: Unit/position to find nearest city location <UNIT/POSITION/LOCATION>
 *
 * Return Value:
 * 0: Nearest city location <LOCATION>
 *
 * Example:
 * [player] call afsk_common_fnc_getNearestCityLocation
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

// Get nearest locations to object.
private _towns = nearestLocations [_pos, ["NameVillage", "NameCity", "NameCityCapital"], _searchRadius];

#define GET_NEAREST_LOCATION _towns param [0, locationNull]
TRACE_2("Nearest location for pos: %1 is location: %2", _pos, GET_NEAREST_LOCATION);

// Select nearest location from array.
_towns param [0, locationNull]
