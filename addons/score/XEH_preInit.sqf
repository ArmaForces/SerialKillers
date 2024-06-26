#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

// Current scores
GVAR(policeScore) = 0;
GVAR(killersScore) = 0;
// Max scores
GVAR(policeScoreMax) = 40;
// Change over last several seconds
GVAR(policeScoreChange) = 0;
GVAR(killersScoreChange) = 0;
// Last score change time
GVAR(policeScoreLastChangeTime) = CBA_missionTime;
GVAR(killersScoreLastChangeTime) = CBA_missionTime;
// Idle timeouts counter
GVAR(idleTimeouts) = 0;
GVAR(isExtraTime) = false;

// Mission end flag
GVAR(missionEnd) = -1;

ADDON = true;
