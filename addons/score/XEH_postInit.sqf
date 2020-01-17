#include "script_component.hpp"

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
        [QGVAR(endMission), [KILLERS_DEAD]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(changeScore), {
        params ["_side", "_change", ["_reason", ""]];
        if (_side isEqualTo WEST) then {
            [_change, _reason] call FUNC(addPoliceScore);
        } else {
            [_change, _reason] call FUNC(addKillersScore);
        };
        [QGVAR(scoreChanged), _this] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(scoreChanged), {
        params ["_side", "_change", ["_reason", ""]];
        [QGVAR(showScore), [_reason]] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;

    /* Serverside score logic init */
    // Idle timeout init
    if (GVAR(idleTimeMax) isEqualTo -1) exitWith {};
    [{
        private _msg = composeText [
            text format [LLSTRING(IdleTime_Inital_Message), (GVAR(IdleTimeMax) / 60) toFixed 1],
            lineBreak,
            lineBreak,
            text format ["%1: %2", ELLSTRING(killers,Killers), GVAR(idleTimeKillersScoreChange)],
            lineBreak,
            text format ["%1: %2", ELLSTRING(police,Police), GVAR(idleTimePoliceScoreChange)]
        ];
        _msg setAttributes ["valign", "middle"];
        [QEGVAR(common,showMessage), [_msg, [3]]] call CBA_fnc_globalEvent;
        call FUNC(monitorTimeouts);
    }, [], GVAR(idleTimeMax)] call CBA_fnc_waitAndExecute;
};


if (hasInterface) then {
    /* Clientside events */
    [QGVAR(endMission), {
        _this call FUNC(endMissionClient);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showScore), {
        _this call FUNC(showScore);
    }] call CBA_fnc_addEventHandler;
};
