#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes given city with module and civilians.
 *
 * Arguments:
 * 0: City to initialize <CONFIG/LOCATION>
 *
 * Return Value:
 * 0: City namespace <CBA_NAMESPACE>
 *
 * Example:
 * [[player] call afsk_common_fnc_getNearestCityLocation] call afsk_common_fnc_initCity
 *
 * Public: No
 */

#define IS_CITY_RECTANGLE false

params ["_cityLocation"];

if (_cityLocation isEqualType configNull) then {
    _cityLocation = [getArray (_cityLocation >> 'position'), 10] call EFUNC(common,getNearestCityLocation);
};

private _cityLocationConfig = (configFile >> "CfgWorlds" >> worldName >> "Names" >> className _cityLocation);

// Create city namespace
private _cityNamespace = true call CBA_fnc_createNamespace;
GVAR(citiesLocations) setVariable [className _cityLocation, _cityNamespace, true];
_cityNamespace setVariable [QGVAR(Location), _cityLocation, true];
_cityNamespace setVariable [QGVAR(Name), [_cityLocation] call FUNC(getCityName), true];
private _cityType = [_cityLocation] call EFUNC(common,getLocationType);
_cityNamespace setVariable [QGVAR(cityType), _cityType, true];

// Set city position and area variables
private _cityPosition = (position _cityLocation);
_cityPosition set [2, 0]; // Location position has negative third coordinate
private _positionOffset = getArray (_cityLocationConfig >> 'positionOffset');
if (_positionOffset isNotEqualTo []) then {
    _cityPosition = _cityPosition vectorAdd _positionOffset;
};

_cityNamespace setVariable [QGVAR(Position), _cityPosition, true];

private _radiusA = getNumber (_cityLocationConfig >> 'radiusA');
private _radiusB = getNumber (_cityLocationConfig >> 'radiusB');
private _angle = getNumber (_cityLocationConfig >> 'angle');
private _cityArea = [_cityPosition, _radiusA, _radiusB, _angle, IS_CITY_RECTANGLE];
private _cityAreaForRandomPos = [_cityPosition, [_radiusA, _radiusB, _angle, IS_CITY_RECTANGLE]];
_cityNamespace setVariable [QGVAR(cityArea), _cityArea];
_cityNamespace setVariable [QGVAR(cityAreaForRandomPos), _cityAreaForRandomPos];

// Create city civilians variables
_cityNamespace setVariable [QGVAR(CiviliansList), []];
_cityNamespace setVariable [QGVAR(CiviliansCount), 0];
_cityNamespace setVariable [QGVAR(initialCiviliansCount), 0];

// Return
_cityNamespace
