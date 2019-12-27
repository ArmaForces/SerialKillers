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

for "_checkScore" from GVAR(lastEquipmentUpdateScore) to (EGVAR(score,policeScore) + 1) step _step do {
    private _scoreItems = EGVAR(equipment,policeEquipmentScores) getVariable [str _checkScore, []];
    if (_step > 0) then {
        {
            [_x, _scoreItems] call EFUNC(common,addItemsToArsenal);
        } forEach GVAR(arsenals);
    } else {
        {
            [_x, _scoreItems] call EFUNC(common,removeItemsFromArsenal);
        } forEach GVAR(arsenals);
    };
    GVAR(lastEquipmentUpdateScore) = _checkScore;
};
