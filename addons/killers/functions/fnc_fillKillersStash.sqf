#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function fills given box with equipment available to killers in stashes.
 *
 * Arguments:
 * 0: Box to fill <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_box"];

private _stashAvailableItemsCount = count EGVAR(equipment,killersStashEquipment);
private _itemsCount = ceil (random 3) + floor (_stashAvailableItemsCount/10);

for "_y" from 0 to _itemsCount step 1 do {
    private _newItem = selectRandom EGVAR(equipment,killersStashEquipment);
    private _itemQuantity = ceil (random 2);
    [_box, _newItem, _itemQuantity] call FUNC(addItemToStash);
};
