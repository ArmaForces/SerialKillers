#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(equipmentPreset) = configNull;
GVAR(commonEquipment) = [configNull];
GVAR(policeEquipment) = [configNull];
GVAR(killersEquipment) = [configNull];

call FUNC(initEquipment);

ADDON = true;
