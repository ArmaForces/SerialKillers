#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function frees all prisoners.
 * If an object was provided, all prisoners will be teleported to the object's position.
 *
 * Arguments:
 * 0: Object that had triggered the action <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call afsk_jail_fnc_freeAll
 *
 * Public: No
 */

params [["_object", objNull]];

private _prisoners = +GVAR(prisoners);
GVAR(prisoners) = [];

{
    [_x] call FUNC(free);
    if (_object isNotEqualTo objNull) then {
        _x setPos (getPos _object);
    };
} forEach _prisoners;

private _msg = format ["Prisoners have been released from the prison!"];
[QEGVAR(common,showSideChatMsg), [WEST, _msg]] call CBA_fnc_globalEvent;
