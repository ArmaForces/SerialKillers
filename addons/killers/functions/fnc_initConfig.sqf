#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads config for killers stuff.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

private _killersConfig = (configFile >> "CfgSerialKillers" >> "Killers");
private _missionKillersConfig = (missionConfigFile >> "CfgSerialKillers" >> "Killers");

private _fnc_getTextProperty = {
    params ["_property"];

    if (isClass (_missionKillersConfig >> _property)) exitWith {
        getText (_missionKillersConfig >> _property)
    };

    getText (_killersConfig >> _property)
};

GVAR(flagClassName) = "FlagClassName" call _fnc_getTextProperty;
