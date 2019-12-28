#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

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

    // Weights for vehicles and civilians creation
    GVAR(weightCapital) = ceil (random (10));
    GVAR(weightCity) = ceil (random (8));
    GVAR(weightVillage) = ceil (random (6));
    GVAR(weightRural) = ceil (random (10));

    // We need some improvements in determining civilian vehicles limit
    GVAR(emptyVehiclesLimit) = GVAR(emptyVehiclesLimitMultiplier) * 200;
    call FUNC(initVehicles);
};

ADDON = true;
