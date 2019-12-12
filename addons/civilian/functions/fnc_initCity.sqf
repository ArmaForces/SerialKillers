#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes given city with module, civilians and vehicles.
 *
 * Arguments:
 * 0: City to initialize <LOCATION>
 *
 * Return Value:
 * 0: City logic <LOGIC>
 *
 * Example:
 * [[player] call afsk_common_fnc_nearestLocation] call afsk_common_fnc_initCity
 *
 * Public: No
 */

params ["_city"];

private _cityLogic = (createGroup sideLogic) createUnit ["LOGIC", [0,0,0], [], 0, "NONE"];
_cityLogic setVariable ["Location", _city, true];

private _citySize = [_city] call EFUNC(common, getLocationType);

// Init civilians
private _cityCivilians = [_cityLogic, _citySize] call FUNC(initCityCivilians);
private _cityCiviliansCount = count _cityCivilians;
_cityLogic setVariable ["CiviliansList", _cityCivilians];
_cityLogic setVariable ["CiviliansCount", _cityCiviliansCount];
GVAR(civiliansCount) = GVAR(civiliansCount) - _cityCiviliansCount;

_cityLogic
