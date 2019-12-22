#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates marker for given civilian.
 *
 * Arguments:
 * 0: Unit to create marker for <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_markers_fnc_createCivilianMarker
 *
 * Public: No
 */

params ["_civilian"];

private _marker = format["civilian_%1", _civilian];
createMarkerLocal [_marker, getPos _civilian];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerSizeLocal [0.5, 0.5];
_marker setMarkerColorLocal "ColorGreen";
_civilian setVariable [QGVAR(marker), _marker];
