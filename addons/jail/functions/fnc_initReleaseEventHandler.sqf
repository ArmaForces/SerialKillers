#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes release event handler(s).
 * Exact implementation is selected depending on ACE being loaded.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_jail_fnc_initReleaseEventHandler
 *
 * Public: No
 */

if (EGVAR(common,ACE_Loaded)) then {
    call FUNC(initAceHandcuffed);
} else {
    call FUNC(initReleaseAction);
};
