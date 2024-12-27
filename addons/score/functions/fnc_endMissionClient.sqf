#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function ends scenario on client.
 *
 * Arguments:
 * 0: End type <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call afsk_score_fnc_endMissionClient
 *
 * Public: No
 */

params ["_endType"];

// Check if mission has already ended to prevent triggering multiple times
if !(GVAR(missionEnd) isEqualTo -1) exitWith {};
GVAR(missionEnd) = _endType;

switch (_endType) do {
    // 0
    case KILLERS_SCORE_REACHED: {
        private _win = [false, true] select (playerSide isEqualTo EAST);
        [QGVAR(killersScoreReached), _win, nil, false] call BIS_fnc_endMission;
    };
    // 1
    case KILLERS_DEAD: {
        private _win = [false, true] select (playerSide isEqualTo WEST);
        [QGVAR(killersDead), _win, nil, false] call BIS_fnc_endMission;
    };
    // 2
    case MAXIMUM_TIMEOUT_REACHED: {
        private _win = [false, true] select (playerSide isEqualTo WEST);
        [QGVAR(timeoutLimit), _win, nil, false] call BIS_fnc_endMission;
    };
    // 3
    case TIME_LIMIT_REACHED: {
        private _win = [false, true] select (playerSide isEqualTo WEST);
        [QGVAR(timeLimit), _win, nil, false] call BIS_fnc_endMission;
    };
    // 4
    case ALL_CIVILIANS_DEAD: {
        private _win = [false, true] select (playerSide isEqualTo EAST);
        [QGVAR(civiliansDead), _win, nil, false] call BIS_fnc_endMission;
    };
    default {
        [QGVAR(emptyEnd), true] call BIS_fnc_endMission;
    };
};
