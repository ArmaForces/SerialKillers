#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(ACE_Loaded) = isClass (configFile >> "CfgPatches" >> "ace_common");

GVAR(musicEH) = -1;
GVAR(musicPlaying) = false;
GVAR(musicQueue) = [];

ADDON = true;
