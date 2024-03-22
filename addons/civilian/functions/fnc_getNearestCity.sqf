#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest city namespace for given unit/position.
 * If not available returns objNull
 *
 * Arguments:
 * 0: Object/position <OBJECT/POSITION>
 *
 * Return Value:
 * 0: Nearest city namespace <CBA_NAMESPACE> or objNull if not found
 *
 * Example:
 * [player] call afsk_civilian_fnc_getNearestCity
 *
 * Public: No
 */

params ["_position", ["_searchRadius", 2000]];

if (_position isEqualType objNull) then {
    _position = getPosATL _position;
};

// Find nearest city location
_nearestTown = [_position, _searchRadius] call EFUNC(common,getNearestCityLocation);

// Return city namespace or objNull if not found
if (_nearestTown isEqualTo locationNull) exitWith {objNull};
[_nearestTown] call FUNC(getCityByLocation);
