#include "script_component.hpp"

[QGVAR(playMusic), {
    playMusic (_this select 0);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(playMusicServer), {
        _this call FUNC(playMusicServer);
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(showMessage), {
    _this call FUNC(showMessage);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    /* Spectator events */
    [QGVAR(initializeSideSpectator), {
        ["Initialize", [player, [playerSide], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(initializeSpectator), {
        ["Initialize", [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(terminateSpectator), {
        ["Terminate"] call BIS_fnc_EGSpectator;
    }] call CBA_fnc_addEventHandler;
};
