#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates marker for given killers start position.
 *
 * Arguments:
 * 0: Start position <POSITION>
 * 1: Position nearest location name <STRING>
 *
 * Return Value:
 * 0: Created marker <STRING>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_pos", ["_name", ""]];

if (_name isEqualTo "") then {
    _name = [_pos] call EFUNC(common,getNearestLocationName);
};

private _marker = createMarkerlocal [_name, _pos];
_marker setMarkerColorlocal "ColorEAST";
_marker setMarkerSizelocal [0.5,0.5];
_marker setMarkerTypelocal "mil_end";
_marker setMarkerTextLocal _name;
GVAR(killersStartPositionsMarkers) pushback _marker;

_marker
