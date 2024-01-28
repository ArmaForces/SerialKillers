#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

// We need some improvements in determining civilian vehicles limit
GVAR(emptyVehiclesLimit) = GVAR(emptyVehiclesLimitMultiplier) * (5 * count (EGVAR(civilian,cities)));
call FUNC(initVehicles);

ADDON = true;
