#include "script_component.hpp"

[
    QGVAR(killersScoreMax),
    "SLIDER",
    [LSTRING(KillersScoreMax), LSTRING(KillersScoreMax_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [10, 200, 50, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(killedCivilianKillersScore),
    "SLIDER",
    [LSTRING(KilledCivilianKillersScore), LSTRING(KilledCivilianKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(killedCivilianPoliceScore),
    "SLIDER",
    [LSTRING(KilledCivilianPoliceScore), LSTRING(KilledCivilianPoliceScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(policeKilledCivilianKillersScore),
    "SLIDER",
    [LSTRING(PoliceKilledCivilianKillersScore), LSTRING(PoliceKilledCivilianKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(policeKilledCivilianPoliceScore),
    "SLIDER",
    [LSTRING(PoliceKilledCivilianPoliceScore), LSTRING(PoliceKilledCivilianPoliceScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, -1, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeLimit),
    "SLIDER",
    [LSTRING(TimeLimit), LSTRING(TimeLimit_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    [-1, 120, 45, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeLimitInstantEnd),
    "CHECKBOX",
    [LSTRING(TimeLimit_InstantEnd), LSTRING(TimeLimit_InstantEnd_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeLimitExtraTime),
    "SLIDER",
    [LSTRING(TimeLimit_ExtraTime), LSTRING(TimeLimit_ExtraTime_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    [-1, 120, 15, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeLimitIdleTime),
    "SLIDER",
    [LSTRING(IdleTimeMax), LSTRING(TimeLimit_IdleTime_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    [-1, 900, 150, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeLimitIdleTimeoutsMax),
    "SLIDER",
    [LSTRING(IdleTimeoutsMax), LSTRING(TimeLimit_IdleTimeoutsMax_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    [-1, 10, 1, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimeMax),
    "SLIDER",
    [LSTRING(IdleTimeMax), LSTRING(IdleTimeMax_Description)],
    [LSTRING(DisplayName), LSTRING(IdleTime)],
    [-1, 900, 300, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimeoutsMax),
    "SLIDER",
    [LSTRING(IdleTimeoutsMax), LSTRING(IdleTimeoutsMax_Description)],
    [LSTRING(DisplayName), LSTRING(IdleTime)],
    [-1, 10, 3, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimePoliceScoreChange),
    "SLIDER",
    [LSTRING(idleTimePoliceScoreChange), LSTRING(idleTimePoliceScoreChange_Description)],
    [LSTRING(DisplayName), LSTRING(IdleTime)],
    [-10, 10, 5, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(idleTimeKillersScoreChange),
    "SLIDER",
    [LSTRING(idleTimeKillersScoreChange), LSTRING(idleTimeKillersScoreChange_Description)],
    [LSTRING(DisplayName), LSTRING(IdleTime)],
    [-10, 10, 0, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

