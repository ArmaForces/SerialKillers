#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(equipmentPreset) = configNull;
// Namespace containing common item name variables with value being loaded properties as namespace
GVAR(commonEquipment) = call CBA_fnc_createNamespace;
GVAR(policeEquipmentList) = [];
GVAR(policeEquipmentScores) = call CBA_fnc_createNamespace;
GVAR(killersStartEquipment) = [];
GVAR(killersStashEquipment) = [];

call FUNC(initEquipment);

ADDON = true;
