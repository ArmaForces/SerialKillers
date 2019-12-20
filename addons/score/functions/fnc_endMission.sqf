#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function end scenario.
 *
 * Arguments:
 * 0: End type <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call afsk_score_fnc_endMission
 *
 * Public: No
 */

params ["_endType"];

switch (_endType) do {
    // 0
    case KILLERS_SCORE_REACHED: {
        QGVAR(killersScoreReached) call BIS_fnc_endMissionServer;
    };
    // 1
    case KILLERS_DEAD: {
        QGVAR(killersDead) call BIS_fnc_endMissionServer;
    };
    // 2
    case MAXIMUM_TIMEOUT_REACHED: {
        QGVAR(timeoutLimit) call BIS_fnc_endMissionServer;
    };
    default {
        "SideScore" call BIS_fnc_endMissionServer;
    };
};


