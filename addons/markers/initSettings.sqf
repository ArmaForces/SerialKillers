#include "script_component.hpp"

[
    QGVAR(refreshRate),
    "SLIDER",
    [LSTRING(RefreshRate), LSTRING(RefreshRate_Description)],
    LSTRING(DisplayName),
    [0, 60, 5, 0],
    true
] call CBA_fnc_addSetting;
