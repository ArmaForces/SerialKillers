#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes police station modules.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * List of police station modules <ARRAY<OBJECT>>
 *
 * Example:
 * None
 *
 * Public: No
 */

private _policeStationModules = entities QGVAR(modulePoliceStation);

{
    [_x] call FUNC(modulePoliceStation);
} forEach _policeStationModules;

_policeStationModules
