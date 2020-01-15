#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function add given item in given amount to given stash.
 *
 * Arguments:
 * 0: Box to add items to <OBJECT>
 * 1: Item classname <STRING>
 * 2: Item quantity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_box", "_itemClassname", ["_itemQuantity", 1]];

for "_z" from 0 to _itemQuantity step 1 do {
    _box addItemCargoGlobal _itemClassname;
    private _compatibleMagazines = [_itemClassname] call CBA_fnc_compatibleMagazines;
    if (!(_compatibleMagazines isEqualTo [])) then {
        private _magazinesQuantity = ceil (random 4);
        for "_v" from 0 to _magazinesQuantity step 1 do {
            _box addItemCargoGlobal (selectRandom _compatibleMagazines);
        };
    };
};
