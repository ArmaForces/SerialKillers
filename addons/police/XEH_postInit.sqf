#include "script_component.hpp"

if (isServer) then {
    // Initialize police stations
    {
        [_x] call FUNC(initPoliceStation);
        // Initialize respawn for given police station
        [WEST, _x] call BIS_fnc_addRespawnPosition;
    } forEach EGVAR(modules,policeStations);

    [QGVAR(copKilled), {
        params ["_unit"];
        // Check if unit was already killed (thanks to new ACE medical)
        if (_unit getVariable [QGVAR(alreadyKilled), false]) exitWith {};
        _unit setVariable [QGVAR(alreadyKilled), true];
        _this call FUNC(copKilled);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(copRespawned), {
        params ["_unit"];
        _unit setVariable [QGVAR(alreadyKilled), false];
    }] call CBA_fnc_addEventHandler;

    // Event triggered when killers try to use police teleport
    [QGVAR(policeStationAlarm), {
        _this call FUNC(policeStationAlarm);
    }] call CBA_fnc_addEventHandler;

    // Event creating new police vehicle
    [QGVAR(spawnVehicle), {
        _this call FUNC(spawnVehicle);
    }] call CBA_fnc_addEventHandler;
};

// Fill arsenal with starting items
call FUNC(equipmentScoreCheck);

// Event creating teleport actions to all police stations
[QGVAR(createTeleport), {
    _this call FUNC(createTeleport);
}] call CBA_fnc_addEventHandler;

// Event triggered when teleport action in police station is used
[QGVAR(teleport), {
    _this call FUNC(teleport);
}] call CBA_fnc_addEventHandler;

[QEGVAR(score,scoreChanged), {
    params ["_side", "_change", ["_reason", ""]];
    if (_side isEqualTo EAST) exitwith {};
    call FUNC(equipmentScoreCheck);
}] call CBA_fnc_addEventHandler;

if (!isServer) then {
    if !(playerSide isEqualTo WEST) exitWith {};
    player addEventHandler ["Killed", {
        [QGVAR(copKilled), _this] call CBA_fnc_serverEvent;
    }];
    player addEventHandler ["Respawn", {
        [QGVAR(copRespawned), _this] call CBA_fnc_serverEvent;
    }];
};
