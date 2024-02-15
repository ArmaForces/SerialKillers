#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// We need some improvements in determining civilian vehicles limit
GVAR(emptyVehiclesLimit) = 500;

if (isServer) then {
    GVAR(vehicleBlacklistedAreas) = [];
};

ADDON = true;
