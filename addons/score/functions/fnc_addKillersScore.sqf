#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function changes killers score by given amount.
 *
 * Arguments:
 * 0: Score change <NUMBER>
 * 1: Reason <STRING>
 *
 * Return Value:
 * 0: New score <NUMBER>
 *
 * Example:
 * [1] call afsk_score_fnc_addKillersScore
 *
 * Public: No
 */

params ["_scoreChange", ["_reason", ""]];

private _time = [daytime] call BIS_fnc_timeToString;

// Change killers score
GVAR(killersScore) = GVAR(killersScore) + _scoreChange;
publicVariable QGVAR(killersScore);

// For display purposes using properly set-up sector modules
[EAST, _scoreChange] call BIS_fnc_respawnTickets;

GVAR(killersScoreChange) = GVAR(killersScoreChange) + _scoreChange;
publicVariable QGVAR(killersScoreChange);
[{
    if (GVAR(killersScoreChange) isEqualTo (_this select 0)) then {
        GVAR(killersScoreChange) = 0;
        publicVariable QGVAR(killersScoreChange);
    };
}, [GVAR(killersScoreChange)], 5] call CBA_fnc_waitAndExecute;

// Check if killers have reached their goal
if (GVAR(killersScore) >= GVAR(killersScoreMax)) then {
    [QGVAR(killersScoreReached), [KILLERS_SCORE_REACHED]] call CBA_fnc_serverEvent;
};
