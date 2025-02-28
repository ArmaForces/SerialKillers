#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit", "_id", "_uid", "_name"];
        [QGVAR(playerDisconnected), _this] call CBA_fnc_globalEvent;
    }];

    // Check for AFM Friendly Tracker and auto disable it
    if (EGVAR(common,AFFT_Loaded)) then {
        afft_friendly_tracker_enabled = false;
        publicVariable "afft_friendly_tracker_enabled";
    };
};

[QGVAR(playerDisconnected), {
    params ["_unit", "_id", "_uid", "_name"];
    [_unit] call FUNC(deleteUnitMarker);
}];

[QGVAR(deleteUnitMarker), {
    _this call FUNC(deleteUnitMarker);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    call FUNC(loop);

    if (playerSide isEqualTo WEST) exitWith {
        [QEGVAR(killers,killerKilled), {
            [QGVAR(deleteUnitMarker), [_this select 0]] call CBA_fnc_localEvent;
        }] call CBA_fnc_addEventHandler;
    };

    if (playerSide isEqualTo EAST) exitWith {
        [QEGVAR(killers,killerKilled), {
            [_this select 0] call FUNC(markerDecayLocal);
        }] call CBA_fnc_addEventHandler;
    };
};
