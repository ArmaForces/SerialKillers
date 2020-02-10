#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(ACE_Medical_Loaded) = isClass (configFile >> "CfgPatches" >> "ace_medical_engine");

ADDON = true;
