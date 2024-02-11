#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes civilians on whole map.
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

#define NEAR_ROAD true
#define ALLOW_ON_ROAD true
#define NEAR_BUILDINGS true
#define MAX_DISTANCE_TO_NEAREST_CITY 1000

private _i = GVAR(initialCiviliansCount);

while {_i > 0} do {
    private _pos = [nil, NEAR_ROAD, ALLOW_ON_ROAD, NEAR_BUILDINGS] call EFUNC(common,getRandomPos);
    if (!(_pos isEqualTo [])) then {
        private _nearestCity = [_pos, MAX_DISTANCE_TO_NEAREST_CITY] call FUNC(getNearestCity);
        if (_nearestCity isEqualTo objNull) exitWith {};
        [_pos] call FUNC(createCivilian);
        _i = _i - 1;
    };
};
