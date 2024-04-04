#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates police station marker on given position with given name.
 *
 * Arguments:
 * 0: Police station name <STRING>
 * 1: Police station position <POSITION>
 *
 * Return Value:
 * 0: Police station marker <STRING>
 *
 * Example:
 * ["Player", getPosATL player] call afsk_police_fnc_policeStationMarker
 *
 * Public: No
 */

params ["_baseName", "_basePos"];

private _markerName = format ["policeStation_%1", _baseName];
private _markerText = format ["%1", _baseName];
private _marker = createMarkerLocal [_markerName, _basePos];
_marker setMarkerTypeLocal "mil_flag";
_marker setMarkerColorLocal "ColorWEST";
_marker setMarkerText _markerText;

_marker
