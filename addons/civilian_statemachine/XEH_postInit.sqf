#include "script_component.hpp"

if (isServer) then {
    private _stateMachineConfig = configFile >> "CfgSerialKillers" >> "CfgStateMachine";
    GVAR(CivilianMovement) = [_stateMachineConfig >> "CivilianMovement"] call CBA_statemachine_fnc_createFromConfig;
    GVAR(CivilianBehaviour) = [_stateMachineConfig >> "CivilianBehaviour"] call CBA_statemachine_fnc_createFromConfig;
};
