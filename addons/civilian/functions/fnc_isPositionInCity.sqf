#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if a unit/position is in a city.
 *
 * Arguments:
 * 0: Unit/Position to check <OBJECT/POSITION>
 * 1: Particular city location to check <LOCATION> (Optional)
 *
 * Return Value:
 * 0: Result <BOOL>
 *
 * Example:
 * [position player] call afsk_civilian_fnc_isPositionInCity
 *
 * Public: No
 */

params ["_position", ["_location", locationNull]];

if (_position isEqualType objNull) then {
    _position = getPosATL _position;
};

private _nearestCity = if (_location isEqualTo locationNull) then {
    [_position] call FUNC(getNearestCity)
} else {
    [_location] call FUNC(getCityByLocation)
};

private _nearestCityArea = _nearestCity getVariable QGVAR(cityArea);
_position inArea _nearestCityArea
