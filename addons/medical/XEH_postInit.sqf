#include "script_component.hpp"

if (GVAR(ACE_Medical_Loaded)) then {
    // Disable FAKs to ACE items conversion
    [QACEGVAR(medical_treatment,convertItems), 2, 1, "mission"] call CBA_settings_fnc_set;
};

if (hasInterface) then {
    player removeAllEventHandlers "HandleDamage";
};
