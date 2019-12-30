#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function unassigns civilian from his city and vice versa.
 *
 * Arguments:
 * 0: Civilian <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call afsk_civilian_fnc_unassignCivilianFromCity;
 *
 * Public: No
 */

params ["_civilian"];

private _cityNamespace = _civilian getVariable [QGVAR(City), ""];
if (_cityNamespace isEqualTo "") exitWith {};

// Get city civilians array and delete current civilian.
_cityCivilians = _cityNamespace getVariable QGVAR(CiviliansList);
_cityCivilians deleteAt (_cityCivilians findIf {_x isEqualTo _civilian});
_cityNamespace setVariable [QGVAR(CiviliansCount), count _cityCivilians];
_civilian setVariable [QGVAR(City), nil];
