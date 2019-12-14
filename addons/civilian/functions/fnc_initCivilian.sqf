#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes given civilian unit.
 *
 * Arguments:
 * 0: Civilian unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call afsk_civilian_fnc_initCivilian
 *
 * Public: No
 */

params ["_civilian", ["_cityLogic", objNull]];

if !(isServer) exitWith {
    [QGVAR(initCivilian), _this] call CBA_fnc_serverEvent;
};

if (_civilian getVariable [QGVAR(initialized), false]) exitWith {};

if (_cityLogic isEqualTo objNull) then {
    _cityLogic = [_civilian] call FUNC(getNearestCity);
};

_civilian addEventHandler ["Killed", {
    params ["_civilian", "_killer", "_instigator", "_useEffects"];
    [QGVAR(civilianKilled), [_civilian, _killer]] call CBA_fnc_serverEvent;
}];

[_civilian, _cityLogic] call FUNC(assignCityCivilian);
GVAR(civilians) pushBack _civilian;
GVAR(civiliansCount) = GVAR(civiliansCount) - 1;
_civilian setVariable [QGVAR(initialized), true];
