#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function triggers car alarm on given vehicle.
 *
 * Arguments:
 * 0: Vehicle which has alarm turned on <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#define ALARM_INTERVAL 0.5
#define ALARM_LENGTH 10
#define MAX_DISTANCE GVAR(alarmAudibleDistance)
#define DEFAULT_PITCH 1
#define SOUND_WITHOUT_MUFFLING 2

params ["_vehicle", "_lightsOn", "_remainingDuration", ["_currentSoundDuration", 999]];

_vehicle setPilotLight _lightsOn;
if (_currentSoundDuration > ALARM_LENGTH) then {
    _vehicle say3D ["CarAlarm", MAX_DISTANCE, DEFAULT_PITCH, SOUND_WITHOUT_MUFFLING];
    _currentSoundDuration = ALARM_INTERVAL;
} else {
    _currentSoundDuration = _currentSoundDuration + ALARM_INTERVAL;
};

_remainingDuration = _remainingDuration - ALARM_INTERVAL;

// player sideChat format ["Remaining alarm: %1", _remainingDuration];

if (_remainingDuration < 1 || {!alive _vehicle}) exitWith {
    // player sideChat "Ending alarm";
    _vehicle setVariable [QGVAR(alarmOn), false, true];
    _vehicle setPilotLight false;
};

[FUNC(carAlarmLoop), [_vehicle, !_lightsOn, _remainingDuration, _currentSoundDuration], ALARM_INTERVAL] call CBA_fnc_waitAndExecute;
