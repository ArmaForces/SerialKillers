#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(killersStartPositionsMarkers) = [];

if (isServer) then {
    call FUNC(initKillersBase);
};

ADDON = true;
