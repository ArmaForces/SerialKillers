[
    QGVAR(emptyVehiclesLimitMultiplier),
    "LIST",
    [LSTRING(EmptyVehiclesLimit), LSTRING(EmptyVehiclesLimit_Description)],
    [LSTRING(DisplayName), localize "str_dn_vehicles"],
    [[1, 2, 3], [LSTRING(Low), LSTRING(Medium), LSTRING(High)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmEnabled),
    "CHECKBOX",
    [LSTRING(AlarmEnabled), LSTRING(AlarmEnabled_Description)],
    [LSTRING(DisplayName), localize "str_dn_vehicles"],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmAlwaysArmed),
    "CHECKBOX",
    [LSTRING(AlarmAlwaysArmed), LSTRING(AlarmAlwaysArmed_Description)],
    [LSTRING(DisplayName), localize "str_dn_vehicles"],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmDisarmIfFailed),
    "CHECKBOX",
    [LSTRING(AlarmDisarmIfFailed), LSTRING(AlarmDisarmIfFailed_Description)],
    [LSTRING(DisplayName), localize "str_dn_vehicles"],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmMinimumChance),
    "SLIDER",
    [LSTRING(AlarmMinimumChance), LSTRING(AlarmMinimumChance_Description)],
    [LSTRING(DisplayName), localize "str_dn_vehicles"],
    [-1, 1, 0.25, 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;
