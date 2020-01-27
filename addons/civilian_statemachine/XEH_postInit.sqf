#include "script_component.hpp"

if (isServer) then {
    [configFile >> "CfgSerialKillers" >> "CivilianMovement"] call CBA_statemachine_fnc_createFromConfig;
    [configFile >> "CfgSerialKillers" >> "CivilianBehaviour"] call CBA_statemachine_fnc_createFromConfig;
};
