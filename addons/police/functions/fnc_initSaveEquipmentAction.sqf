#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes action to save equipment for respawn on given object.
 *
 * Arguments:
 * 0: Object which should allow saving equipment <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_object"];

private _condition = {side player isEqualTo WEST};

private _action = [
    QGVAR(saveEquipment),
    LLSTRING(SaveEquipmentForRespawn),
    "",
    {
        EGVAR(common,playerLoadout) = getUnitLoadout player;
        private _primaryWeapon = primaryWeapon player;
        private _launcherWeapon = secondaryWeapon player;
        private _handgun = handgunWeapon player;

        private _msg = format [LLSTRING(SavedEquipment), _primaryWeapon, _handgun, _launcherWeapon];
        [QGVAR(showMessage), [_msg]] call CBA_fnc_localEvent;
    },
    _condition,
    {}, [], "", 4, [false, false, false, false, false], {}
] call ace_interact_menu_fnc_createAction;

[
    _object,
    0,
    ["ACE_MainActions"],
    _action
] call ACEFUNC(interact_menu,addActionToObject);
