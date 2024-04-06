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

params ["_unit", "_killer", ["_timeOfDeath", daytime], ["_nearestTown", locationNull]];

if (_timeOfDeath isEqualType 0) then {
    _timeOfDeath = [_timeOfDeath] call BIS_fnc_timeToString;
};

// Check if civilian died in city. If so then change output a bit to represent that.
private _template = if ([_unit, _nearestTown] call EFUNC(civilian,isPositionInCity)) then {
    if ([_unit, _killer] call FUNC(isKilledByCop)) then { LLSTRING(KilledByCop_In_City) } else { LLSTRING(Killed_In_City) };
} else {
    if ([_unit, _killer] call FUNC(isKilledByCop)) then { LLSTRING(KilledByCop_Near_City) } else { LLSTRING(Killed_Near_City) };
};

// Supplying killer name to format, but only killed by cop should reveal name for lynch
private _killerName = if (isNull _killer) then { name _unit } else { name _killer };
private _msg = format [_template, _timeOfDeath, text _nearestTown, _killerName];

_msg
