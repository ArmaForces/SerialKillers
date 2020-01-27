#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates EAST respawn marker in jail
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

EGVAR(killers,respawnMarker) = createMarker ["respawn_east", getMarkerPos QGVAR(jailMarker)];
