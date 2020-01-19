#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns all configs from which given config inherits
 *
 * Arguments:
 * 0: Config to get all it's parents <CONFIG>
 *
 * Return Value:
 * 0: Array of configs <ARRAY>
 *
 * Example:
 * [configFile >> "CfgVehicles" >> "C_man_polo_1_F"] call afsk_common_fnc_configGetAllParents
 *
 * Public: No
 */

params ["_config"];

if (!isClass _config) exitWith {[]};

private _parents = [];

// Get direct parent for every parent config
while {!isNull _config} do {
    _parents pushBack _config;
    _config = inheritsFrom _config;
};

_parents
