#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates marker for given cop.
 *
 * Arguments:
 * 0: Unit to create marker for <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_markers_fnc_createCopMarker
 *
 * Public: No
 */

params ["_cop"];

private _marker = format["cop_%1", name _cop];
createMarkerLocal [_marker, getPos _cop];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerSizeLocal [0.5, 0.5];
_marker setMarkerColorLocal "ColorWEST";
_marker setMarkerTextLocal (name _cop);
_cop setVariable [QGVAR(marker), _marker];
