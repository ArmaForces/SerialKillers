#include "script_component.hpp"

[QGVAR(killerKilled), {
    _this call FUNC(killerKilled);
}] call CBA_fnc_addEventHandler;

[QGVAR(killerRespawned), {
    _this call FUNC(killerRespawned);
}] call CBA_fnc_addEventHandler;

[QGVAR(teleport), {
    params ["_teleporter", "_caller", "_destination"];
    _caller setPos (getPos _destination);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    call FUNC(initKillersBase);
    call FUNC(initKillersStashes);
};

if (hasInterface) then {
    [QGVAR(createTeleport), {
        if !(playerSide isEqualTo EAST) exitWith {};
        _this call FUNC(createTeleport);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(showMsg), {
        params ["_msg"];
        [EAST, "HQ"] sideChat _msg;
    }] call CBA_fnc_addEventHandler;

    // Killer killed EH
    ["O_Soldier_F", "killed", {
        if (!(local (_this select 0))) exitWith {};
        [QGVAR(killerKilled), _this] call CBA_fnc_serverEvent;
        [{alive player}, {
            [QGVAR(killerRespawned), [player]] call CBA_fnc_serverEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addClassEventHandler;
};
