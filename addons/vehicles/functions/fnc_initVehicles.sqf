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

private _originalBlacklistedAreasAndGround = GVAR(vehicleBlacklistedAreas) + ["ground"];
private _originalBlacklistedAreasAndWater = GVAR(vehicleBlacklistedAreas) + ["water"];

// Retrieve civilian car types from config
private _customCivilianCarTypes = getArray (missionConfigFile >> "CfgSerialKillers" >> "Civilian" >> "CarTypes");

private _civilianCarTypes = if (_customCivilianCarTypes isNotEqualTo []) then {
    _customCivilianCarTypes apply {configFile >> "CfgVehicles" >> _x}
} else {
    // By default get all civilian side vehicles
    "( (getNumber (_x >> 'scope') >= 2)
        && {
            getText (_x >> 'vehicleClass') in ['Car']
            && {getNumber (_x >> 'side') == 3}
        })" configClasses (configFile >> "CfgVehicles");
};

// TODO: Consider blacklist

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
        if (GVAR(alarmEnabled)) then {
            [_vehicle, random [GVAR(alarmMinimumChance), GVAR(alarmAverageChance), GVAR(alarmMaximumChance)]] call FUNC(initCarAlarm);
        };
        _i = _i - 1;
    };
};
