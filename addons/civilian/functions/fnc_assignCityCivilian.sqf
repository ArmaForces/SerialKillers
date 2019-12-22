#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function assigns city to civilian and vice versa.
 *
 * Arguments:
 * 0: Civilian <OBJECT>
 * 1: City namespace <CBA_NAMESPACE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, [bob] call afsk_civilian_fnc_getNearestCity] call afsk_civilian_fnc_assignCityCivilian;
 *
 * Public: No
 */

params ["_civilian", "_cityNamespace"];

// Get city civilians array and pushback new civilian. No need for setVariable as getVariable returns array pointer.
_cityCivilians = _cityNamespace getVariable QGVAR(CiviliansList);
_cityCivilians pushBack _civilian;
_cityNamespace setVariable [QGVAR(CiviliansCount), count _cityCivilians];
_civilian setVariable [QGVAR(City), _cityNamespace];
