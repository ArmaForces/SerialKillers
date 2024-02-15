#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function removes all killers start positions markers.
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
    deleteMarkerLocal _x;
} forEach GVAR(startPositionsMarkers);
GVAR(startPositionsMarkers) = [];
