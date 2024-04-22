#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

// We need some improvements in determining civilian vehicles limit
GVAR(emptyVehiclesLimit) = GVAR(emptyVehiclesCount);

if (isServer) then {
    call FUNC(initVehicles);
};

ADDON = true;
