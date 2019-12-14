#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

// Current scores
GVAR(policeScore) = 0;
GVAR(killersScore) = 0;
// Max scores
GVAR(policeScoreMax) = 40;
GVAR(killersScoreMax) = 50;
// Change over last several seconds
GVAR(policeScoreChange) = 0;
GVAR(killersScoreChange) = 0;

[WEST, 0] call BIS_fnc_respawnTickets;
[EAST, 0] call BIS_fnc_respawnTickets;

ADDON = true;
