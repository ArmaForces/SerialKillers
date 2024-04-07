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

private _locationName = _module getVariable ["LocationName", ""];
if (_locationName isEqualTo "") then {
    private _nearestLocation = [_module] call EFUNC(common,getNearestLocationWithAvailableName);
    _locationName = [_nearestLocation] call EFUNC(common,getLocationNameRaw);
    _module setVariable ["LocationName", _locationName];

    LOG_1("Police station named automatically: '%1'",_locationName);
} else {
    LOG_1("Police station has forced name: '%1'",_locationName);
};
