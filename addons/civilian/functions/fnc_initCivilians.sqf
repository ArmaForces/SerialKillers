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

#define NEAR_ROAD true
#define ALLOW_ON_ROAD true
#define NEAR_BUILDINGS true
#define MAX_DISTANCE_TO_VILLAGE 500
#define MAX_DISTANCE_TO_NEAREST_CITY 1000

private _i = GVAR(initialCiviliansCount);

while {_i > 0} do {
    private _pos = [nil, NEAR_ROAD, ALLOW_ON_ROAD, NEAR_BUILDINGS] call EFUNC(common,getRandomPos);
    if (!(_pos isEqualTo [])) then {
        private _nearestCity = [_pos, MAX_DISTANCE_TO_NEAREST_CITY] call FUNC(getNearestCity);
        if (_nearestCity isEqualTo objNull) exitWith {};

        // TODO: Add configuration whether civilians should be created in cities only
        private _nearestCityArea = _nearestCity getVariable QGVAR(cityArea);
        if !(_pos inArea _nearestCityArea) exitWith {};

        // TODO: Handle alternative algorithm a bit better
        // private _nearestCityType = _nearestCity getVariable [QGVAR(cityType), "NameVillage"];
        // private _cityPosition = _nearestCity getVariable [QGVAR(position), [0, 0, 0]];
        // private _maxAllowedDistance = if (_nearestCityType isEqualTo "NameVillage") then { MAX_DISTANCE_TO_VILLAGE } else { MAX_DISTANCE_TO_NEAREST_CITY };
        // if (_pos distance _cityPosition > _maxAllowedDistance) exitWith {};

        private _nearbyCivilians = _pos nearEntities ["Man", 100];
        private _nearbyCiviliansCount = count _nearbyCivilians;
        if (_nearbyCiviliansCount >= 2 && {(random 1) - _nearbyCiviliansCount * 0.05 > 0.1}) exitWith {};

        [_pos] call FUNC(createCivilian);
        _i = _i - 1;
    };
};
