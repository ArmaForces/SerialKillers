#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function deletes unit marker.
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
deleteMarkerLocal _marker;
_unit setVariable [QGVAR(marker), nil];
