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
    private _marker = createMarkerLocal [str _x, getPosATL _x];
    _marker setMarkerColorLocal "ColorEAST";
    _marker setMarkerSizeLocal [0.5,0.5];
    _marker setMarkerTypeLocal "mil_pickup";
    _x setVariable [QGVAR(marker), _marker];
} forEach GVAR(stashes);
