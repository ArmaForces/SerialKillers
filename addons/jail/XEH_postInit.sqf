#include "script_component.hpp"

// Jail module
GVAR(jail) = EGVAR(modules,jail);

if (isServer) then {
    [QGVAR(free), {
        _this call FUNC(free);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(freeAll), {
        _this call FUNC(freeAll);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(imprison), {
        _this call FUNC(imprison);
    }] call CBA_fnc_addEventHandler;

    if (!(GVAR(jail) isEqualTo objNull)) then {
        GVAR(jailMarker) = call FUNC(jailMarker);
        call FUNC(createKillersRespawn);
    } else {
        ERROR("Jail not detected!");
    };
};

if (hasInterface) then {
    // TODO: Extract to 2 separate functions.
    if (playerSide isEqualTo EAST) then {
        // Add local EH for release from prison. Supports ACE captives tie/untie.
        if (EGVAR(common,ACE_Loaded)) then {
            // Add ACE EH for handcuffing
            [QACEGVAR(captives,setHandcuffed), {
                params ["_unit", "_isHandcuffed"];
                if !(_unit isEqualTo player) exitWith {};
                if (_isHandcuffed) exitWith {
                    [QEGVAR(killers,killerHandcuffed), [_unit]] call CBA_fnc_serverEvent;
                };
                if (_unit getVariable [QGVAR(isImprisoned), false]) then {
                    [QGVAR(free), [player]] call CBA_fnc_serverEvent;
                };
            }] call CBA_fnc_addEventHandler;
        } else {
            // Add/remove prisoner release action EH for EAST only
            [QGVAR(addReleaseAction), {
                _this call FUNC(addReleaseAction);
            }] call CBA_fnc_addEventHandler;
            [QGVAR(removeReleaseAction), {
                _this call FUNC(removeReleaseAction);
            }] call CBA_fnc_addEventHandler;

            // Add own EH for release
            [QGVAR(released), {
                params ["_unit"];
                if (!(_unit isEqualTo player)) exitWith {};
                if (_unit getVariable [QGVAR(isImprisoned), false]) then {
                    [QGVAR(free), [player]] call CBA_fnc_serverEvent;
                };
            }] call CBA_fnc_addEventHandler;

            // JIP compatibility for own release action
            {
                [QGVAR(addReleaseAction), [_x]] call CBA_fnc_localEvent;
            } forEach GVAR(prisoners);
        };
    };
};
