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
    private _missingProperties = SUPPORTED_PROPERTIES - _foundProperties;
    // Read config values for found properties
    {
        _itemNamespace setVariable [_x, getNumber (_itemConfig >> _x)];
    } forEach _foundProperties;
    // Set default values for missing properties
    {
        private _missingProperty = _x;
        private _value = SUPPORTED_PROPERTIES_DEFAULTS select (SUPPORTED_PROPERTIES findIf {_x isEqualTo _missingProperty});
        _itemNamespace setVariable [_x, _value];
    } forEach _missingProperties;
} forEach ("true" configClasses (_equipmentConfig >> "Common" >> "Equipment"));
