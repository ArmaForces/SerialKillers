#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (isServer) then {
    // Initialize police stations
    [{EGVAR(modules,policeStations) isNotEqualTo []},{
        [{
            {
                [_x] call FUNC(initPoliceStation);
                // Initialize respawn for given police station
                [WEST, _x] call BIS_fnc_addRespawnPosition;
            } forEach EGVAR(modules,policeStations);

            publicVariable QGVAR(arsenals);
        }] call CBA_fnc_execNextFrame;
    }] call CBA_fnc_waitUntilAndExecute;

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
[{GVAR(arsenals) isNotEqualTo []}, {
    call FUNC(equipmentScoreCheck);
}] call CBA_fnc_waitUntilAndExecute;

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

if (hasInterface) then {

    [QGVAR(createPoliceStationMarkerLocal), {
        _this call FUNC(policeStationMarker);
    }] call CBA_fnc_addEventHandler;

    if !(playerSide isEqualTo WEST) exitWith {};

    // Fill arsenal with starting items
    [{GVAR(arsenals) isNotEqualTo []}, {
        call FUNC(initPoliceStationClient);
    }] call CBA_fnc_waitUntilAndExecute;

    player addEventHandler ["Killed", {
        [QGVAR(copKilled), _this] call CBA_fnc_serverEvent;
    }];
    player addEventHandler ["Respawn", {
        player setUnitLoadout EGVAR(common,playerLoadout);
        [QGVAR(copRespawned), _this] call CBA_fnc_serverEvent;
    }];
};

[QGVAR(showCopKilledNotification), {
    private _msg = _this call FUNC(copKilledMsg);
    [QEGVAR(common,showSideChatMsg), [WEST, _msg]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(showFailedCreatingVehicleNotification), {
    params ["_vehicleName", "_baseName"];
    private _msg = format [LLSTRING(FailedCreatingVehicle), _vehicleName call BIS_fnc_localize, _baseName call BIS_fnc_localize];
    [QEGVAR(common,showSideChatMsg), [WEST, _msg]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
