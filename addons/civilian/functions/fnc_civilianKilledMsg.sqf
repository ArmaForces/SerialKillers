#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates message for cops on civilian killed event.
 *
 * Arguments:
 * 0: Dead civilian <OBJECT>
 * 1: Unit which killed civilian <OBJECT>
 * 2: Civilian's time of death <STRING>
 * 3: Nearest location <LOCATION>
 *
 * Return Value:
 * 0: Civilian killed message <STRING>
 *
 * Example:
 * [player, "08:06:04"] call afsk_civilian_fnc_civilianKilledMsg
 *
 * Public: No
 */

params ["_deadCivilian", ["_killer", objNull], ["_timeOfDeath", daytime], ["_nearestTown", locationNull]];

if (_timeOfDeath isEqualType 0) then {
    _timeOfDeath = [_timeOfDeath] call BIS_fnc_timeToString;
};

private _nearestCity = if (isNull _nearestTown) then {
    [_deadCivilian] call FUNC(getNearestCity)
} else {
    [_nearestTown] call FUNC(getCityByLocation)
};

// Check if civilian died in city. If so then change output a bit to represent that.
private _template = if ([_deadCivilian, _nearestTown] call EFUNC(common,isPositionInCity)) then {
    if (side _killer isEqualTo WEST) then { LSTRING(KilledByCop_In_City) } else { LSTRING(Killed_In_City) };
} else {
    if (side _killer isEqualTo WEST) then { LSTRING(KilledByCop_Near_City) } else { LSTRING(Killed_Near_City) };
};

// Supplying killer name to format, but only killed by cop should reveal name for lynch
private _msg = format [_template, _timeOfDeath, text _nearestTown, name _killer];

_msg
