#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates jail marker.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Jail marker name <STRING>
 *
 * Example:
 * call afsk_jail_fnc_jailMarker
 *
 * Public: No
 */

private _markerText = format ["%1", LLSTRING(Jail)];
private _marker = createMarker ["jail", getPosATL GVAR(jail)];
_marker setMarkerTypeLocal "mil_end";
_marker setMarkerColorLocal "ColorEAST";
_marker setMarkerText _markerText;

_marker
