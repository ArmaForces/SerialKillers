#include "script_component.hpp"

[QGVAR(playMusic), {
    playMusic (_this select 0);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(playMusicServer), {
        _this call FUNC(playMusicServer);
    }] call CBA_fnc_addEventHandler;
};
