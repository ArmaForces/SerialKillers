#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns given city size from config.
 * Returns "NameCityCapital", "NameCity" or "NameVillage"
 *
 * Arguments:
 * 0: City <LOCATION>
 *
 * Return Value:
 * 0: City size <STRING>
 *
 * Example:
 * [[player] call afsk_common_fnc_nearestLocation] call afsk_common_fnc_getCitySize
 *
 * Public: No
 */

params ["_city"];

getText (configFile >> "CfgWorlds" >> worldName >> "Names" >> "type")
