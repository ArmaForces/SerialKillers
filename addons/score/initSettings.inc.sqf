[
    QGVAR(killersScoreMax),
    "SLIDER",
    [LSTRING(KillersScoreMax), LSTRING(KillersScoreMax_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [10, 200, 50, 0],
    true
] call CBA_fnc_addSetting;

// Civilian killed score changes

[
    QGVAR(killedCivilianKillersScore),
    "SLIDER",
    [LSTRING(KilledCivilianKillersScore), LSTRING(KilledCivilianKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 1, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(killedCivilianPoliceScore),
    "SLIDER",
    [LSTRING(KilledCivilianPoliceScore), LSTRING(KilledCivilianPoliceScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 1, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(policeKilledCivilianKillersScore),
    "SLIDER",
    [LSTRING(PoliceKilledCivilianKillersScore), LSTRING(PoliceKilledCivilianKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 1, 0],
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

// Cop killed score changes

[
    QGVAR(killedCopKillersScore),
    "SLIDER",
    [LSTRING(KilledCopKillersScore), LSTRING(KilledCopKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(killedCopPoliceScore),
    "SLIDER",
    [LSTRING(KilledCopPoliceScore), LSTRING(KilledCopPoliceScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(copKilledCopKillersScore),
    "SLIDER",
    [LSTRING(CopKilledCopKillersScore), LSTRING(CopKilledCopKillersScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, 2, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(copKilledCopPoliceScore),
    "SLIDER",
    [LSTRING(CopKilledCopPoliceScore), LSTRING(CopKilledCopPoliceScore_Description)],
    [LSTRING(DisplayName), LSTRING(Score)],
    [-10, 10, -1, 0],
    true
] call CBA_fnc_addSetting;

// Time limit

[
    QGVAR(timeLimit),
    "SLIDER",
    [LSTRING(TimeLimit), LSTRING(TimeLimit_Description)],
    [LSTRING(DisplayName), LSTRING(TimeLimit)],
    [-1, 120, 30, 0],
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

// Idle Time
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


// Extra time
[
    QGVAR(timeLimitExtraTime),
    "SLIDER",
    [LSTRING(ExtraTime_Duration), LSTRING(ExtraTime_Duration_Description)],
    [LSTRING(DisplayName), LSTRING(ExtraTime)],
    [-1, 120, 15, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(extraTimeIdleTime),
    "SLIDER",
    [LSTRING(IdleTimeMax), LSTRING(ExtraTime_IdleTime_Description)],
    [LSTRING(DisplayName), LSTRING(ExtraTime)],
    [-1, 900, 150, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(extraTimeIdleTimeoutsMax),
    "SLIDER",
    [LSTRING(IdleTimeoutsMax), LSTRING(ExtraTime_IdleTimeoutsMax_Description)],
    [LSTRING(DisplayName), LSTRING(ExtraTime)],
    [-1, 10, 5, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(extraTimePoliceScoreChange),
    "SLIDER",
    [LSTRING(ExtraTime_IdleTimePoliceScoreChange), LSTRING(ExtraTime_IdleTimePoliceScoreChange_Description)],
    [LSTRING(DisplayName), LSTRING(ExtraTime)],
    [-10, 10, 2, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(extraTimeKillersScoreChange),
    "SLIDER",
    [LSTRING(ExtraTime_IdleTimeKillersScoreChange), LSTRING(ExtraTime_IdleTimeKillersScoreChange_Description)],
    [LSTRING(DisplayName), LSTRING(ExtraTime)],
    [-10, 10, 0, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;
