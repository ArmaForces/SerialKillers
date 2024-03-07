#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes civilians in cities only.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

private _i = GVAR(initialCiviliansCount);

while {_i > 0} do {
    private _pos = [nil, false, true, true] call EFUNC(common,getRandomPos);
    if (!(_pos isEqualTo [])) then {
        private _nearestCity = [_pos, 1500] call FUNC(getNearestCity);
        if (_nearestCity isEqualTo objNull) exitWith {};

        // TODO: Add configuration whether civilians should be created in cities only
        private _nearestCityArea = _nearestCity getVariable QGVAR(cityArea);
        if (_pos inArea _nearestCityArea) then {
            [_pos] call FUNC(createCivilian);
            _i = _i - 1;
        };
    };
};
