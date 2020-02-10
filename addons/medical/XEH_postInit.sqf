#include "script_component.hpp"

if (isServer && {GVAR(ACE_Medical_Loaded)}) then {
    // Fatal Damage Source: Either (Vital organ hits and sum of trauma)
    [QACEGVAR(medical,fatalDamageSource), 2, 0, "mission"] call CBA_settings_fnc_set;
    // Player Critical Damage Threshold: 5
    [QACEGVAR(medical,playerDamageThreshold), 5, 0, "mission"] call CBA_settings_fnc_set;
    // Turn off bleeding
    [QACEGVAR(medical,bleedingCoefficient), 0, 0, "mission"] call CBA_settings_fnc_set;
    // Disable advanced bandages
    [QACEGVAR(medical_treatment,advancedBandages), false, 0, "mission"] call CBA_settings_fnc_set;
    // Bandages clear trauma
    [QACEGVAR(medical_treatment,clearTraumaAfterBandage), true, 0, "mission"] call CBA_settings_fnc_set;
    // Disable advanced medications
    [QACEGVAR(medical_treatment,advancedMedication), false, 0, "mission"] call CBA_settings_fnc_set;
};
