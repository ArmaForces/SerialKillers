#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks if given unit can release given target unit.
 *
 * Arguments:
 * 0: Releasing unit <OBJECT>
 * 1: Unit to release <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, ted] call afsk_jail_fnc_canBeReleased
 *
 * Public: No
 */

params ["_releaser", "_target"];

(_releaser distance _target < 3) && {(alive _target) && {(_target getVariable [QGVAR(isImprisoned), false])}}
