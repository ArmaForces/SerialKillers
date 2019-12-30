#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function adds items to given arsenal.
 *
 * Arguments:
 * 0: Object with arsenal <OBJECT>
 * 1: Item or list of items to add <STRING/ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ItemGPS"] call afsk_common_fnc_addItemsToArsenal
 *
 * Public: No
 */

params ["_object", "_items"];

if (_items isEqualType "") then {
    _items = [_items];
};

if (GVAR(ACE_Loaded)) then {
    private _arsenal = _object getVariable ["ace_arsenal_virtualItems", []];
    if (_arsenal isEqualTo []) then {
        [_object] call FUNC(createArsenal);
    };
    [_object, _items] call ACE_arsenal_fnc_addVirtualItems;
} else {
    [_object, _items] call BIS_fnc_addVirtualItemCargo;
};
