#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Sends notification of a car alarm according to configured settings.
 *
 * Arguments:
 * 0: Vehicle which has alarm going off <OBJECT>
 *
 * Return Value:
 * True if notification was shown <BOOL>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_vehicle"];

if (!isServer) exitWith {};

// No notification
if (GVAR(alarmCopsNotification) isEqualTo 3) exitWith { false };

private _notify = if (GVAR(alarmCopsNotification) isEqualTo 1) then {
    // Always notify
    true
} else {
    // Notify only if civilians nearby (alarmAudibleDistance/2 as no one would really care about an alarm far from him)
    private _nearbyUnits = _vehicle nearEntities ["Man", GVAR(alarmAudibleDistance)/2];
    private _anyNearbyUnrestrainedCivilians = _nearbyUnits
        findIf {alive _x && {side _x isEqualTo CIVILIAN && {!([_x] call EFUNC(jail,isHandcuffed))}}} != -1;

    [false, true] select (_anyNearbyUnrestrainedCivilians)
};

if (_notify) exitWith {
    LOG("Cops are notified about a car alarm.");

    [QGVAR(showCarAlarmNotification), [_vehicle]] call CBA_fnc_globalEvent;

    true
};

LOG("Cops were not notified about a car alarm.");

false
