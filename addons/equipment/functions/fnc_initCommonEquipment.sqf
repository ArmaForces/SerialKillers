#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function prepares common equipment namespace from given config.
 *
 * Arguments:
 * 0: Eqipment config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_equipmentConfig"];

{
    // Add item to list
    private _itemConfig = _x;
    private _itemNamespace = call CBA_fnc_createNamespace;
    GVAR(commonEquipment) setVariable [configName _x, _itemNamespace];
    // Get item properties
    private _configProperties = configProperties [_x, "true", true];
    private _foundProperties = SUPPORTED_PROPERTIES arrayIntersect _configProperties;
    // Read config values for found properties
    {
        _itemNamespace setVariable [_x, getNumber (_itemConfig >> _x)];
    } forEach _foundProperties;
} forEach ("true" configClasses (_equipmentConfig >> "Common" >> "Equipment"));
