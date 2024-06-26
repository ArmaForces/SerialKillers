#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function checks whether given unit died due to cop actions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * True if unit was killed by cop. <BOOL>
 *
 * Example:
 * [player] call afsk_police_fnc_isKilledByCop
 *
 * Public: No
 */

params ["_unit", "_killer"];

// Killer will be null if unit was driving a vehicle and smashed into something, killing itself.
// Killer might also be null when vehicle explodes after unit got out of it, but that's why vehicle check is done.
// If a vehicle has a red hull and explodes, it will be a killer, that's fine that it won't be counted as a suicide.
// It might cause false-positives when a killer rams cops, but cops smashing other cops or trees are much more likely.
private _isSuicideInVehicle = isNull _killer && {vehicle _unit isNotEqualTo _unit};

_isSuicideInVehicle || {[_killer] call FUNC(isCop)}
