#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

GVAR(killersRespawnMarker) = "";

ADDON = true;
