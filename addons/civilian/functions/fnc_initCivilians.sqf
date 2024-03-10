#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes civilians in cities only.
 *
 * Arguments:
 * 0: Cities that should contain civilians <ARRAY>
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

params ["_cities"];

// Determine initial weights for cities
private _cityWeightsArray = _cities apply {
    private _cityArea = _x getVariable QGVAR(cityArea);
    _cityArea params ["_center", "_radiusA", "_radiusB"];
    private _area = _radiusA * _radiusB; // We can omit the PI as it's a const and we'll just compare all the values

    private _cityType = _x getVariable [QGVAR(cityType), "NameVillage"];
    // TODO: Configurable multipliers?
    private _cityTypeMultiplier = switch (_cityType) do {
        case "NameVillage": { GVAR(villageCiviliansWeightMultiplier) };
        case "NameCity": { GVAR(cityCiviliansWeightMultiplier) };
        case "NameCityCapital": { GVAR(cityCapitalCiviliansWeightMultiplier) };
        default { 0 };
    };

    private _weight = _area * _cityTypeMultiplier;
    [_x getVariable QGVAR(Name), [_x, _weight]]
};

private _cityWeights = createHashMapFromArray _cityWeightsArray;

// Spawn civilians
private _i = GVAR(initialCiviliansCount);

while {_i > 0} do {
    private _citiesNames = keys _cityWeights;
    private _citiesWeights = values _cityWeights apply {_x select 1};

    private _randomCityName = _citiesNames selectRandomWeighted _citiesWeights;
    private _randomCityAndWeight = _cityWeights get _randomCityName;
    private _randomCity = _randomCityAndWeight select 0;

    private _pos = [_randomCity, nil, NEAR_ROAD, ALLOW_ON_ROAD, NEAR_BUILDINGS] call FUNC(getCityRandomPos);

    if (_pos isEqualTo []) then { continue };

    private _nearbyCivilians = _pos nearEntities ["Man", 100];
    private _nearbyCiviliansCount = count _nearbyCivilians;
    if (_nearbyCiviliansCount >= 2 && {(random 1) - _nearbyCiviliansCount * 0.05 > 0.1}) then { continue };

    // Update weight as civilian will be created here
    private _newCityWeight = (_randomCityAndWeight select 1) / 2;
    _cityWeights set [_randomCityName, [_randomCity, _newCityWeight]];

    // Create civilian
    [_pos] call FUNC(createCivilian);
    _i = _i - 1;
};
