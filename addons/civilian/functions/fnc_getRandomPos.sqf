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
 *
 * Return Value:
 * 0: Random position on the map <POSITION>
 *
 * Example:
 * [] call afsk_common_fnc_getRandomPos
 *
 * Public: No
 */

// For now for compatibility, will remove this function later on
_this call EFUNC(common,getRandomPos)
