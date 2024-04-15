#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares message with idle time settings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Structured text message <TEXT>
 *
 * Example:
 * None
 *
 * Public: No
 */

private _idleTimeMaxAllowedMsg = [
    composeText [lineBreak, text format [LLSTRING(IdleTimeMaxAllowed), GVAR(idleTimeoutsMax)]],
    ""
] select (GVAR(idleTimeoutsMax) isEqualTo -1);

composeText [
    text format [LLSTRING(IdleTimeAllowed), GVAR(idleTimeMax)],
    _idleTimeMaxAllowedMsg,
    lineBreak,
    text LLSTRING(IdleTimeScoreChanges),
    lineBreak,
    text format ["%1: %2", LELSTRING(police,Police), GVAR(idleTimePoliceScoreChange)],
    lineBreak,
    text format ["%1: %2", LELSTRING(killers,Killers), GVAR(idleTimeKillersScoreChange)]
]
