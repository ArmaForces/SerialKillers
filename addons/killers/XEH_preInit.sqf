#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(killersStartPositionsMarkers) = [];
GVAR(startPositions) = call FUNC(initStartPositions);
publicVariable QGVAR(startPositions);

ADDON = true;
