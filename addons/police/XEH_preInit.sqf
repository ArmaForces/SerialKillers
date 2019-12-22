#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

{
    [_x] call FUNC(initPoliceStation);
} forEach EGVAR(modules,policeStations);

ADDON = true;
