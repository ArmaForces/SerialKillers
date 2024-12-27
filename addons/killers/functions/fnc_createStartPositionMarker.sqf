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

private _marker = createMarkerLocal [_name, _pos];
_marker setMarkerColorLocal "ColorEAST";
_marker setMarkerSizeLocal [0.5,0.5];
_marker setMarkerTypeLocal "mil_end";
_marker setMarkerTextLocal _name;
GVAR(startPositionsMarkers) pushBack _marker;

_marker
