#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

// We need some improvements in determining civilian vehicles limit
GVAR(emptyVehiclesLimit) = 500;

if (isServer) then {
    call FUNC(initVehicles);
};

ADDON = true;
