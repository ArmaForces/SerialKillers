#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit", "_id", "_uid", "_name"];
        [QGVAR(playerDisconnected), _this] call CBA_fnc_globalEvent;
    }];

    // Check for AFM Friendly Tracker and auto disable it
    if (EGVAR(common,AFM_Loaded)) then {
        afm_friendly_tracker_enabled = false;
        publicVariable "afm_friendly_tracker_enabled";
    };
};

[QGVAR(playerDisconnected), {
    params ["_unit", "_id", "_uid", "_name"];
    [_unit] call FUNC(deleteUnitMarker);
}];

if (hasInterface) then {
    call FUNC(loop);
};
