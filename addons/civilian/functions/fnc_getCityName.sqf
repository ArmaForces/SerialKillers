#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns city name.
 *
 * Arguments:
 * 0: City logic or location <LOGIC/LOCATION>
 *
 * Return Value:
 * 0: City name <STRING>
 *
 * Example:
 * [[player] call afsk_common_nearestLocation] call afsk_civilian_fnc_getCityName
 *
 * Public: No
 */

params ["_city"];

// If given param is location, get city logic
if (_city isEqualType locationNull) then {
    _city = [_city] call FUNC(getNearestCity);
};

// Check if logic has name assigned
private _name = _city getVariable ["Name", ""];
if !(_name isEqualTo "") exitWith {_name};

// Get logic assigned location
private _location = _city getVariable ["Location", [_city] call EFUNC(common,nearestLocation)];
if (_location isEqualTo locationNull) exitWith {""};

// Get location name from config and save as logic variable for future calls
_name = getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> className _city >> "name");
_city setVariable ["Name", _name];

_name
