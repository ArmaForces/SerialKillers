#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function imprisons given unit.
 *
 * Arguments:
 * 0: Unit to imprison <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_jail_fnc_imprison
 *
 * Public: No
 */

params ["_unit"];

private _randomJailPos = call FUNC(getRandomJailPos);
_unit setPos _randomJailPos;

// Add prisoner to prisoners list and add imprisoned variable
GVAR(prisoners) pushBackUnique _unit;
publicVariable QGVAR(prisoners);
_unit setVariable [QGVAR(isImprisoned), true, true];

// Add ability to release prisoner. Supports ACE Captives untie.
if (EGVAR(common,ACE_Loaded)) then {
    // Tie the prisoner. He will be set free on untie.
    [QACEGVAR(captives,setHandcuffed), [_unit, true], _unit] call CBA_fnc_targetEvent;
} else {
    // Add own release action to prisoner.
    [QGVAR(addReleaseAction), [_unit]] call CBA_fnc_globalEvent;
};

INFO_1("Killer %1 is now imprisoned",name _unit);
