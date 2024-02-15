#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function handles police station alarm messages.
 *
 * Arguments:
 * 0: Object which triggered alarm <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_police_fnc_policeStationAlarm
 *
 * Public: No
 */

params ["_object"];

titleText [LLSTRING(Bad_Idea), "PLAIN", 5];

private _nearestTown = [_object] call EFUNC(common,getNearestCityLocation);
private _msg = format [LLSTRING(Alarm), text _nearestTown];

// Show sideChat message to all cops.
[{
    [QEGVAR(common,showSideChatMsg), _this] call CBA_fnc_globalEvent;
}, [WEST, _msg], random(5)] call CBA_fnc_waitAndExecute;
