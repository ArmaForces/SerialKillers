#include "script_component.hpp"

if (isServer) then {

    [QGVAR(carAlarm), FUNC(carAlarm)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [QGVAR(carAlarm), FUNC(carAlarm)] call CBA_fnc_addEventHandler;

    [QGVAR(alarmOff), {
        params ["_vehicle"];

        [QEGVAR(common,showSideChatMsg), [WEST, [_vehicle] call FUNC(vehicleStolenMsg)]] call CBA_fnc_localEvent;
        [_vehicle, true, 120] call FUNC(carAlarmLoop);
    }] call CBA_fnc_addEventHandler;
};
