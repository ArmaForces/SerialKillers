#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes killers main base.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call afsk_killers_fnc_initKillersBase
 *
 * Public: No
 */

private _killersBase = EGVAR(modules,killersBase);

// Create teleporter to all start positions
private _flag = "Flag_Red_F" createVehicle (getPos _killersBase);
_flag setVariable ["killersBase", _killersBase, true];
_killersBase setVariable ["Teleporter", _flag, true];
[QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;

// Create arsenal
private _box = createVehicle ["B_CargoNet_01_ammo_F", (getPos _killersBase), [], 0, "NONE"];
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
_killersBase setVariable ["Arsenal", _box, true];
_box setVariable ["killersBase", _killersBase, true];
[_box, EGVAR(equipment,killersStartEquipment)] call EFUNC(common,addItemsToArsenal);
[_box, EGVAR(equipment,killersCivilianEquipment)] call EFUNC(common,addItemsToArsenal);
