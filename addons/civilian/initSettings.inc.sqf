[
    QGVAR(initialCiviliansCount),
    "SLIDER",
    [LSTRING(InitialCiviliansCount), LSTRING(InitialCiviliansCount_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 400, 200, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(respectCityArea),
    "CHECKBOX",
    [LSTRING(RespectCityArea), LSTRING(RespectCityArea_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;
