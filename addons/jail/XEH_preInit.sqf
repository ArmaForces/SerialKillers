#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

// All prisoners, synced by server
GVAR(prisoners) = [];
// Variable storing prisoner - holdActionID connection
if (!(EGVAR(common,ACE_Loaded))) then {
    GVAR(releaseActions) = call CBA_fnc_createNamespace;
};

ADDON = true;
