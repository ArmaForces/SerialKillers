#include "script_component.hpp"

if (isServer) then {
    private _stateMachineConfig = configFile >> "CfgSerialKillers" >> "CfgStateMachine";
    [_stateMachineConfig >> "CivilianMovement"] call CBA_statemachine_fnc_createFromConfig;
    [_stateMachineConfig >> "CivilianBehaviour"] call CBA_statemachine_fnc_createFromConfig;
};
