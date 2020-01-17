#include "script_component.hpp"

{
    [_x] call FUNC(initPoliceStation);
} forEach EGVAR(modules,policeStations);

call FUNC(equipmentScoreCheck);

[QGVAR(copKilled), {
    params ["_unit"];
    // Check if unit was already killed (thanks to new ACE medical)
    if (_unit getVariable [QGVAR(ALREADY_KILLED), false]) exitWith {};
    _unit setVariable [QGVAR(ALREADY_KILLED), true];
    _this call FUNC(copKilled);
}] call CBA_fnc_addEventHandler;

[QGVAR(createTeleport), {
    _this call FUNC(createTeleport);
}] call CBA_fnc_addEventHandler;

[QGVAR(policeStationAlarm), {
    _this call FUNC(policeStationAlarm);
}] call CBA_fnc_addEventHandler;

[QGVAR(teleport), {
    _this call FUNC(teleport);
}] call CBA_fnc_addEventHandler;

[QEGVAR(score,scoreChanged), {
    params ["_side", "_change", ["_reason", ""]];
    if (_side isEqualTo EAST) exitwith {};
    call FUNC(equipmentScoreCheck);
}] call CBA_fnc_addEventHandler;

if (!isServer) then {
    ["B_Soldier_F", "killed", {
        if (!(local (_this select 0))) exitWith {};
        [QGVAR(copKilled), _this] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addClassEventHandler;
};
