#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

GVAR(jail) = objNull;
GVAR(killersBase) = objNull;
GVAR(killersStashes) = [];
GVAR(policeStations) = [];

if (isServer) then {
    GVAR(killersStartPositions) = [];
};

ADDON = true;
