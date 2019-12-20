#include "script_component.hpp"

if (isServer) then {
    /* Serverside events */
    [QGVAR(scoreChanged), {
        params ["_side", "_change", ["_reason", ""]];
        if (_side isEqualTo WEST) then {
            [_change, _reason] call FUNC(addPoliceScore);
        } else {
            [_change, _reason] call FUNC(addKillersScore);
        };
        [QGVAR(showScore), [_reason]] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;
};


if (hasInterface) then {
    /* Clientside events */
    [QGVAR(showScore), {
        _this call FUNC(showScore);
    }] call CBA_fnc_addEventHandler;
};
