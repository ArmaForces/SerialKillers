#include "script_component.hpp"

if (isServer) then {
    [QGVAR(free), {
        _this call FUNC(free);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(imprison), {
        _this call FUNC(imprison);
    }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    if (playerSide isEqualTo EAST) then {
        // Add local EH for release from prison. Supports ACE captives tie/untie.
        if (EGVAR(common,ACE_Loaded)) then {
            // Add ACE EH for handcuffing
            [QACEGVAR(captives,setHandcuffed), {
                params ["_unit", "_isHandcuffed"];
                if (!(_unit isEqualTo player) || {_isHandcuffed}) exitWith {};
                if (_unit getVariable [QGVAR(isImprisoned), false]) then {
                    [QGVAR(free), [player]] call CBA_fnc_serverEvent;
                };
            }] call CBA_fnc_addEventHandler;
        } else {
            // Add own EH for release
            [QGVAR(released), {
                params ["_unit"];
                if (!(_unit isEqualTo player)) exitWith {};
                if (_unit getVariable [QGVAR(isImprisoned), false]) then {
                    [QGVAR(free), [player]] call CBA_fnc_serverEvent;
                };
            }] call CBA_fnc_addEventHandler;
        };
    };
};
