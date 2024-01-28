#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function changes police score by given amount.
 *
 * Arguments:
 * 0: Score change <NUMBER>
 * 1: Reason <STRING>
 *
 * Return Value:
 * 0: New score <NUMBER>
 *
 * Example:
 * [1] call afsk_score_fnc_addPoliceScore
 *
 * Public: No
 */

params ["_scoreChange", ["_reason", ""]];

private _time = [daytime] call BIS_fnc_timeToString;

// Change police score
GVAR(policeScore) = GVAR(policeScore) + _scoreChange;
publicVariable QGVAR(policeScore);

// For display purposes using properly set-up sector modules
[WEST, _scoreChange] call BIS_fnc_respawnTickets;

GVAR(policeScoreChange) = GVAR(policeScoreChange) + _scoreChange;
publicVariable QGVAR(policeScoreChange);

// Save change time
GVAR(policeScoreLastChangeTime) = CBA_missionTime;

[{
    if (GVAR(policeScoreChange) isEqualTo (_this select 0)) then {
        GVAR(policeScoreChange) = 0;
        publicVariable QGVAR(policeScoreChange);
    };
}, [GVAR(policeScoreChange)], 5] call CBA_fnc_waitAndExecute;
