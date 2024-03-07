#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest vehicle for given group
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afsk_main_fnc_example
 *
 * Public: No
 */

#define DEFAULT_SEARCH_RADIUS 500

params ["_group"];

private _filterFunction = {
    params ["_vehicle"];

    if (_vehicle getVariable [QEGVAR(police,isPoliceVehicle), false]) exitWith { false };
    // TODO: Optionally filter for blacklisted areas

    true
};

[position leader _group, DEFAULT_SEARCH_RADIUS, _filterFunction] call EFUNC(civilian,getNearestVehicle);
