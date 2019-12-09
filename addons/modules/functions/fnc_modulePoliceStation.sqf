#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds police station module to police stations list.
 *
 * Arguments:
 * 0: Police station module <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_logic"];

GVAR(policeStations) pushBack _logic;
