#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(equipmentPreset) = configNull;
GVAR(commonEquipment) = [configNull];
GVAR(policeEquipmentList) = [];
GVAR(policeEquipmentScores) = call CBA_fnc_createNamespace;
GVAR(killersEquipment) = [configNull];

call FUNC(initEquipment);

ADDON = true;
