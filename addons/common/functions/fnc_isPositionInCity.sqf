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
 * [position player] call afsk_common_fnc_isPositionInCity
 *
 * Public: No
 */

params ["_position", ["_location", locationNull]];

if (_position isEqualType objNull) then {
    _position = getPos _position;
};

if (_location isEqualTo locationNull) then {
    _location = [_position] call FUNC(getNearestCityLocation);
};

private _fnc_getMaxSizeForLocationByType = {
    params ["_location"];

    switch (type _location) do {
        case "NameCityCapital": {750};
        case "NameCity": {500};
        default {250};
    };
};

_position inArea _location
    || {_position distance getPos _location < ([_location] call _fnc_getMaxSizeForLocationByType)};
