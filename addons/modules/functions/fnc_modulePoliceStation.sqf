#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds police station module to police stations list.
 *
 * Arguments:
 * 0: Police station module <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_module"];

GVAR(policeStations) pushBack _module;

private _locationName = _module getVariable ["LocationName", ""];
if (_locationName isEqualTo "") then {
    _module setVariable ["LocationName", [_module] call EFUNC(common,getNearestLocationName), true];
};
