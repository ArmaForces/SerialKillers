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
private _civilian = _newGroup createUnit ["C_man_polo_1_F", _position, [], 0, "NONE"];

[_civilian] call FUNC(initCivilian);
