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
    // Check if mission didn't end yet
    if (GVAR(missionEnd) isNotEqualTo -1) exitWith {};

    // Instant end
    if (GVAR(timeLimitInstantEnd)) exitWith {
        INFO("Time limit reached, extra time is disabled, ending mission");
        [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
    };

    GVAR(isExtraTime) = true;

    // Adjust rules
    call FUNC(extraTimeAdjustRules);

    // Extra time countdown if enabled
    if (GVAR(timeLimitExtraTime) isNotEqualTo -1) exitWith {
        private _extraTimeDurationInMinutes = GVAR(timeLimitExtraTime) * 60;

        [{
            INFO("Extra time limit reached");
            [QGVAR(endMission), [TIME_LIMIT_REACHED]] call CBA_fnc_globalEvent;
        }, [], _extraTimeDurationInMinutes] call CBA_fnc_waitAndExecute;

        INFO_1("Extra time limit of %1 minutes has started",_extraTimeDurationInMinutes);

        [QGVAR(showExtraTimeInitialMessage)] call CBA_fnc_globalEvent;
    };

    INFO("No extra time limit, changed rules apply");

    [QGVAR(showTimeoutInitialMessage)] call CBA_fnc_globalEvent;
}, [], (GVAR(timeLimit) * 60)] call CBA_fnc_waitAndExecute;

INFO_1("Enabled time limit of %1 minutes",GVAR(timeLimit) * 60);
