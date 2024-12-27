#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function shows message to local player. Uses ACE function if available.
 *
 * Arguments:
 * 0: Message <STRING>
 * 1: Additional params for ACE function <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Message"] call afsk_common_fnc_showMessage
 *
 * Public: No
 */

params ["_msg", ["_additionalParams", []]];

if (GVAR(ACE_Loaded)) then {
    _additionalParams params [["_size", 1.5], ["_target", ACE_player], ["_width", 10]];
    [_msg, _size, _target, _width] call ACE_common_fnc_displayTextStructured;
} else {
    hint _msg;
};

nil
