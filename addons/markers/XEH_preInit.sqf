#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

GVAR(markersToDelete) = [];

ADDON = true;
