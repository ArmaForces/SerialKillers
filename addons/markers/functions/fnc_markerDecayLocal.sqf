#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function starts local marker decay loop with given time (in minutes) to decay by half.
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
 * ["my_marker"] call afsk_common_fnc_markerDecayLocal
 *
 * Public: No
 */

params ["_unitOrMarker", ["_decayHalfTime", 10]];

[_unitOrMarker, _decayHalfTime, true] call FUNC(markerDecay);
