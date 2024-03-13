#include "script_component.hpp"

if (isServer) then {
    [FUNC(initVehicles)] call CBA_fnc_execNextFrame;

    [QEGVAR(police,policeStationInitialized), {
        params ["_policeStationArea"];
        // Register as blacklisted area for civilian vehicle spawn
        GVAR(vehicleBlacklistedAreas) pushBackUnique _policeStationArea;
    }] call CBA_fnc_addEventHandler;

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
