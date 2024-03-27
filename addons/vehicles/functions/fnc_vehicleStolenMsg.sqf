#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates message for cops on vehicle stolen event.
 *
 * Arguments:
 * 0: Stolen vehicle <OBJECT>
 * 1: Time of theft <STRING>
 * 2: Nearest location <LOCATION>
 *
 * Return Value:
 * 0: Vehicle stolen message <STRING>
 *
 * Example:
 * [vehicle player, "08:06:04"] call afsk_vehicles_fnc_vehicleStolenMsg
 *
 * Public: No
 */

params ["_stolenVehicle", ["_timeOfTheft", daytime], ["_nearestTown", locationNull]];

if (_timeOfTheft isEqualType 0) then {
    _timeOfTheft = [_timeOfTheft] call BIS_fnc_timeToString;
};

private _nearestCity = if (isNull _nearestTown) then {
    [_stolenVehicle] call EFUNC(civilian,getNearestCity)
} else {
    [_nearestTown] call EFUNC(civilian,getCityByLocation)
};

private _msg = "";
private _nearestCityName = _nearestCity getVariable [QEGVAR(civilian,name), ""];
private _nearestCityArea = _nearestCity getVariable QEGVAR(civilian,cityArea);
private _isInCity = (position _stolenVehicle) inArea _nearestCityArea;

if (_isInCity) then {
    _msg = format [LLSTRING(Vehicle_Stolen_In_City), _timeOfTheft, _nearestCityName];
} else {
    _msg = format [LLSTRING(Vehicle_Stolen_Near_City), _timeOfTheft, _nearestCityName];
};

_msg
