#include "script_component.hpp"

[
    QGVAR(startPositionsCount),
    "SLIDER",
    [LSTRING(StartPositionsCount), LSTRING(StartPositionsCount_Description)],
    LSTRING(DisplayName),
    [-1, 30, 10, 0],
    true
] call CBA_fnc_addSetting;
