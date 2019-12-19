#include "script_component.hpp"

[
    QGVAR(killersScoreMax),
    "SLIDER",
    [LSTRING(KillersScoreMax), LSTRING(KillersScoreMax_Description)],
    LSTRING(DisplayName),
    [10, 200, 50, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimeMax),
    "SLIDER",
    [LSTRING(IdleTimeMax), LSTRING(IdleTimeMax_Description)],
    LSTRING(DisplayName),
    [-1, 900, 300, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimeoutsMax),
    "SLIDER",
    [LSTRING(IdleTimeoutsMax), LSTRING(IdleTimeoutsMax_Description)],
    LSTRING(DisplayName),
    [-1, 10, 3, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

