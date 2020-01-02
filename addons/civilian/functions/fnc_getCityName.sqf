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
 * [[player] call afsk_common_getNearestLocation] call afsk_civilian_fnc_getCityName
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

// Get logic assigned location
private _location = _city getVariable [QGVAR(Location), [_city] call EFUNC(common,getNearestLocation)];
if (_location isEqualTo locationNull) exitWith {""};

// Get location name from config and save as logic variable for future calls
_name = getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> className _location >> "name");
_city setVariable [QGVAR(Name), _name];

_name
