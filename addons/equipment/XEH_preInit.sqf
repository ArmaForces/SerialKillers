#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

// Selected equipment preset config
GVAR(equipmentPreset) = configNull;
// Namespace containing common item name variables with value being loaded properties as namespace
GVAR(commonEquipment) = call CBA_fnc_createNamespace;
// Unique police equipment and vehicles lists to prevent config duplicates (especially with different scores)
GVAR(policeEquipmentList) = [];
GVAR(policeVehiclesList) = [];
// Namespace using requiredScore as key and list of unlocked equipment/vehicles as value
GVAR(policeEquipmentScores) = call CBA_fnc_createNamespace;
GVAR(policeVehiclesScores) = call CBA_fnc_createNamespace;
// Killers stuff available to choose from before action begins
GVAR(killersStartEquipment) = [];
// Killers equipment (weapons and stuff) available in stashes
GVAR(killersStashCommonEquipment) = [];
GVAR(killersStashEquipment) = [];

// ACRE radios compatibility
GVAR(policeRadio) = "ACRE_PRC152";
GVAR(killersRadio) = "ACRE_SEM52SL";

call FUNC(initEquipment);

ADDON = true;
