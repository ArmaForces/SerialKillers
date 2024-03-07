#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates message for cops on civilian killed event.
 *
 * Arguments:
 * 0: Dead civilian <OBJECT>
 * 1: Civilian's time of death <STRING>
 * 2: Nearest location <LOCATION>
 *
 * Return Value:
 * 0: Civilian killed message <STRING>
 *
 * Example:
 * [player, "08:06:04"] call afsk_civilian_fnc_civilianKilledMsg
 *
 * Public: No
 */

params ["_deadCivilian", ["_timeOfDeath", daytime], ["_nearestTown", locationNull]];

if (_timeOfDeath isEqualType 0) then {
    _timeOfDeath = [_timeOfDeath] call BIS_fnc_timeToString;
};

if (isNull _nearestTown) then {
    _nearestTown = [_deadCivilian] call EFUNC(common,getNearestCityLocation);
};

private _msg = "";
private _nearestCityArea = _nearestTown getVariable QGVAR(cityArea);
private _isInCity = (position _deadCivilian) inArea _nearestCityArea;

// Check if distance is greater than 250 m. If so then change output a bit to represent that.
if (_isInCity) then {
    _msg = format [LLSTRING(Civilian_Killed_In_City), _timeOfDeath, text _nearestTown];
} else {
    _msg = format [LLSTRING(Civilian_Killed_Near_City), _timeOfDeath, text _nearestTown];
};

_msg
