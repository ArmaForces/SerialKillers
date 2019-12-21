#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if unit appears armed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * 0: Unit appears armed <BOOL>
 *
 * Example:
 * [player] call afsk_common_fnc_appearsArmed
 *
 * Public: No
 */

params ["_unit"];

switch (true) do {
    // Unit has weapon in hands
    case (!(currentWeapon _unit isEqualTo "")): {true};
    // Unit doesn't have any weapons
    case (weapons _unit isEqualTo []): {false};
    // Unit doesn't have primary nor launcher weapon
    case (primaryWeapon _unit isEqualTo "" && {secondaryWeapon _unit isEqualTo ""}): {false};
    default {true};
};
