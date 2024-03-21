#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (hasInterface) then {
    if (GVAR(rulesEnabled)) then {
        call FUNC(createRules);
    };
};
