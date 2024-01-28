#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(enabled) = ("SK" isEqualTo (getText (missionConfigFile >> "Header" >> "gameType")));

GVAR(ACE_Loaded) = isClass (configFile >> "CfgPatches" >> "ace_common");
GVAR(ACRE_Loaded) = isClass (configFile >> "CfgPatches" >> "acre_main");
GVAR(AFFT_Loaded) = isClass (configFile >> "CfgPatches" >> "afft_main");
GVAR(CUP_Loaded) = isClass (configFile >> "CfgPatches" >> "cup_common"); // Probably something else, not "cup_common"
GVAR(RHS_Loaded) = isClass (configFile >> "CfgPatches" >> "rhs_common"); // Same here

// Killswitch
if (!GVAR(enabled)) exitWith {};

// Prepare all location types for getNearestLocation function
GVAR(allLocationTypes) = ("true" configClasses (configFile >> "CfgLocationTypes")) apply {configName _x};

// Location names cache namespace (to prevent reading from config every time)
GVAR(locationNames) = call CBA_fnc_createNamespace;

if (isServer) then {
    GVAR(musicEH) = -1;
    GVAR(musicPlaying) = false;
    GVAR(musicQueue) = [];

    GVAR(cities) = call FUNC(getAllMapCities);
};

ADDON = true;
