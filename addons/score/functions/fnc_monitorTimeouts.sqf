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

if (GVAR(killersScoreChange) isEqualTo 0) then {
    private _isExtraTime = GVAR(isExtraTime);

    [{GVAR(killersScoreChange) > 0 || {(_this select 0) isNotEqualTo GVAR(isExtraTime)}}, {
        // Killers managed to increase their score within time limit
        // Or extra time has started and we need to restart to adjust for new rules.
        call FUNC(monitorTimeouts);
    }, [_isExtraTime], GVAR(idleTimeMax), {
        // Killers failed to increase their score within time limit
        GVAR(idleTimeouts) = GVAR(idleTimeouts) + 1;
        private _msg = [LSTRING(IdleTime_TimeoutReached), GVAR(idleTimeouts), GVAR(idleTimeoutsMax)];
        [QGVAR(changeScore), [EAST, GVAR(idleTimeKillersScoreChange), _msg]] call CBA_fnc_serverEvent;
        [QGVAR(changeScore), [WEST, GVAR(idleTimePoliceScoreChange), _msg]] call CBA_fnc_serverEvent;
        call FUNC(monitorTimeouts);
    }] call CBA_fnc_waitUntilAndExecute;
} else {
    [{GVAR(killersScoreChange) isEqualTo 0}, {
        // Killers no longer increase their score
        call FUNC(monitorTimeouts);
    }] call CBA_fnc_waitUntilAndExecute;
};
