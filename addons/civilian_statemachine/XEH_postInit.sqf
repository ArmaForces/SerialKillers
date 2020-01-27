#include "script_component.hpp"

if (isServer) then {
    [configFile >> "CfgSerialKillers" >> "Civilian_Statemachine"] call CBA_statemachine_fnc_createFromConfig;
};
