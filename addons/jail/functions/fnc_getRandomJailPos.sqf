#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns random position in jail
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Random position in jail <POSITION>
 *
 * Example:
 * call afsk_jail_fnc_getRandomJailPos
 *
 * Public: No
 */

[[GVAR(jail) getVariable "objectArea"], ["water"]] call BIS_fnc_randomPos;
