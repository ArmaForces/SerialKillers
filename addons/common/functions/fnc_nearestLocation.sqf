#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest map location for given position/unit.
 *
 * Arguments:
 * 0: Unit/position to find nearest map location <UNIT/POSITION>
 *
 * Return Value:
 * 0: Nearest map location <LOCATION>
 *
 * Example:
 * [player] call afsk_common_fnc_nearestLocation
 *
 * Public: No
 */

params ["_pos", ["_searchRadius", 2000]];

if (_pos isEqualType objNull) then {
    _pos = getPosATL _pos;
};

// Get nearest locations to object.
private _towns = nearestLocations [_pos, ["NameVillage", "NameCity", "NameCityCapital"], _searchRadius];
// Select nearest location from array.
_towns param [0, locationNull]
