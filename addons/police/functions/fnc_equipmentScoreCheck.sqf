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

private _step = if ((EGVAR(score,policeScore) - GVAR(lastEquipmentUpdateScore)) > 0) then {1} else {-1};

TRACE_3("(equipmentScoreCheck) Performing check from %1 to %2 step %3", GVAR(lastEquipmentUpdateScore), EGVAR(score,policeScore), _step);

while {GVAR(lastEquipmentUpdateScore) != EGVAR(score,policeScore)} do {
    if (_step > 0) then {
        GVAR(lastEquipmentUpdateScore) = GVAR(lastEquipmentUpdateScore) + _step;
    };

    TRACE_1("(equipmentScoreCheck) Checking %1", GVAR(lastEquipmentUpdateScore));

    private _scoreItems = EGVAR(equipment,policeEquipmentScores) getVariable [str GVAR(lastEquipmentUpdateScore), []];
    private _scoreVehicles = EGVAR(equipment,policeVehiclesScores) getVariable [str GVAR(lastEquipmentUpdateScore), []];

    TRACE_2("(equipmentScoreCheck) Found %1 equipment and %2 vehicles", _scoreItems, _scoreVehicles);

    {
        if (_step > 0) then {
            [_x, _scoreItems] call EFUNC(common,addItemsToArsenal);
            [_x, _scoreVehicles] call FUNC(addVehiclesToSpawner);
        } else {
            if (EGVAR(score,policeScore) < 0) exitWith {};
            [_x, _scoreItems] call EFUNC(common,removeItemsFromArsenal);
            [_x, _scoreVehicles] call FUNC(removeVehiclesFromSpawner);
        };
    } forEach GVAR(arsenals);

    if (_step < 0) then {
        GVAR(lastEquipmentUpdateScore) = GVAR(lastEquipmentUpdateScore) + _step;
    };
};
