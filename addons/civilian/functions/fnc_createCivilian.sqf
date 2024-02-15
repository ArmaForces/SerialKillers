#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates and initializes civilian on given position.
 *
 * Arguments:
 * 0: Position <POSITION>
 *
 * Return Value:
 * 0: Created civilian unit <OBJECT>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_position"];

private _newGroup = createGroup CIVILIAN;
private _unit = selectRandom GVAR(units);
private _civilian = _newGroup createUnit [_unit, _position, [], 0, "NONE"];

if (_civilian isEqualTo objNull) exitWith {
    WARNING_2("Failed creating civilian %1 at %2", _unit, _position);
};

[_civilian] call FUNC(initCivilian);
