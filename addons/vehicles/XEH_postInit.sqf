#include "script_component.hpp"

if (isServer) then {

};

if (hasInterface) then {
    [QGVAR(carAlarm), FUNC(carAlarm)] call CBA_fnc_addEventHandler;
};
