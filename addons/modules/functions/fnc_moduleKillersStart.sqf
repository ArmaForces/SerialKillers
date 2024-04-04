#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds killers start module to killers start positions list.
 *
 * Arguments:
 * 0: Killers start module <OBJECT>
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
    private _nearestLocation = [_module] call EFUNC(common,getNearestLocation);
    _module setVariable ["LocationName", [_nearestLocation] call EFUNC(common,getLocationNameRaw)];
};
