#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes empty civilian vehicles on the map.
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

private _i = GVAR(emptyVehiclesLimit);

private _cities = +GVAR(cities);
private _weights = [];

//
{
    private _cityType = _x getVariable QGVAR(cityType);
    _cityWeight = switch (_cityType) do {
        case "NameCityCapital": {ceil (random (10))};
        case "NameCity": {ceil (random (8))};
        case "NameVillage": {ceil (random (6))};
        default {ceil (random (4))};
    };
    _weights pushBack (_cityWeight);
} forEach _cities;

// Add entry for non city area
_cities pushBack "RuralArea";
_weights pushBack (ceil (random (10)));

private _civilianCarTypes = "( (getNumber (_x >> 'scope') >= 2)
                                    && {
                                        getText (_x >> 'vehicleClass') in ['Car']
                                        && {getNumber (_x >> 'side') == 3}
                                    })" configClasses (configFile >> "CfgVehicles");

while {_i > 0} do {
    private _city = _cities selectRandomWeighted _weights;
    private _pos = if (_city isEqualTo "RuralArea") then {
        [nil, ["water"]] call BIS_fnc_randomPos;
    } else {
        [_city] call FUNC(getCityRandomPos);
    };
    [selectRandom _civilianCarTypes, _pos] call FUNC(createVehicle);
    _i = _i - 1;
};
