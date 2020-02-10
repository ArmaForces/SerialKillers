#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest vehicle for given position.
 *
 * Arguments:
 * 0: Position <POSITION/OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call afsk_civilian_fnc_getNearestVehicle
 *
 * Public: No
 */

params ["_pos", ["_radius", 500]];

if (_pos isEqualType objNull) then {
    _pos = getPos _pos;
};

private _nearbyVehicles = _pos nearEntities [["Air", "Car", "Motorcycle", "Tank"], _radius];

private _vehiclesSorted = [_nearbyVehicles, _pos] call BIS_fnc_nearestPosition;

_vehiclesSorted param [0, objNull]
