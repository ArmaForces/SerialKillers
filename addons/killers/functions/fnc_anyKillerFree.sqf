#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if any killer is free.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_killers_fnc_anyKillerFree
 *
 * Public: No
 */

if (EGVAR(common,ACE_Loaded)) then {
    allPlayers findIf {
        side _x isEqualTo EAST
        && {alive _x
        && {!(_x getVariable [QACEGVAR(captives,isHandcuffed), false])
    }}}!= -1
} else {
    allPlayers findIf {
        side _x isEqualTo EAST
        && {alive _x
        && {!(_x getVariable [QGVAR(jail,isImprisoned), false])
    }}}!= -1
};

