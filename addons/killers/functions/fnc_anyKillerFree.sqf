#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if any killer is free.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if any killer is still free <BOOL>
 *
 * Example:
 * call afsk_killers_fnc_anyKillerFree
 *
 * Public: No
 */

allPlayers findIf {
    side _x isEqualTo EAST
    && {alive _x
    && {!([_x] call EFUNC(jail,isHandcuffed))
}}} != -1

