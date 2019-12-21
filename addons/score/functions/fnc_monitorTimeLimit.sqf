#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if maximum mission time is reached.
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_score_fnc_monitorTimeLimit
 *
 * Public: No
 */

[{
    if (GVAR(timeLimitInstantEnd)) exitWith {
        [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
    };
    // Adjust rules
    GVAR(idleTimeMax) = GVAR(timeLimitIdleTime);
    GVAR(idleTimeouts) = 0;
    GVAR(idleTimeoutsMax) = GVAR(timeLimitIdleTimeoutsMax);
    [{
        [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
    }, [], (GVAR(timeLimitExtraTime) * 60)] call CBA_fnc_waitAndExecute;
}, [], (GVAR(timeLimit) * 60)] call CBA_fnc_waitAndExecute;
