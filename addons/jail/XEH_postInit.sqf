#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

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
    if (playerSide isEqualTo EAST) then {
        // Add local EH for release from prison. Supports ACE captives tie/untie.
        call FUNC(initReleaseEventHandler);
    };
};
