#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function finds random empty position (that can fit desired object) in given:
 * trigger, location, marker, area [center, a, b, angle, isRectangle, height].
 *
 * Arguments:
 * 0: Object to fit in <OBJECT>
 * 1: Area to search <OBJECT/LOCATION/STRING/ARRAY>
 *
 * Return Value:
 * 0: Empty position <POSITION>
 *    or [] if not found
 *
 * Example:
 * [vehicle player, [position vehicle player, 100, 100, 0, false, -1]] call afsk_common_fnc_getRandomEmptyPosition
 *
 * Public: No
 */

params ["_object", "_area"];

private _emptyPos = [];
private _objectType = typeOf _object;

for "_y" from 0 to 100 step 1 do {
    private _randomPos = [[_area], ["water"]] call BIS_fnc_randomPos;
    _emptyPos = _randomPos findEmptyPosition [0, 25, _objectType];
    if !(_emptyPos isEqualTo [] && {_emptyPos inArea _area}) exitWith {};
};

_emptyPos
