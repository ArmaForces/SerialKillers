#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns random position on the map.
 *
 * Arguments:
 * 0: Object (classname/config) to fit in <OBJECT/STRING/CONFIG>
 * 1: Position must be near road <BOOL>
 * 2: Position can be on road <BOOL>
 * 3: Position must be near house <BOOL>
 * 4: Search radius for empty position <NUMBER>
 * 5: Blacklisted areas <ARRAY<OBJECT/STRING/AREA/LOCATION>>
 *
 * Return Value:
 * 0: Random position on the map <POSITION>
 *
 * Example:
 * [] call afsk_common_fnc_getRandomPos
 *
 * Public: No
 */

params [
    ["_objectType", ""],
    ["_nearRoad", false],
    ["_allowOnRoad", true],
    ["_nearHouse", false],
    ["_emptyPosSearchRadius", 25],
    ["_blacklistedAreas", []]];

// Function returns random position
private _fnc_randomPos = {
    params ["_nearRoad", "_allowOnRoad", "_nearHouse", "_blacklistedAreas"];
    private _randomPos = [];
    while {_randomPos isEqualTo []} do {
        _randomPos = [nil, _blacklistedAreas] call BIS_fnc_randomPos;
        if (!(_randomPos isEqualTo []) && {_nearHouse && {!([_randomPos] call FUNC(isHouseNearby))}}) then {
            _randomPos = [];
        };
        if (!(_randomPos isEqualTo []) && {!(_allowOnRoad) && {isOnRoad _randomPos}}) then {
            _randomPos = [];
        };
        if (!(_randomPos isEqualTo []) && {_nearRoad && {!([_randomPos] call FUNC(isRoadNearby))}}) then {
            _randomPos = [];
        };
    };
    _randomPos
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
if (_objectType isEqualTo "") exitWith {[_nearRoad, _allowOnRoad, _nearHouse, _blacklistedAreas] call _fnc_randomPos};

private _randomPos = [];
private _loopLimit = 250;
// Loop until acquired random empty pos is within location area (or loop limit reached)
while {(_loopLimit >= 0) && {(_randomPos isEqualTo [])}} do {
    _randomPos = [_nearRoad, _allowOnRoad, _nearHouse, _blacklistedAreas] call _fnc_randomPos;
    _randomPos = _randomPos findEmptyPosition [0, _emptyPosSearchRadius, _objectType];
    _loopLimit = _loopLimit - 1;
};

if (_loopLimit isEqualTo 0) exitWith {[]};

_randomPos;
