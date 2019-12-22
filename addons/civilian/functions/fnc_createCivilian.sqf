#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates civilian in given city.
 *
 * Arguments:
 * 0: City namespace <CBA_NAMESPACE>
 *
 * Return Value:
 * 0: Created civilian unit <OBJECT>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_cityNamespace"];

private _newGroup = createGroup CIVILIAN;
private _position = [[_cityNamespace getVariable [QGVAR(Position), [0, 0, 0]], 100]] call BIS_fnc_randomPos;

_newGroup createUnit ["C_man_polo_1_F", _position, [], 0, "NONE"];