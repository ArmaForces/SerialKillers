#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates or updates marker for given killer.
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

private _marker = _killer getVariable [QGVAR(marker), ""];

if (_marker isEqualTo "") then {
    _marker = [_killer, _hidden] call FUNC(createKillerMarker);
} else {
    _marker setMarkerPosLocal (position _killer);

    if (_hidden) then {
        _marker setMarkerColorLocal "ColorGreen";
    } else {
        _marker setMarkerColorLocal "ColorRed";
    };
};
