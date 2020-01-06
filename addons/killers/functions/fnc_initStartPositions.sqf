#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes starting positions for killers (initial teleport destinations).
 * Positions cannot be farther than 1500 m from any city and 1500 m from any location.
 * Each location can have only one position assigned (to prevent stacking and avoid ambiguous teleports).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: location - position <CBA_NAMESPACE>
 *
 * Example:
 * call afsk_killers_fnc_initStartPositions
 *
 * Public: No
 */

private _i = GVAR(startPositionsCount);
private _positions = call CBA_fnc_createNamespace;

// Generate positions
while {_i > 0} do {
    private _pos = [nil, false, false, true] call EFUNC(common,getRandomPos);
    //diag_log format ["[AFSK] [KILLERS] [initStartPositions] Pos: %1", _pos];
    if (!(_pos isEqualTo [])) then {
        private _nearestCity = [_pos, 1500] call EFUNC(common,getNearestCityLocation);
        //diag_log format ["[AFSK] [KILLERS] [initStartPositions] City: %1", _nearestCity];
        if (_nearestCity isEqualTo locationNull) exitWith {};
        private _nearestLocation = [_pos, 1500] call EFUNC(common,getNearestLocationWithAvailableName);
        //diag_log format ["[AFSK] [KILLERS] [initStartPositions] Location: %1", _nearestLocation];
        if (_nearestLocation isEqualTo locationNull) exitWith {};
        private _locationClassname = className _nearestLocation;
        if (_locationClassname isEqualTo "") exitWith {};
        //diag_log format ["[AFSK] [KILLERS] [initStartPositions] Location Classname: %1", _locationClassname];
        if (!(_positions getVariable [_locationClassname, []] isEqualTo [])) exitWith {};
        _positions setVariable [_locationClassname, _pos];
        //diag_log format ["[AFSK] [KILLERS] [initStartPositions] Success"];
        _i = _i - 1;
    };
};

_positions
