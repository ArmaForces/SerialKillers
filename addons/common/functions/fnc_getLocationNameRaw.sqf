#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns location name from config.
 *
 * Arguments:
 * 0: Location <LOCATION>
 *
 * Return Value:
 * 0: Location name <STRING>
 *
 * Example:
 * [[player] call afsk_common_fnc_getNearestLocation] call afsk_common_fnc_getLocationName
 *
 * Public: No
 */

params ["_location"];

private _locationClassname = if (_location isEqualType locationNull) then {
    className _location;
} else {
    _location
};

// Location does not have classname so no name also
if (_locationClassname isEqualTo "") exitWith {""};

// Try to get name from cache
private _name = GVAR(locationNames) getVariable [_locationClassname, ""];

if (_name isEqualTo "") then {
    _name = getTextRaw (configFile >> "CfgWorlds" >> worldName >> "Names" >> _locationClassname >> "name");
    // Fill cache
    GVAR(locationNames) setVariable [_locationClassname, _name];
};

_name
