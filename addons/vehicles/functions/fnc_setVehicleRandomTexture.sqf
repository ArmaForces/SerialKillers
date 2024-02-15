#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function sets global texture (if possible) for given vehicle.
 *
 * Arguments:
 * 0: Vehicle to set its texture <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call afsk_vehicles_fnc_setVehicleRandomTexture
 *
 * Public: No
 */

params ["_vehicle"];

private _vehicleClassname = typeOf _vehicle;
private _vehicleConfig = (configFile >> "CfgVehicles" >> _vehicleClassname);

// Retrieve all available textures for given vehicle
private _textureConfigs = "true" configClasses (_vehicleConfig >> "TextureSources");
private _vehicleTextures = [];
{
    private _textures = getArray (_x >> "textures");
    _vehicleTextures pushBack (_textures);
} forEach _textureConfigs;

// Select random texture and apply globally for all selections
private _randomTexture = selectRandom _vehicleTextures;
private _selection = 0;
{
    _vehicle setObjectTextureGlobal [_selection, _x];
    _selection = _selection + 1;
} forEach _randomTexture;
