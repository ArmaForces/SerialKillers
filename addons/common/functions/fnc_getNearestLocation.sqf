#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest map location for given position/unit.
 *
 * Arguments:
 * 0: Unit/position to find nearest map location <UNIT/POSITION/LOCATION>
 *
 * Return Value:
 * 0: Nearest map location <LOCATION>
 *
 * Example:
 * [player] call afsk_common_fnc_getNearestLocation
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
private _towns = getNearestLocations [_pos, ["NameVillage", "NameCity", "NameCityCapital"], _searchRadius];
diag_log format ["[AFSK] [COMMON] [getNearestLocation] Pos: %1, Town: %2", _pos, _towns param [0, locationNull]];
// Select nearest location from array.
_towns param [0, locationNull]
