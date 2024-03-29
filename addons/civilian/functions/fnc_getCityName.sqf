#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns city name.
 *
 * Arguments:
 * 0: City namespace or location <CBA_NAMESPACE/LOCATION>
 *
 * Return Value:
 * 0: City name <STRING>
 *
 * Example:
 * [[player] call afsk_common_getNearestCityLocation] call afsk_civilian_fnc_getCityName
 *
 * Public: No
 */

params ["_city"];

// If given param is location, return name from config
if (_city isEqualType locationNull) exitWith {
    getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> className _city >> "name");
};

// Check if namespace has name assigned
private _name = _city getVariable [QGVAR(Name), ""];
if !(_name isEqualTo "") exitWith {_name};

// Get logic assigned location class name
private _locationClassName = _city getVariable [QGVAR(locationClassName),
    className ([_city] call EFUNC(common,getNearestCityLocation))];

if (_locationClassName isEqualTo "") exitWith {""};

// Get location name from config and save as logic variable for future calls
_name = getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> _locationClassName >> "name");
_city setVariable [QGVAR(Name), _name];

_name
