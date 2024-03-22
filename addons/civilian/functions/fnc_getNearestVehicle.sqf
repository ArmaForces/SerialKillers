#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest vehicle for given position.
 *
 * Arguments:
 * 0: Position <POSITION/OBJECT>
 * 1: Search radius <NUMBER> (Optional)
 * 2: Filter function returning true for valid vehicles <FUNC> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_civilian_fnc_getNearestVehicle
 *
 * Public: No
 */

params ["_pos", ["_radius", 500], ["_filterFunction", {true}]];

if (_pos isEqualType objNull) then {
    _pos = getPosATL _pos;
};

private _nearbyVehicles = _pos nearEntities [["Air", "Car", "Motorcycle", "Tank"], _radius]
    select {[_x] call _filterFunction};

private _nearestVehicle = [_nearbyVehicles, _pos] call BIS_fnc_nearestPosition;

if (_nearestVehicle isEqualTo [0, 0, 0]) exitWith {objNull};

_nearestVehicle
