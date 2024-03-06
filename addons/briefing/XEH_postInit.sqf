#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (hasInterface) then {
    call FUNC(createRules);
};
