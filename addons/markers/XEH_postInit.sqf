#include "script_component.hpp"

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

[QEGVAR(killers,killerKilled), {
    _this call FUNC(deleteUnitMarker);
}] call CBA_fnc_addEventHandler;

[QEGVAR(police,copKilled), {
    _this call FUNC(deleteUnitMarker);
}] call CBA_fnc_addEventHandler;

[QGVAR(playerDisconnected), {
    params ["_unit", "_id", "_uid", "_name"];
    [_unit] call FUNC(deleteUnitMarker);
}];

[QGVAR(deleteUnitMarker), {
    _this call FUNC(deleteUnitMarker);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    call FUNC(loop);
};
