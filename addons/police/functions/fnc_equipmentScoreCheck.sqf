#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if new police score unlocks or locks anything.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_police_fnc_equipmentScoreCheck
 *
 * Public: No
 */

if !(isServer) exitWith {};

private _step = if ((EGVAR(score,policeScore) - GVAR(lastEquipmentUpdateScore)) > 0) then {1} else {-1};

for "_checkScore" from GVAR(lastEquipmentUpdateScore) to EGVAR(score,policeScore) step _step do {
    private _scoreItems = EGVAR(score,policeEquipmentScores) getVariable [str _checkScore, []];
    if (_step > 0) then {
        [_scoreItems] call EFUNC(common,addItemsToArsenal);
    } else {
        [_scoreItems] call EFUNC(common,removeItemsFromArsenal);
    };
    GVAR(lastEquipmentUpdateScore) = _checkScore;
};
