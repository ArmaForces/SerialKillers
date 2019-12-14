#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes given city with module, civilians and vehicles.
 *
 * Arguments:
 * 0: City to initialize <CONFIG/LOCATION>
 *
 * Return Value:
 * 0: City logic <LOGIC>
 *
 * Example:
 * [[player] call afsk_common_fnc_nearestLocation] call afsk_common_fnc_initCity
 *
 * Public: No
 */

params ["_city"];

if (_city isEqualType configNull) then {
    _city = [getArray (_x >> 'position'), 10] call EFUNC(common,nearestLocation);
};

private _cityLogic = (createGroup sideLogic) createUnit ["LOGIC", position _city, [], 0, "CAN_COLLIDE"];
_cityLogic setVariable ["Location", _city, true];

private _citySize = [_city] call EFUNC(common,getLocationType);

// Init civilians
[_cityLogic, _citySize] call FUNC(initCityCivilians);

// Init vehicles
private _cityVehicles = [_cityLogic, _citySize] call FUNC(initCityVehicles);
private _cityVehiclesCount = count _cityVehicles;

_cityLogic
