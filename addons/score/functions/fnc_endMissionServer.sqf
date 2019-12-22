#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function ends scenario on server.
 *
 * Arguments:
 * 0: End type <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call afsk_score_fnc_endMissionServer
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

    };
    // 1
    case KILLERS_DEAD: {

    };
    // 2
    case MAXIMUM_TIMEOUT_REACHED: {

    };
    // 3
    case TIME_LIMIT_REACHED: {

    };
    default {

    };
};

[QGVAR(emptyEnd), true] call BIS_fnc_endMission;
