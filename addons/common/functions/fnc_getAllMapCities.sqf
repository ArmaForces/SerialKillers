#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function returns all map city locations.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: City list <ARRAY>
 *
 * Example:
 * call afsk_common_fnc_getAllMapCities
 *
 * Public: No
 */

private _cities = [];

private _filter = "getText (_x >> 'type') isEqualTo '%1'";

{
    private _locations = format [_filter, _x] configClasses (configFile >> "CfgWorlds" >> worldName >> "Names");
    {
        _cities pushBack _x;
    } forEach _locations;
} forEach ["NameCityCapital", "NameCity", "NameVillage"];

_cities
