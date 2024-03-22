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

private _marker = format["killer_%1", name _killer];
createMarkerLocal [_marker, getPosATL _killer];
_marker setMarkerTypeLocal "mil_dot";

if (_hidden) then {
    _marker setMarkerColorLocal "ColorGreen";
} else {
    _marker setMarkerColorLocal "ColorEAST";
};

if (playerSide isEqualTo EAST) then {
    _marker setMarkerSizeLocal [0.75, 0.75];
    _marker setMarkerTextLocal (name _killer);
} else {
    _marker setMarkerSizeLocal [0.5, 0.5];
};

_killer setVariable [QGVAR(marker), _marker];
