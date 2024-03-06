#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function loads config for police stuff.
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

private _policeConfig = (configFile >> "CfgSerialKillers" >> "Police");
private _missionPoliceConfig = (missionConfigFile >> "CfgSerialKillers" >> "Police");

private _fnc_getTextProperty = {
    params ["_property"];

    if (isClass (_missionPoliceConfig >> _property)) exitWith {
        getText (_missionPoliceConfig >> _property)
    };

    getText (_policeConfig >> _property)
};

GVAR(flagClassName) = "FlagClassName" call _fnc_getTextProperty;
