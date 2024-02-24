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
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmAlwaysArmed),
    "CHECKBOX",
    [LSTRING(AlarmAlwaysArmed), LSTRING(AlarmAlwaysArmed_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmDisarmIfFailed),
    "CHECKBOX",
    [LSTRING(AlarmDisarmIfFailed), LSTRING(AlarmDisarmIfFailed_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmMinimumChance),
    "SLIDER",
    [LSTRING(AlarmMinimumChance), LSTRING(AlarmMinimumChance_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    [-1, 1, 0.25, 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmDuration),
    "SLIDER",
    [LSTRING(AlarmDuration), LSTRING(AlarmDuration_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    [5, 300, 60, 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmAudibleDistance),
    "SLIDER",
    [LSTRING(AlarmAudibleDistance), LSTRING(AlarmAudibleDistance_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    [100, 1000, 500, 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmCopsNotification),
    "LIST",
    [LSTRING(AlarmCopsNotification), LSTRING(AlarmCopsNotification_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    [[1, 2, 3], [LSTRING(Always), LSTRING(IfCiviliansNearby), LSTRING(Never)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(alarmCopsNotificationDelay),
    "SLIDER",
    [LSTRING(AlarmCopsNotificationDelay), LSTRING(AlarmCopsNotificationDelay_Description)],
    [LSTRING(DisplayName), LSTRING(CarAlarm)],
    [0, 300, 30, 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;
