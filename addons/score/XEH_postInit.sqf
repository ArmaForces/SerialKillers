#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (isServer) then {
    /* Serverside events */
    [QGVAR(allCiviliansDead), {
        [QGVAR(endMission), [ALL_CIVILIANS_DEAD]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(endMission), {
        _this call FUNC(endMissionServer);
    }] call CBA_fnc_addEventHandler;

    // All killers killed or in custody
    [QGVAR(killersKilled), {
        [QGVAR(endMission), [KILLERS_DEAD]] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;

    // Killers have reached their goal
    [QGVAR(killersScoreReached), {
        [QGVAR(endMission), [KILLERS_SCORE_REACHED]] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(changeScore), {
        params ["_side", "_change", ["_reason", ""]];
        if (_side isEqualTo WEST) then {
            [_change, _reason] call FUNC(addPoliceScore);
        } else {
            [_change, _reason] call FUNC(addKillersScore);
        };
        [QGVAR(scoreChanged), _this] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;

    /* Serverside score logic init */
    // Idle timeout init
    if (GVAR(idleTimeMax) isEqualTo -1) exitWith {};
    [{
        [QGVAR(showTimeoutInitialMessage)] call CBA_fnc_globalEvent;
        call FUNC(monitorTimeouts);
    }, [], GVAR(idleTimeMax)] call CBA_fnc_waitAndExecute;

    // Initialize score display UI
    [WEST, 0] call BIS_fnc_respawnTickets;
    [EAST, 0] call BIS_fnc_respawnTickets;
};

[QGVAR(scoreChanged), {
    params ["_side", "_change", ["_reason", ""]];
    [QGVAR(showScore), [_reason]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;


if (hasInterface) then {
    /* Clientside events */
    [QGVAR(endMission), {
        _this call FUNC(endMissionClient);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showScore), {
        _this call FUNC(showScore);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showTimeoutInitialMessage), {
        private _msg = composeText [
            text format [LLSTRING(IdleTime_Inital_Message), (GVAR(IdleTimeMax) / 60)],
            lineBreak,
            lineBreak,
            text format ["%1: %2", LELSTRING(killers,Killers), GVAR(idleTimeKillersScoreChange)],
            lineBreak,
            text format ["%1: %2", LELSTRING(police,Police), GVAR(idleTimePoliceScoreChange)]
        ];
        _msg setAttributes ["valign", "middle"];
        [QEGVAR(common,showMessage), [_msg, [3]]] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;

    // Disable vanilla ratings
    player addEventHandler ["HandleRating", { 0 }];
};
