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

GVAR(flagClassName) = ["FlagClassName", _policeConfig, _missionPoliceConfig] call EFUNC(common,getTextFromConfig);
