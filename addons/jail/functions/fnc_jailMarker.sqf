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

private _markerText = format ["%1", LSTRING(Jail)];
private _marker = createMarker ["jail", getPos GVAR(jail)];
_marker setMarkerType "mil_end";
_marker setMarkerColor "ColorEAST";
_marker setMarkerText _markerText;

_marker
