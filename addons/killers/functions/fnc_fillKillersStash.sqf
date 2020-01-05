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
    for "_z" from 0 to _itemQuantity step 1 do {
        _box addItemCargoGlobal _newItem;
        private _compatibleMagazines = [_newItem] call CBA_fnc_compatibleMagazines;
        if (!(_compatibleMagazines isEqualTo [])) then {
            private _magazinesQuantity = ceil (random 4);
            for "_v" from 0 to _magazinesQuantity step 1 do {
                _box addItemCargoGlobal (selectRandom _compatibleMagazines);
            };
        };
    };
};
