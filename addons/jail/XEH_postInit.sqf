#include "script_component.hpp"

if (isServer) then {
    [QGVAR(free), {
        _this call FUNC(free);
    }] call CBA_fnc_addEventHandler;
};