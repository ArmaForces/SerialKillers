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
[EAST, _scoreChange] call BIS_fnc_respawnTickets;

GVAR(killersScoreChange) = GVAR(killersScoreChange) + _scoreChange;
[{
    if (GVAR(killersScoreChange) isEqualTo (_this select 0)) then {
        GVAR(killersScoreChange) = 0;
    };
}, [GVAR(killersScoreChange)], 5] call CBA_fnc_waitAndExecute;

[_reason] call FUNC(showScore);
