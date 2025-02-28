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

    [QGVAR(changeScore), FUNC(changeScore)] call CBA_fnc_addEventHandler;

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

    call FUNC(monitorTimeLimit);
};

[QGVAR(scoreChanged), {
    params ["_side", "_change", ["_reason", "", ["", []]]];
    [QGVAR(showScore), [_reason]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;


if (hasInterface) then {
    // Disable vanilla ratings
    player addEventHandler ["HandleRating", { 0 }];

    /* Clientside events */
    [QGVAR(endMission), {
        _this call FUNC(endMissionClient);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showScore), {
        _this call FUNC(showScore);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showTimeoutInitialMessage), {
        private _msg = composeText [
            text format [LLSTRING(IdleTime_InitalMessage), (GVAR(IdleTimeMax) / 60)],
            lineBreak,
            call FUNC(getIdleTimeRulesMessage)
        ];
        _msg setAttributes ["valign", "middle"];
        _msg setAttributes ["align", "center"];
        [QEGVAR(common,showMessage), [_msg, [6]]] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showExtraTimeInitialMessage), {
        private _msg = composeText [
            text LLSTRING(ExtraTime_StartedMessageHeader),
            lineBreak,
            text format [LLSTRING(TimeRemaining), GVAR(timeLimitExtraTime)],
            lineBreak,
            call FUNC(getIdleTimeRulesMessage)
        ];
        _msg setAttributes ["valign", "middle"];
        _msg setAttributes ["align", "center"];
        [QEGVAR(common,showMessage), [_msg, [6]]] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;
};
