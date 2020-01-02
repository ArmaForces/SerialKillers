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

GVAR(killersStartPositions) pushBack _module;

private _locationName = _module getVariable ["LocationName", ""];
if (_locationName isEqualTo "") then {
    _module setVariable ["LocationName", [_module] call EFUNC(common,getNearestLocationName)];
};
