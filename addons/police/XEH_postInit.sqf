#include "script_component.hpp"

{
    [_x] call FUNC(initPoliceStation);
} forEach EGVAR(modules,policeStations);

[QGVAR(copKilled), {
    _this call FUNC(copKilled);
}] call CBA_fnc_addEventHandler;

[QGVAR(createTeleport), {
    _this call FUNC(createTeleport);
}] call CBA_fnc_addEventHandler;

[QGVAR(policeStationAlarm), {
    _this call FUNC(policeStationAlarm);
}] call CBA_fnc_addEventHandler;

[QGVAR(showMsg), {
    params ["_msg"];
    [WEST, "HQ"] sideChat _msg;
}] call CBA_fnc_addEventHandler;

[QGVAR(teleport), {
    _this call FUNC(teleport);
}] call CBA_fnc_addEventHandler;

if (!isServer) then {
    ["B_Soldier_F", "killed", {
        if (!(local (_this select 0))) exitWith {};
        [QGVAR(copKilled), _this] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addClassEventHandler;
};
