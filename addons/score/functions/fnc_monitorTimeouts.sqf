#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if killers increased their score within idleTimeMax
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_score_fnc_monitorTimeouts
 *
 * Public: No
 */

if (GVAR(idleTimeoutsMax) isEqualTo -1 || {(GVAR(idleTimeMax)) <= 0}) exitWith {};

if (GVAR(idleTimeouts) >= GVAR(idleTimeoutsMax)) exitWith {
    // Killers lose
    [QGVAR(endMission), [MAXIMUM_TIMEOUT_REACHED]] call CBA_fnc_serverEvent;
};

[{GVAR(killersScoreChange) > 0}, {
    // Killers managed to increase their score within time limit
    GVAR(killersScoreLastChangeTime) = CBA_missionTime;
    call FUNC(monitorTimeouts);
}, [], GVAR(idleTimeMax), {
    // Killers failed to increase their score within time limit
    GVAR(killersScoreLastChangeTime) = CBA_missionTime;
    GVAR(policeScoreLastChangeTime) = CBA_missionTime;
    private _msg = format [LLSTRING(IdleTime_TimeoutReached), GVAR(idleTimeouts), GVAR(idleTimeoutsMax)];
    [QGVAR(scoreChanged), [WEST, 5, _msg]] call CBA_fnc_serverEvent;
}] call CBA_fnc_waitUntilAndExecute;
