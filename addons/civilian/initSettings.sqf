#include "script_component.hpp"

[
    QGVAR(initialCiviliansCount),
    "SLIDER",
    [LSTRING(InitialCiviliansCount), LSTRING(InitialCiviliansCount_Description)],
    [LSTRING(DisplayName), localize "str_civilian"],
    [0, 400, 200, 0],
    true
] call CBA_fnc_addSetting;
