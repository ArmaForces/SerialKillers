#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Displays notification of a car alarm according to configured settings.
 *
 * Arguments:
 * 0: Vehicle which has alarm going off <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle"];

// No notification
if (GVAR(alarmCopsNotification isEqualTo 3)) exitWith {};

private _notify = if (GVAR(alarmCopsNotification) isEqualTo 1) then {
    // Always notify
    true
} else {
    // Notify only if civilians nearby (alarmAudibleDistance/2 as no one would really care about an alarm far from him)
    private _nearbyUnits = _vehicle nearEntities ["Man", GVAR(alarmAudibleDistance)/2];
    private _anyNearbyUnrestrainedCivilians = _nearbyUnits
        findIf {alive _x && {side _x isEqualTo CIVILIAN} && {!([_x] call FUNC(jail,isHandcuffed))}} != -1;

    if (_anyNearbyUnrestrainedCivilians) then { true } else { false };
};

if (_notify) then {
    [QEGVAR(common,showSideChatMsg), [WEST, _this call FUNC(vehicleStolenMsg)]] call CBA_fnc_localEvent;
};

nil
