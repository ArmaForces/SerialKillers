#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function removes items from given arsenal.
 *
 * Arguments:
 * 0: Object with arsenal <OBJECT>
 * 1: Item or list of items to remove <STRING/ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ItemGPS"] call afsk_common_fnc_removeItemsFromArsenal
 *
 * Public: No
 */

params ["_object", "_items"];

if (_items isEqualType "") then {
    _items = [_items];
};

if (GVAR(ACE_Loaded)) then {
    [_object, _items] call ace_arsenal_fnc_removeVirtualItems;
} else {
    [_object, _items] call BIS_fnc_removeVirtualItemCargo;
};
