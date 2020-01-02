#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns city namespace for given location.
 *
 * Arguments:
 * 0: City location <LOCATION>
 *
 * Return Value:
 * 0: City namespace <CBA_NAMESPACE> or objNull if not found
 *
 * Example:
 * [[player] call afsk_common_fnc_getNearestLocation] call afsk_civilian_fnc_getCityByLocation
 *
 * Public: No
 */

params ["_cityLocation"];

GVAR(citiesLocations) getVariable [className _cityLocation, objNull]
