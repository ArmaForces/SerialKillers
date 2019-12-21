#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates marker for given killer.
 *
 * Arguments:
 * 0: Unit to create marker for <OBJECT>
 * 1: Is it hide marker? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_markers_fnc_createKillerMarker
 *
 * Public: No
 */

params ["_killer", ["_hidden", false]];

private _marker = format["civilian_%1", _killer];
createMarkerLocal [_marker, getPos _killer];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerSizeLocal [0.5, 0.5];
if (_hidden) then {
    _marker setMarkerColorLocal "ColorGreen";
} else {
    _marker setMarkerColorLocal "ColorEAST";
    _marker setMarkerTextLocal (name _killer);
};
_killer setVariable [QGVAR(marker), _marker];
