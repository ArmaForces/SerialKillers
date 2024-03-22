#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

GVAR(arsenals) = [];
GVAR(lastEquipmentUpdateScore) = -1;

call FUNC(initConfig);

ADDON = true;
