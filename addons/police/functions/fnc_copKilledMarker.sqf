#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates marker on cop's death position and handles marker decay.
 *
 * Arguments:
 * 0: Killed unit <OBJECT>
 * 1: Unit killed time hh:mm:ss <STRING>
 *
 * Return Value:
 * 0: Created marker <STRING>
 *
 * Example:
 * [player, "08:09:10"] call afsk_police_fnc_copKilledMarker
 *
 * Public: No
 */

params ["_unit", "_time"];

private _markerName = format ["killed_cop_%1_%2", _unit, serverTime];
private _markerText = format ["%1", _time];
private _marker = createMarkerLocal [_markerName, getPosATL _unit];
_marker setMarkerTypeLocal "mil_objective";
_marker setMarkerColorLocal "ColorWEST";
_marker setMarkerSizeLocal [0.4, 0.4];
_marker setMarkerText _markerText;

[_marker] call EFUNC(markers,markerDecay);

_marker
