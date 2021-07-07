#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates markers for all killers stashes.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

{
    private _marker = createMarkerlocal [str _x, getPos _x];
    _marker setMarkerColorlocal "ColorEAST";
    _marker setMarkerSizelocal [0.5,0.5];
    _marker setMarkerTypelocal "mil_pickup";
    _x setVariable [QGVAR(marker), _marker];
} forEach GVAR(stashes);
