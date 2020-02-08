#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares police vehicles from given config.
 *
 * Arguments:
 * 0: Eqipment config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_equipmentPresetConfig"];

// Get all defined vehicles and sort by required score from lowest to highest
private _policeVehicles = [(_equipmentPresetConfig >> "Police" >> "Vehicles")] call FUNC(readConfigToNamespace);
private _policeVehiclesList = [];
{
    private _vehicleClassname = _x;
    private _vehicle = _policeVehicles getVariable _vehicleClassname;
    private _vehicleRequiredScore = _vehicle getVariable ["requiredScore", 0];
    _policeVehiclesList pushBack [_vehicleRequiredScore, _x];
} forEach (allVariables _policeVehicles);
_policeVehiclesList sort true;

// Fill GVAR(policeVehiclesScores) namespace
{
    private _vehicleRequiredScore = _x select 0;
    private _vehicleClassName = _x select 1;
    private _requiredScoreList = GVAR(policeVehiclesScores) getVariable [str _vehicleRequiredScore, []];
    if (_requiredScoreList isEqualTo []) then {
        GVAR(policeVehiclesScores) setVariable [str _vehicleRequiredScore, _requiredScoreList];
    };
    if (!((GVAR(policeVehiclesList) pushBackUnique _vehicleClassName) isEqualTo -1)) then {
        _requiredScoreList pushBack _vehicleClassName;
    };
} forEach _policeVehiclesList;
