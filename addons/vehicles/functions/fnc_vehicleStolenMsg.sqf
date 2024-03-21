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

if (isNull _nearestTown) then {
    _nearestTown = [_stolenVehicle] call EFUNC(common,getNearestCityLocation);
};

private _msg = "";
private _nearestCityArea = _nearestTown getVariable QGVAR(cityArea);
private _isInCity = (position _stolenVehicle) inArea _nearestCityArea;

// Check if distance is greater than 250 m. If so then change output a bit to represent that.
if (_isInCity) then {
    _msg = format [LLSTRING(Vehicle_Stolen_In_City), _timeOfTheft, text _nearestTown];
} else {
    _msg = format [LLSTRING(Vehicle_Stolen_Near_City), _timeOfTheft, text _nearestTown];
};

_msg
