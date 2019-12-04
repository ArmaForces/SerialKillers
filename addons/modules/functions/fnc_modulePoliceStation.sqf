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
 * [_module] call afsk_modules_fnc_modulePoliceStation
 *
 * Public: No
 */

params ["_logic"];

GVAR(policeStations) pushBack _logic;
