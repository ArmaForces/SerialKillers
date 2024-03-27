#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates message for cops on cop killed event.
 *
 * Arguments:
 * 0: Dead cop <OBJECT>
 * 1: Cop's time of death <STRING>
 * 2: Nearest location <LOCATION>
 *
 * Return Value:
 * 0: Cop killed message <STRING>
 *
 * Example:
 * [player, "08:06:04"] call afsk_police_fnc_copKilledMsg
 *
 * Public: No
 */

params ["_deadCop", ["_timeOfDeath", daytime], ["_nearestTown", locationNull]];

if (_timeOfDeath isEqualType 0) then {
    _timeOfDeath = [_timeOfDeath] call BIS_fnc_timeToString;
};

private _nearestCity = if (isNull _nearestTown) then {
    [_deadCop] call EFUNC(civilian,getNearestCity)
} else {
    [_nearestTown] call EFUNC(civilian,getCityByLocation)
};

private _msg = "";
private _nearestCityName = _nearestCity getVariable [QEGVAR(civilian,name), ""];
private _nearestCityArea = _nearestCity getVariable QEGVAR(civilian,cityArea);
private _isInCity = (position _deadCop) inArea _nearestCityArea;

if (_isInCity) then {
    _msg = format [LLSTRING(Cop_Killed_In_City), _timeOfDeath, _nearestCityName];
} else {
    _msg = format [LLSTRING(Cop_Killed_Near_City), _timeOfDeath, _nearestCityName];
};

_msg
