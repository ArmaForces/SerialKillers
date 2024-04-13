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

if (GVAR(timeLimit) isEqualTo -1) exitWith {
    INFO("Time limit is disabled");
};

[{
    // Instant end
    if (GVAR(timeLimitInstantEnd)) exitWith {
        INFO("Time limit reached, extra time is disabled, ending mission");
        [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
    };

    GVAR(isExtraTime) = true;

    // Adjust rules
    GVAR(idleTimeMax) = GVAR(timeLimitIdleTime);
    GVAR(idleTimeouts) = 0;
    GVAR(idleTimeoutsMax) = GVAR(timeLimitIdleTimeoutsMax);

    // Extra time countdown if enabled
    if (GVAR(timeLimitExtraTime) isNotEqualTo -1) exitWith {
        [{
            INFO("Extra time limit reached");
            [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
        }, [], (GVAR(timeLimitExtraTime) * 60)] call CBA_fnc_waitAndExecute;

        INFO_1("Extra time limit of %1 minutes has started",GVAR(timeLimitExtraTime) * 60);
    };

    INFO("No extra time limit, changed rules apply");
}, [], (GVAR(timeLimit) * 60)] call CBA_fnc_waitAndExecute;

INFO_1("Enabled time limit of %1 minutes",GVAR(timeLimit) * 60);
