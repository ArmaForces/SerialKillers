#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function runs deleteAt with random index
 *
 * Arguments:
 * 0: Array to delete random element from <ARRAY>
 *
 * Return Value:
 * 0: Deleted element <ANYTHING>
 *
 * Example:
 * [[bob, ted]] call afsk_common_fnc_deleteAtRandom
 *
 * Public: No
 */

params ["_array"];

_array deleteAt (floor (random (count _array)));
