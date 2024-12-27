#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns required score for given item/vehicle
 *
 * Arguments:
 * 0: Item/Vehicle/Classname <OBJECT/STRING>
 *
 * Return Value:
 * 0: Required score <NUMBER>
 *
 * Example:
 * [vehicle player] call afsk_equipment_fnc_getRequiredScoreForItem
 *
 * Public: No
 */

params ["_item"];

// Handling for objects
if (_item isEqualType objNull) then {
    _item = typeOf _item;
};

// No classname provided
if (_item isEqualTo "") exitWith {-1};

// Check if given item is a vehicle
private _namespace = [GVAR(policeEquipmentScores), GVAR(policeVehiclesScores)] select isClass (configFile >> "CfgVehicles" >> _item);

// Lowercase search only
_item = toLower _item;

// Check all scores in given namespace and find
private _requiredScore = ({
    private _itemsList = _namespace getVariable _x;
    if (_item in _itemsList) exitWith {parseNumber _x};
} forEach (allVariables _namespace));

// Not found
if (isNil "_requiredScore") exitWith {-1};

// Return search result
_requiredScore
