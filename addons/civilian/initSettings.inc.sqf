[
    QGVAR(initialCiviliansCount),
    "SLIDER",
    [LSTRING(InitialCiviliansCount), LSTRING(InitialCiviliansCount_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 400, 200, 0],
    true
] call CBA_fnc_addSetting;

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
