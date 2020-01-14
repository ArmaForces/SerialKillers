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

// Retrieve all civilian car types from config
private _civilianCarTypes = "( (getNumber (_x >> 'scope') >= 2)
                                    && {
                                        getText (_x >> 'vehicleClass') in ['Car']
                                        && {getNumber (_x >> 'side') == 3}
                                    })" configClasses (configFile >> "CfgVehicles");

GVAR(citiesVehicles) = call CBA_fnc_createNamespace;

while {_i > 0} do {
    private _carType = selectRandom _civilianCarTypes;
    private _pos = [_carType, true, false, true] call EFUNC(common,getRandomPos);
    if (!(_pos isEqualTo [])) then {
        // Check if there are other vehicles nearby to prevent creating too much vehicles in one area
        private _distance = 100 * (4 - GVAR(emptyVehiclesLimitMultiplier));
        private _nearbyCars = _pos nearObjects ["Car", _distance];
        private _nearbyCarsCount = count (_nearbyCars select {_pos distance _x < (_distance / 4)});
        if (_nearbyCarsCount >= 1 && {(random 1) > 0.1}) exitWith {};
        private _nearbyCarsCount = count (_nearbyCars select {_pos distance _x < _distance});
        if (_nearbyCarsCount >= 2 && {(random 1) > 0.1}) exitWith {};
        // Create vehicle on given position. We need some way to prevent instant damage to vehicle as these empty positions are not perfect.
        private _vehicle = [_carType, _pos] call FUNC(createVehicle);
        _i = _i - 1;
    };
};
