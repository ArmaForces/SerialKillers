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
    private _itemNamespace = call CBA_fnc_createNamespace;
    _namespace setVariable [configName _x, _itemNamespace];
    // Get item properties
    // Read config values for found properties
    {
        private _value = switch (true) do {
            case (isNumber _x): {getNumber _x};
            case (isText _x): {getText _x};
            case (isArray _x): {getArray _x};
            default {configNull};
        };
        _itemNamespace setVariable [configName _x, _value];
    } forEach (configProperties [_x, "true", true]);
} forEach ("true" configClasses _config);

_namespace
