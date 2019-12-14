#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function description
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_score_fnc_showScore
 *
 * Public: No
 */

private _fnc_determineSign = {
    params ["_value"];
    switch (_value) do {
        case (_value > 0): {"+"};
        case (_value < 0): {"-"};
        default {""};
    };
};

private _separator = parseText "<br/>---------------------------<br/>";
_separator setAttributes ["align", "center"];

private _msgHour = text format ["%1", [daytime] call BIS_fnc_timeToString];
_msgHour setAttributes ["align", "center"];

private _msgKillers = text format ["%1", ELSTRING(killers,Killers)];
_msgKillers setAttributes ["align", "center"];

private _msgKillersScore = text format ["%1/%2 (%4%3)", GVAR(killersScore), GVAR(killersScoreMax), GVAR(killersScoreChange), [GVAR(killersScoreChange)] call _fnc_determineSign];
_msgKillersScore setAttributes ["align", "center"];

private _msgPolice = text format ["%1", ELSTRING(police,Police)];
_msgPolice setAttributes ["align", "center"];

private _msgPoliceScore = text format ["%1/%2 (%4%3)", GVAR(policeScore), GVAR(policeScoreMax), GVAR(policeScoreChange), [GVAR(policeScoreChange)] call _fnc_determineSign];
_msgPoliceScore setAttributes ["align", "center"];

private _msg = composeText [
    _msgHour,
    _separator,
    _msgKillers,
    lineBreak,
    _msgKillersScore,
    lineBreak,
    lineBreak,
    _msgPolice,
    lineBreak,
    _msgPoliceScore
];
_msg setAttributes ["valign", "center"];

[QEGVAR(common,showMessage), [_msg, [4]]] call CBA_fnc_globalEvent;
