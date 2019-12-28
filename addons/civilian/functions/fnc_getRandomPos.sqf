#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns random position on the map.
 *
 * Arguments:
 * 0: Object (classname/config) to fit in <OBJECT/STRING/CONFIG>
 * 1: Position must be near road <BOOL>
 * 2: Search radius for empty position
 *
 * Return Value:
 * 0: Random position on the map <POSITION>
 *
 * Example:
 * [] call afsk_common_fnc_getRandomPos
 *
 * Public: No
 */

params [["_objectType", ""], ["_nearRoad", false], ["_emptyPosSearchRadius", 25]];

// Function returns random position
private _fnc_randomPos = {
    params ["_nearRoad", "_emptyPosSearchRadius"];
    if (_nearRoad) then {
        private _randomPos = [];
        while {_randomPos isEqualTo []} do {
            private _randomMapPos = [] call BIS_fnc_randomPos;
            private _roads = _randomMapPos nearRoads 100;
            if (!(_roads isEqualTo [])) then {
                private _randomRoadPos = getPos (selectRandom _roads);
                if (_emptyPosSearchRadius isEqualTo 0) exitWith {_randomRoadPos};
                _randomPos = [[[_randomRoadPos, _emptyPosSearchRadius * 2]]] call BIS_fnc_randomPos;
            };
        };
        _randomPos
    } else {
        [] call BIS_fnc_randomPos;
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
if (_objectType isEqualTo "") exitWith {[_nearRoad, _emptyPosSearchRadius] call _fnc_randomPos};

private _randomPos = [];
private _loopLimit = 100;
// Loop until acquired random empty pos is within location area (or loop limit reached)
while {(_loopLimit >= 0) && {(_randomPos isEqualTo [])}} do {
    _randomPos = [_nearRoad, _emptyPosSearchRadius] call _fnc_randomPos;
    _randomPos = _randomPos findEmptyPosition [0, _emptyPosSearchRadius, _objectType];
    _loopLimit = _loopLimit - 1;
};

if (_loopLimit isEqualTo 0) exitWith {[]};

_randomPos;
