#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns nearest city for given unit/position.
 * If not available returns objNull
 *
 * Arguments:
 * 0: Object/position <OBJECT/POSITION>
 *
 * Return Value:
 * 0: Nearest city logic <LOGIC> or objNull if not found
 *
 * Example:
 * [player] call afsk_civilian_fnc_getNearestCity
 *
 * Public: No
 */

params ["_position"];

if (_position isEqualType objNull) then {
    _position = getPos _position;
};

// Find nearest city location and corresponding city namespace
_nearestTown = [_position] call EFUNC(common,nearestLocation);
if (_nearestTown isEqualTo locationNull) then {
    // Try to increase radius first
    _nearestTown = [_position, 7500] call EFUNC(common,nearestLocation);
};
if (_nearestTown isEqualTo locationNull) exitWith {objNull};

// Return city namespace or objNull if not found
[_nearestTown] call FUNC(getCityByLocation);
