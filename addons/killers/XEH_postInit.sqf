#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

[QGVAR(killerHandcuffed), {
    _this call FUNC(killerHandcuffed);
}] call CBA_fnc_addEventHandler;

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

// Event for killers starting arsenal initialization
[QGVAR(initStartingEquipment), {
    private _arsenal = EGVAR(modules,killersBase) getVariable "Arsenal";;
    [_arsenal, EGVAR(equipment,killersStartEquipment)] call EFUNC(common,addItemsToArsenal);
    [_arsenal, EGVAR(equipment,killersCivilianEquipment)] call EFUNC(common,addItemsToArsenal);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    // Create stashes markers
    if (playerSide isEqualTo EAST) then {
        [QGVAR(createStashesMarkers), {
            _this call FUNC(createStashesMarkers);
        }] call CBA_fnc_addEventHandler;
    };

    [QGVAR(createTeleport), {
        if !(playerSide isEqualTo EAST) exitWith {};
        _this call FUNC(createTeleport);
    }] call CBA_fnc_addEventHandler;

    // Killer killed EH
    [KILLER_UNIT_CLASS, "killed", {
        INFO("Killer was killed");
        if (!(local (_this select 0))) exitWith {};
        INFO("Killer player was killed");

        [QGVAR(killerKilled), _this] call CBA_fnc_serverEvent;

        [{alive player}, {
            INFO("Killer player has respawned");
            [QGVAR(killerRespawned), [player]] call CBA_fnc_serverEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addClassEventHandler;

    [QGVAR(teleportedToStart), {
        params ["_flag"];
        private _actionID = player addAction ["Teleport back", {
            player setPos getPos (_this select 3)
        }, _flag, 10, true];
        // Wait until player teleports back or times out
        [{player distance (_this select 0) < 10}, {
            // Player teleported back
            player removeAction (_this select 1);
        }, [_flag, _actionID], 10, {
            // Player did not teleport back
            player removeAction (_this select 1);
            [QGVAR(teleportFinished)] call CBA_fnc_localEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addEventHandler;

    // Deletes all teleport actions and markers
    [QGVAR(teleportFinished), {
        call FUNC(deleteStartPositionsMarkers);
        call FUNC(disableTeleport);
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(teleport), {
    params ["_killer", "_destination"];

    if (_destination isEqualType objNull) then {
        _destination = getPos _destination;
    };

    // Mark nearest vehicles for first couple minutes
    [_destination] call FUNC(createMarkersForNearbyVehicles);

    [QEGVAR(common,teleport), [_killer, _destination]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
