#include "script_component.hpp"

[QGVAR(killerKilled), {
    params ["_unit"];
    // Check if unit was already killed (thanks to new ACE medical)
    if (_unit getVariable [QGVAR(alreadyKilled), false]) exitWith {};
    _unit setVariable [QGVAR(alreadyKilled), true];
    _this call FUNC(killerKilled);
}] call CBA_fnc_addEventHandler;

[QGVAR(killerRespawned), {
    _this call FUNC(killerRespawned);
}] call CBA_fnc_addEventHandler;

// Start positions markers array for easy deletion after teleportation
GVAR(startPositionsMarkers) = [];
if (isServer) then {
    // Random number of start positions if 0 or -1
    if (GVAR(startPositionsCount) <= 0) then {
        GVAR(startPositionsCount) = ceil (random [10, 15, 20]);
    };
    // Namespace containing location name - position connection
    GVAR(startPositions) = call FUNC(initStartPositions);
    publicVariable QGVAR(startPositions);
    call FUNC(initKillersBase);
    call FUNC(initKillersStashes);
};

if (hasInterface) then {
    [QGVAR(createTeleport), {
        if !(playerSide isEqualTo EAST) exitWith {};
        _this call FUNC(createTeleport);
    }] call CBA_fnc_addEventHandler;

    // Killer killed EH
    ["C_man_p_fugitive_F", "killed", {
        if (!(local (_this select 0))) exitWith {};
        [QGVAR(killerKilled), _this] call CBA_fnc_serverEvent;
        [{alive player}, {
            [QGVAR(killerRespawned), [player]] call CBA_fnc_serverEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addClassEventHandler;
};
