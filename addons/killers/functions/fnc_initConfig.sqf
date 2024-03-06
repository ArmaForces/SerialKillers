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

GVAR(flagClassName) = ["FlagClassName", _killersConfig, _missionKillersConfig] call EFUNC(common,getTextFromConfig);
