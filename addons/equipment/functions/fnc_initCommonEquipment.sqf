#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares common equipment namespace from given config.
 *
 * Arguments:
 * 0: Eqipment config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_equipmentPresetConfig"];

GVAR(commonEquipment) = [_equipmentPresetConfig >> "Common" >> "Equipment", GVAR(commonEquipment)] call FUNC(readConfigToNamespace);
