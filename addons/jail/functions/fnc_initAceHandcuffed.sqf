#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes event handler on ACE Handcuffed event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_jail_fnc_initAceHandcuffed
 *
 * Public: No
 */

[QACEGVAR(captives,setHandcuffed), {
    params ["_unit", "_isHandcuffed"];
    if !(_unit isEqualTo player) exitWith {};

    // Unit was handcuffed (arrested)
    if (_isHandcuffed) exitWith {
        [QEGVAR(killers,killerHandcuffed), [_unit]] call CBA_fnc_serverEvent;
    };

    // If a unit was imprisoned, free it
    if (_unit getVariable [QGVAR(isImprisoned), false]) then {
        [QGVAR(free), [player]] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_addEventHandler;
