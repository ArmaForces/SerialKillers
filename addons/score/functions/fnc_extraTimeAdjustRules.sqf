#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adjusts settings for extra time.
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

GVAR(idleTimeMax) = GVAR(extraTimeIdleTime);
GVAR(idleTimeouts) = 0;
GVAR(idleTimeoutsMax) = GVAR(extraTimeIdleTimeoutsMax);
GVAR(idleTimeKillersScoreChange) = GVAR(extraTimeKillersScoreChange);
GVAR(idleTimePoliceScoreChange) = GVAR(extraTimePoliceScoreChange);
