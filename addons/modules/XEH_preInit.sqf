#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(jail) = objNull;
GVAR(killersBase) = objNull;
GVAR(killersStartPositions) = [];
GVAR(killersStashes) = [];
GVAR(policeStations) = [];

ADDON = true;
