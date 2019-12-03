#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns given (current as default) time in format hh:mm:ss
 *
 * Arguments:
 * 0: Time to convert <NUMBER>
 *
 * Return Value:
 * 0: Formatted time <STRING>
 *
 * Example:
 * [daytime] call afsk_common_fnc_timeFormat
 *
 * Public: No
 */

params [["_time", daytime]];

// Get _hours from _time by removing decimal part. Eg. 20 from 20.5.
private _hours = floor _time;
// Substract full hours from _time to leave only minutes and seconds.
_time = _time - _hours;
// Get _minutes from _time by removing decimal part after multiplying by 60 (number of minutes in hour).
private _minutes = floor(_time * 60);
// Substract full minutes from _time to leave only seconds.
_time = (_time * 60) - _minutes;
// Add 0 in front of _minutes if it's less than 10.
if (_minutes <= 9) then {
	_minutes = format ["0%1", _minutes];
};
// Get _seconds from _time by removing decimal part after multiplying by 60 (number of seconds in minute).
private _seconds = floor (_time * 60);
// Add 0 in front of _seconds if it's less than 10.
if (_seconds <= 9) then {
	_seconds = format ["0%1", _seconds];
};

// Create output.
format ["%1:%2:%3", _hours, _minutes, _seconds]
