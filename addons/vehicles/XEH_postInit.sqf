#include "script_component.hpp"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (isServer) then {

    [QGVAR(carAlarm), FUNC(carAlarm)] call CBA_fnc_addEventHandler;
    [QGVAR(disableCarAlarm), FUNC(disableCarAlarm)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [QGVAR(carAlarm), FUNC(carAlarm)] call CBA_fnc_addEventHandler;

    [QGVAR(alarmOff), {
        params ["_vehicle"];

        [QEGVAR(common,showSideChatMsg), [WEST, [_vehicle] call FUNC(vehicleStolenMsg)]] call CBA_fnc_localEvent;
        [_vehicle, true, GVAR(alarmDuration)] call FUNC(carAlarmLoop);
    }] call CBA_fnc_addEventHandler;
};
