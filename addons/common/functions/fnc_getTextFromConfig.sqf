#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads config for killers stuff.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_property", "_defaultConfig", "_missionConfig"];

private _result = getText (_missionConfig >> _property);

if (_result isEqualTo "") then {
    _result = getText (_defaultConfig >> _property);
    TRACE_3("Loaded property %1 from %2. Retrieved value: %3",_property,str _defaultConfig,_result);
} else {
    TRACE_3("Loaded property %1 from %2. Retrieved value: %3",_property,str _missionConfig,_result);
};

_result
