#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function reads all properties of all subclasses (1 lvl) of given config
 * and saves to namespace for easier access
 * (and ability to easily create default value if property doesn't exits)
 *
 * Arguments:
 * 0: Config to read from <CONFIG>
 * 1: Namespace to save data to <CBA_NAMESPACE>
 *
 * Return Value:
 * 0: Filled/created namespace <CBA_NAMESPACE>
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_config", ["_namespace", call CBA_fnc_createNamespace]];

{
    // Add item to list
    private _itemConfig = _x;
    private _itemNamespace = call CBA_fnc_createNamespace;
    _namespace setVariable [configName _x, _itemNamespace];
    // Get item properties
    private _foundProperties = SUPPORTED_PROPERTIES arrayIntersect (configProperties [_x, "true", true]);
    // Read config values for found properties
    {
        private _value = switch (true) do {
            case (isNumber _x): {getNumber (_itemConfig >> _x)};
            case (isText _x): {getText (_itemConfig >> _x)};
            case (isArray _x): {getArray (_itemConfig >> _x)};
            default {configNull};
        };
        _itemNamespace setVariable [_x, _value];
    } forEach _foundProperties;
} forEach ("true" configClasses _config);

_namespace
