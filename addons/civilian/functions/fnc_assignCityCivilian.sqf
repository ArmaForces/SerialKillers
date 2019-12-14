#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function assigns city to civilian and vice versa.
 *
 * Arguments:
 * 0: Civilian <OBJECT>
 * 1: City <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, [bob] call afsk_civilian_fnc_getNearestCity] call afsk_civilian_fnc_assignCityCivilian;
 *
 * Public: No
 */

params ["_civilian", "_cityLogic"];

_cityCivilians = _cityLogic getVariable ["CiviliansList", []];
_cityCivilians pushBack _civilian;
_cityCiviliansCount = count _cityCivilians;
_cityLogic setVariable ["CiviliansList", _cityCivilians];
_cityLogic setVariable ["CiviliansCount", _cityCiviliansCount];
_civilian setVariable ["City", _cityLogic];
