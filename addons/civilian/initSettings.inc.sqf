/* Civilians placement */
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
    QGVAR(guaranteedCivilianInEveryLocation),
    "CHECKBOX",
    [LSTRING(GuaranteedCivilianInEveryLocation), LSTRING(GuaranteedCivilianInEveryLocation_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(villageCiviliansWeightMultiplier),
    "SLIDER",
    [LSTRING(VillageCiviliansWeightMultiplier), LSTRING(VillageCiviliansWeightMultiplier_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 20, 1, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cityCiviliansWeightMultiplier),
    "SLIDER",
    [LSTRING(CityCiviliansWeightMultiplier), LSTRING(CityCiviliansWeightMultiplier_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 20, 4, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cityCapitalCiviliansWeightMultiplier),
    "SLIDER",
    [LSTRING(CityCapitalCiviliansWeightMultiplier), LSTRING(CityCapitalCiviliansWeightMultiplier_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 20, 6, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

/* Location Area */
[
    QGVAR(respectCityArea),
    "CHECKBOX",
    [LSTRING(RespectCityArea), LSTRING(RespectCityArea_Description)],
    [LSTRING(DisplayName), LSTRING(LocationArea)],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(customVillageAreaRadius),
    "SLIDER",
    [LSTRING(CustomVillageAreaRadius), LSTRING(CustomVillageAreaRadius_Description)],
    [LSTRING(DisplayName), LSTRING(LocationArea)],
    [0, 2000, 250, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(customCityAreaRadius),
    "SLIDER",
    [LSTRING(CustomCityAreaRadius), LSTRING(CustomCityAreaRadius_Description)],
    [LSTRING(DisplayName), LSTRING(LocationArea)],
    [0, 2000, 500, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(customCityCapitalAreaRadius),
    "SLIDER",
    [LSTRING(CustomCityCapitalAreaRadius), LSTRING(CustomCityCapitalAreaRadius_Description)],
    [LSTRING(DisplayName), LSTRING(LocationArea)],
    [0, 2000, 750, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;
