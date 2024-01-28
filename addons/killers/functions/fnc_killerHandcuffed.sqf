#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles killer being handcuffed event.
 *
 * Arguments:
 * 0: Handcuffed killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call afsk_killers_fnc_killerHandcuffed
 *
 * Public: No
 */

params ["_killer"];

if !(isServer) exitWith {};

_killer setVariable [QEGVAR(jail,isImprisoned), true, true];

private _anyKillerFree = call FUNC(anyKillerFree);
if (!_anyKillerFree) then {
    [QEGVAR(score,killersKilled)] call CBA_fnc_serverEvent;
};
