#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

if (isServer) then {
    // Create namespace for linking location classname with city
    GVAR(citiesLocations) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(citiesLocations);
    // All cities and civilians
    GVAR(cities) = [];
    GVAR(civilians) = [];
    // Maximum civilians count (TODO: as setting with randomization options)
    GVAR(civiliansCount) = 100 + floor (random (101));

    // Initialize all cities found on the map
    {
        GVAR(cities) pushBack ([_x] call FUNC(initCity));
    } forEach EGVAR(common,cities);

    publicVariable QGVAR(cities);

    GVAR(emptyVehiclesLimit) = 200;

    call FUNC(initVehicles);
};

ADDON = true;
