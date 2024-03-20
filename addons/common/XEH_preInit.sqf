#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

INFO_1("SerialKillers version %1",QUOTE(VERSION_STR));

GVAR(enabled) = (QUOTE(SK_GAME_TYPE) isEqualTo (getText (missionConfigFile >> "Header" >> "gameType")));

// Killswitch
if (!GVAR(enabled)) then {
    INFO_1("Mission is missing '%1' gameType Header. SerialKillers framework will be disabled.",QUOTE(SK_GAME_TYPE));
} else {
    INFO_1("Mission is configured for '%1' gameType. SerialKillers framework will be enabled.",QUOTE(SK_GAME_TYPE));
};

GVAR(ACE_Loaded) = isClass (configFile >> "CfgPatches" >> "ace_common");
GVAR(ACRE_Loaded) = isClass (configFile >> "CfgPatches" >> "acre_main");
GVAR(AFFT_Loaded) = isClass (configFile >> "CfgPatches" >> "afft_main");
GVAR(CUP_Loaded) = isClass (configFile >> "CfgPatches" >> "CUP_Vehicles_Core");
GVAR(RHS_Loaded) = isClass (configFile >> "CfgPatches" >> "rhssaf_main_loadorder");

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
