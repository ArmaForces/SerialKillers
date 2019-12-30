#include "script_component.hpp"

[
    QGVAR(equipmentPresetCustom),
    "CHECKBOX",
    [LSTRING(EquipmentPresetCustom), LSTRING(EquipmentPresetCustom_Description)],
    LSTRING(DisplayName),
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(equipmentPreset),
    "LIST",
    [LSTRING(EquipmentPreset), LSTRING(EquipmentPreset_Description)],
    LSTRING(DisplayName),
    [[0, 1, 2, 3, 4], [LSTRING(EquipmentPreset_Auto), "Vanilla", "RHS - NOT IMPLEMENTED", "CUP - NOT IMPLEMENTED", "CUP + RHS - NOT IMPLEMENTED"]],
    true,
    {},
    true
] call CBA_fnc_addSetting;
