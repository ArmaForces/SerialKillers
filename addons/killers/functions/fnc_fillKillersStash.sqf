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

// Add regular items
private _stashAvailableItemsCount = count EGVAR(equipment,killersStashEquipment);
private _itemsCount = ceil (random 3) + floor (_stashAvailableItemsCount/10);

for "_y" from 0 to _itemsCount step 1 do {
    private _newItem = selectRandom EGVAR(equipment,killersStashEquipment);
    private _itemQuantity = ceil (random 2);
    [_box, _newItem, _itemQuantity] call FUNC(addItemToStash);
};

// Add common items independently
// And the same for civilian equipment
private _stashAvailableCommonItemsCount = count EGVAR(equipment,killersStashCommonEquipment);
private _commonItemsCount = ceil (random 3) + floor (_stashAvailableCommonItemsCount/10);

for "_y" from 0 to _itemsCount step 1 do {
    // Add common equipment
    private _newCommonItem = selectRandom EGVAR(equipment,killersStashCommonEquipment);
    private _itemQuantity = ceil (random 2);
    [_box, _newCommonItem, _itemQuantity] call FUNC(addItemToStash);
    // Add civilian equipment
    private _newCivilianItem = selectRandom EGVAR(equipment,killersCivilianEquipment);
    private _itemQuantity = ceil (random 2);
    [_box, _newCivilianItem, _itemQuantity] call FUNC(addItemToStash);
};
