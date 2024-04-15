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

params ["_marker", "_decayRate", ["_previousAlpha", -1], ["_local", false]];

private _currentAlpha = markerAlpha _marker;

if (_currentAlpha isNotEqualTo _previousAlpha && {_previousAlpha isNotEqualTo -1}) exitWith {};
if (_currentAlpha <= _decayRate) exitWith {deleteMarker _marker};

private _newAlpha = (_currentAlpha - _decayRate);

if (_local) then {
    _marker setMarkerAlphaLocal _newAlpha;
} else {
    _marker setMarkerAlpha _newAlpha;
};

[FUNC(markerDecayLoop), [_marker, _decayRate, _newAlpha, _local], 15] call CBA_fnc_waitAndExecute;
