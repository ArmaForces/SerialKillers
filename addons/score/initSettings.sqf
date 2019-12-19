#include "script_component.hpp"

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

