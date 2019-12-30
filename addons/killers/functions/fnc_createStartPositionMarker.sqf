#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates markers for given killers start position module.
 *
 * Arguments:
 * 0: Killers start position module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_module"];

private _moduleLocationName = _module getVariable ["LocationName", "Teleport"];
private _marker = createMarkerlocal [_moduleLocationName, getPos _module];
_marker setMarkerColorlocal "ColorEAST";
_marker setMarkerSizelocal [0.5,0.5];
_marker setMarkerTypelocal "mil_end";
_marker setMarkerTextLocal _moduleLocationName;
GVAR(killersStartPositionsMarkers) pushback _marker;
