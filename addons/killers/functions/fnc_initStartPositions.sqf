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

while {_i > 0} do {
    private _pos = [nil, false, false, true] call EFUNC(common,getRandomPos);
    if (!(_pos isEqualTo [])) then {
        private _nearestCity = [_pos, 1500] call EFUNC(civilian,getNearestCity);
        if (_nearestCity isEqualTo objNull) exitWith {};
        private _nearestLocation = [_pos, 1500] call EFUNC(common,getNearestLocation);
        if (!(_positions getVariable [className _nearestLocation, []] isEqualTo [])) exitWith {};
        _positions setVariable [className _nearestLocation, _pos];
        _i = _i - 1;
    };
};

_positions
