#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Loop handles marker decay every 15 seconds.
 *
 * Arguments:
 * 0: Decaying marker <STRING>
 * 1: Decay amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["my_marker", 0.1] call afsk_common_fnc_markerDecayLoop
 *
 * Public: No
 */

params ["_marker", "_decayRate", ["_local", false]];

private _currentAlpha = markerAlpha _marker;

if (_currentAlpha <= _decayRate) exitWith {deleteMarker _marker};

if (_local) then {
    _marker setMarkerAlphaLocal (_currentAlpha - _decayRate);
} else {
    _marker setMarkerAlpha (_currentAlpha - _decayRate);
};

[FUNC(markerDecayLoop), [_marker, _decayRate], 15] call CBA_fnc_waitAndExecute;
