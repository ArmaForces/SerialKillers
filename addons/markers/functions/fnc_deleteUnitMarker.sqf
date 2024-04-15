#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function schedules deletion of the unit marker.
 * This is done in that way to avoid leaking information via disappearing markers outside of refresh frame.
 *
 * Arguments:
 * 0: Unit to remove it's marker <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_markers_fnc_deleteUnitMarker
 *
 * Public: No
 */

params ["_unit"];

private _marker = _unit getVariable [QGVAR(marker), ""];
GVAR(markersToDelete) pushBack _marker;
_unit setVariable [QGVAR(marker), nil];
