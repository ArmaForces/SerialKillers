#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function changes score for given side by given amount.
 *
 * Arguments:
 * 0: Side which has score changed <SIDE>
 * 1: Score change <NUMBER>
 * 2: Reason <STRING> (Optional)
 *
 * Return Value:
 * 0: New score <NUMBER>
 *
 * Example:
 * [WEST, 1] call afsk_score_fnc_changeScore
 *
 * Public: No
 */

params ["_side", "_change", ["_reason", ""]];

private _previousScore = [_side] call FUNC(getSideScore);

if (_side isEqualTo WEST) then {
    [_change, _reason] call FUNC(addPoliceScore);
} else {
    [_change, _reason] call FUNC(addKillersScore);
};

private _newScore = [_side] call FUNC(getSideScore);

INFO_("Changed score for %1: %2 + %3 = %4",_side,_previousScore,_change,_newScore);

[QGVAR(scoreChanged), [_side, _change, _newScore, _reason]] call CBA_fnc_globalEvent;

_newScore
