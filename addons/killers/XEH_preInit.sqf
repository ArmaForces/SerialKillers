#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

// Start positions markers array for easy deletion after teleportation
GVAR(startPositionsMarkers) = [];
if (isServer) then {
    // Random number of start positions if 0 or -1
    if (GVAR(startPositionsCount) <= 0) then {
        GVAR(startPositionsCount) = ceil (random [10, 15, 20]);
    };
    GVAR(startPositions) = call FUNC(initStartPositions);
    publicVariable QGVAR(startPositions);
};

ADDON = true;
