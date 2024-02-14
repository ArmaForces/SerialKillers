#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function initializes police station for client. Creates vehicle spawners, teleporters and arsenals.
 *
 * Arguments:
 * 0: Police Station Module <LOGIC>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

{
    [_x] call FUNC(initSaveEquipmentAction);
} forEach GVAR(arsenals);

call FUNC(equipmentScoreCheck);
