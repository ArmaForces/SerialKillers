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
    private _pos = [_carType, true, false, true] call FUNC(getRandomPos);
    if (!(_pos isEqualTo [])) then {
        private _vehicle = [_carType, _pos] call FUNC(createVehicle);
        _i = _i - 1;
    };
};
