#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function starts marker decay loop with given time (in minutes) to decay by half.
 * If an object is passed, it's assigned marker is retrieved.
 *
 * Arguments:
 * 0: Object or marker <OBJECT/STRING>
 * 1: Time to decay by half (in minutes) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["my_marker"] call afsk_common_fnc_markerDecay
 *
 * Public: No
 */

params ["_unitOrMarker", ["_decayHalfTime", 10], ["_local", false]];

// How much decay will be applied every 15 seconds
private _decayRate = 1/(_decayHalfTime * 4 * 2);
private _currentAlpha = markerAlpha _marker;

private _marker = if (_unitOrMarker isEqualType objNull) then {
    _unitOrMarker getVariable [QGVAR(marker), ""]
} else {
    _unitOrMarker
};

if (_marker isEqualTo "") exitWith {};

[_marker, _decayRate, _currentAlpha, _local] call FUNC(markerDecayLoop);
