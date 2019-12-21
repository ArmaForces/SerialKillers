#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(AFM_Loaded) = isClass (configFile >> "CfgPatches" >> "afm_common");

GVAR(musicEH) = -1;
GVAR(musicPlaying) = false;
GVAR(musicQueue) = [];

ADDON = true;
