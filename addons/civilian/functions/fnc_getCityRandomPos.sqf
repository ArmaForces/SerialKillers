#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns random position in given city.
 *
 * Arguments:
 * 0: City namespace <CBA_NAMESPACE>
 * 1: Object to fit in <OBJECT/STRING/CONFIG>
 * 2: If position has to be near road <BOOL>
 * 3: Position can be on road <BOOL>
 * 4: If position has to be near house <BOOL>
 * 5: Empty position search radius <NUMBER>
 *
 * Return Value:
 * 0: Random position inside city <POSITION>
 *
 * Example:
 * [] call afsk_civilian_fnc_getCityRandomPos
 *
 * Public: No
 */

params ["_cityNamespace", ["_objectType", ""], ["_nearRoad", false], ["_allowOnRoad", true], ["_nearHouse", false], ["_emptyPosSearchRadius", 25]];

private _cityArea = _cityNamespace getVariable QGVAR(cityAreaForRandomPos);

// Function returns position random position in area
private _fnc_randomPos = {
    params ["_cityArea", "_nearRoad", "_allowOnRoad", "_nearHouse", "_emptyPosSearchRadius"];
    private _randomPos = [];
    while {_randomPos isEqualTo []} do {
        _randomPos = [[_cityArea]] call BIS_fnc_randomPos;
        if (!(_randomPos isEqualTo []) && {_nearHouse && {!([_randomPos] call EFUNC(common,isHouseNearby))}}) then {
            _randomPos = [];
        };
        if (!(_randomPos isEqualTo []) && {!(_allowOnRoad) && {isOnRoad _randomPos}}) then {
            _randomPos = [];
        };
        if (!(_randomPos isEqualTo []) && {_nearRoad && {!([_randomPos] call EFUNC(common,isRoadNearby))}}) then {
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
if (_objectType isEqualTo "") exitWith {[_cityArea, _nearRoad, _allowOnRoad, _nearHouse, _emptyPosSearchRadius] call _fnc_randomPos};
private _cityArea = _cityNamespace getVariable QGVAR(cityArea);
private _randomPos = [];
private _loopLimit = 250;
// Loop until acquired random empty pos is within location area (or loop limit reached)
while {(_loopLimit >= 0) && {(_randomPos isEqualTo []) || {!(_randomPos inArea _cityArea)}}} do {
    _randomPos = [_cityArea, _nearRoad, _allowOnRoad, _nearHouse, _emptyPosSearchRadius] call _fnc_randomPos;
    _randomPos = _randomPos findEmptyPosition [0, _emptyPosSearchRadius, _objectType];
    _loopLimit = _loopLimit - 1;
};

if (_loopLimit isEqualTo 0) exitWith {[]};

_randomPos
