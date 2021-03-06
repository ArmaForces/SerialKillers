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

if (isNull _nearestTown) then {
    _nearestTown = [_deadCop] call EFUNC(common,getNearestCityLocation);
};

private _msg = "";
private _distance = (position _deadCop) distance _nearestTown;
// Check if distance is greater than 250 m. If so then change output a bit to represent that.
if (_distance <= 250) then {
    _msg = format [LLSTRING(Cop_Killed_In_City), _timeOfDeath, text _nearestTown];
} else {
    _msg = format [LLSTRING(Cop_Killed_Near_City), _timeOfDeath, text _nearestTown];
};

_msg
