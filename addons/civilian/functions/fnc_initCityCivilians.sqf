#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes civilians in given city.
 *
 * Arguments:
 * 0: City namespace <CBA_NAMESPACE>
 * 1: City Size <STRING>
 *
 * Return Value:
 * 0: City civilians <ARRAY>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_cityNamespace", "_cityType"];

private _cityCiviliansCount = switch (_cityType) do {
    case "NameCityCapital": {ceil (random (10))};
    case "NameCity": {ceil (random (8))};
    case "NameVillage": {ceil (random (6))};
    default {ceil (random (4))};
};

private _cityCivilians = [];

_cityCiviliansCount = GVAR(civiliansCount) min _cityCiviliansCount;
for "_y" from 1 to _cityCiviliansCount step 1 do {
    private _civilian = [_cityNamespace] call FUNC(createCivilian);
    [_civilian, _cityNamespace] call FUNC(initCivilian);
    _cityCivilians pushBack _civilian;
    GVAR(civilians) pushBack _civilian;
};

_cityCivilians
