#include "script_component.hpp"

[QGVAR(initCivilian), {
    _this call FUNC(initCivilian);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(civilianKilled), {
        _this call FUNC(civilianKilled);
    }] call CBA_fnc_addEventHandler;
};
