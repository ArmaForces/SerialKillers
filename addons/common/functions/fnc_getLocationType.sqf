#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns location type from config.
 * For cities returns "NameCityCapital", "NameCity" or "NameVillage".
 *
 * Arguments:
 * 0: Location <LOCATION>
 *
 * Return Value:
 * 0: Location type <STRING>
 *
 * Example:
 * [[player] call afsk_common_fnc_getNearestLocation] call afsk_common_fnc_getLocationType
 *
 * Public: No
 */

params ["_location"];

getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> className _location >> "type")
