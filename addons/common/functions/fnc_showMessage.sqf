#include "script_component.hpp"
/*
 * Author: <author>
 * Function description
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afsk_main_fnc_example
 *
 * Public: No
 */

params ["_msg", ["_additionalParams", []]];

if (GVAR(ACE_Loaded)) then {
    _additionalParams params [["_size", 1.5], ["_target", ACE_player], ["_width", 10]]
    [_msg, _size, _target, _width] call ACE_common_fnc_displayTextStructured;
} else {
    hint _msg;
}
