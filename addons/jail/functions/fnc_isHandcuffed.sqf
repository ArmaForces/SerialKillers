#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if a unit is handcuffed.
 *
 * Arguments:
 * 0: Unit to check <UNIT>
 *
 * Return Value:
 * True if unit is handcuffed (alive, but can't move on it's own) <BOOL>
 *
 * Example:
 * [bob] call afsk_jail_fnc_isHandcuffed
 *
 * Public: No
 */

if (EGVAR(common,ACE_Loaded)) then {
    _unit getVariable [QACEGVAR(captives,isHandcuffed), false]
} else {
    _unit _x getVariable [QEGVAR(jail,isImprisoned), false]
};

