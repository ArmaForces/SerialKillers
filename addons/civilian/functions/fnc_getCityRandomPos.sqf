#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns random position in given city.
 *
 * Arguments:
 * 0: City namespace <CBA_NAMESPACE>
 * 1: Object (classname/config) to fit in <OBJECT/STRING/CONFIG>
 *
 * Return Value:
 * 0: Random position inside city <POSITION>
 *
 * Example:
 * [] call afsk_common_fnc_getCityRandomPos
 *
 * Public: No
 */

params ["_cityNamespace", ["_objectType", ""], ["_nearRoad", false], ["_emptyPosSearchRadius", 25]];

private _cityPosition = _cityNamespace getVariable QGVAR(Position);
private _cityArea = _cityNamespace getVariable QGVAR(cityArea);
private _cityAreaSize = [_cityArea select 1 select 0, _cityArea select 1 select 1];

// Function returns position random position in area
private _fnc_randomPos = {
    params ["_cityPosition", "_cityAreaSize", "_nearRoad"];
    if (_nearRoad) then {
        private _roads = _cityPosition nearRoads ((_cityAreaSize select 0) max (_cityAreaSize select 1));
        private _randomRoadPos = getPos (selectRandom _roads);
        if (_emptyPosSearchRadius isEqualTo 0) exitWith {_randomRoadPos};
        [[[_randomRoadPos, _emptyPosSearchRadius * 2]]] call BIS_fnc_randomPos;
    } else {
        [[[_cityPosition, [_cityAreaSize select 0, _cityAreaSize select 1, 0, true]]]] call BIS_fnc_randomPos;
    };
};

if (!(_objectType isEqualType "")) then {
    if (_objectType isEqualType configNull) then {
        _objectType = configName _objectType;
    };
    if (_objectType isEqualType objNull) then {
        _objectType = typeOf _objectType;
    };
};

// If no object is given, just random position is enough
if (_objectType isEqualTo "") exitWith {[_cityPosition, _cityAreaSize, _nearRoad] call _fnc_randomPos};

private _location = _cityNamespace getVariable QGVAR(Location);
private _randomPos = [];
private _loopLimit = 100;
// Loop until acquired random empty pos is within location area (or loop limit reached)
while {(_loopLimit >= 0) && {(_randomPos isEqualTo []) || {!(_randomPos inArea _location)}}} do {
    _randomPos = [_cityPosition, _cityAreaSize, _nearRoad] call _fnc_randomPos;
    _randomPos = _randomPos findEmptyPosition [0, _emptyPosSearchRadius, _objectType];
    _loopLimit = _loopLimit - 1;
};

if (_loopLimit isEqualTo 0) exitWith {[]};

_randomPos;
