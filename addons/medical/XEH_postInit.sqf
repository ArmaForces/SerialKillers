#include "script_component.hpp"

if (GVAR(ACE_Medical_Loaded)) then {
    // Disable FAKs to ACE items conversion
    [QACEGVAR(medical_treatment,convertItems), 2, 1, "mission"] call CBA_settings_fnc_set;

    // Disable ACE HandleDamage EH
    if (hasInterface) then {
        [{!(player getVariable [QACEGVAR(medical,HandleDamageEHID), -1] isEqualTo -1)}, {
            player removeEventHandler ["HandleDamage", player getVariable QACEGVAR(medical,HandleDamageEHID)];
        }, [], 5, {
            WARNING("Something went wrong and ACE Medical HandleDamage EH could not be removed.");
        }] call CBA_fnc_waitUntilAndExecute;
    };

    // Remove ACE HandleDamage EH for all AIs
    if (isServer) then {
        {
            [{!(_this getVariable [QACEGVAR(medical,HandleDamageEHID), -1] isEqualTo -1)}, {
                _this removeEventHandler ["HandleDamage", _this getVariable QACEGVAR(medical,HandleDamageEHID)];
            }, _x, 5, {
                WARNING("Something went wrong and ACE Medical HandleDamage EH could not be removed.");
            }] call CBA_fnc_waitUntilAndExecute;
        } forEach EGVAR(civilian,civilians)
    };
};
