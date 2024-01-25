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

[{EGVAR(modules,killersBase) isNotEqualTo objNull}, {
    private _killersBase = EGVAR(modules,killersBase);

    // Create teleporter to all start positions
    private _flag = "Flag_Red_F" createVehicle (getPos _killersBase);
    _flag setVariable ["killersBase", _killersBase, true];
    _killersBase setVariable ["Teleporter", _flag, true];
    [QGVAR(createTeleport), [_flag]] call CBA_fnc_globalEventJIP;

    LOG_1("Flag created at %1", getPos _flag);

    // Create arsenal
    private _box = createVehicle ["B_CargoNet_01_ammo_F", (getPos _killersBase), [], 0, "NONE"];
    clearItemCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    _killersBase setVariable ["Arsenal", _box, true];
    _box setVariable ["killersBase", _killersBase, true];
    [QGVAR(initStartingEquipment)] call CBA_fnc_globalEventJIP;

    LOG_1("Arsenal created at %1", getPos _box);
}, [], 90, {
    WARNING("Killers base could not be initialized!");
}] call CBA_fnc_waitUntilAndExecute;

nil
