#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function starts marker decay loop with given time (in minutes) to decay by half.
 *
 * Arguments:
 * 0: Marker <STRING>
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

params ["_marker", ["_decayHalfTime", 10], ["_local", false]];

// How much decay will be applied every 15 seconds
private _decayRate = 1/(_decayHalfTime * 4 * 2);

[_marker, _decayRate, _local] call FUNC(markerDecayLoop);
