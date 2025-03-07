#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Function creates vehicle on given position.
 *
 * Arguments:
 * 0: Vehicle classname or config <STRING/CONFIG>
 * 1: Position <POSITION>
 * 2: Remove cargo <BOOL>
 * 3: Enable texture randomization <BOOL>
 *
 * Return Value:
 * 0: Created vehicle <OBJECT>
 *
 * Example:
 * ["C_Offroad_01_F", position player] call afsk_vehicles_fnc_createVehicle
 *
 * Public: No
 */

params ["_vehicleClassname", "_position", ["_dir", random 360], ["_emptyCargo", true], ["_enableRandomization", true], ["_forcePosition", false]];

if (_vehicleClassname isEqualType configNull) then {
    _vehicleClassname = configName _vehicleClassname;
};

if (_position isEqualType objNull) then {
    _position = getPosATL _position;
};

private _mode = ["NONE", "CAN_COLLIDE"] select (_forcePosition);
private _vehicle = createVehicle [_vehicleClassname, _position, [], 0, _mode];
_vehicle setDir _dir;
// Disable randomization and use own function to set texture on vehicle globally (so everyone can see the same color!)
_vehicle setVariable ["BIS_enableRandomization", false];
if (_enableRandomization) then {
    [_vehicle] call FUNC(setVehicleRandomTexture);
};

if (_emptyCargo) then {
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
};

// For ACE support so players can repair their wheels/tracks if crashed
if (EGVAR(common,ACE_Loaded)) then {
    if (_vehicle isKindOf "Air" || {_vehicle isKindOf "Ship"}) exitWith {};
    if (_vehicle isKindOf "Tank") then {
        ["ACE_Track", _vehicle] call ace_cargo_fnc_loadItem;
    } else {
        ["ACE_Wheel", _vehicle] call ace_cargo_fnc_loadItem;
        ["ACE_Wheel", _vehicle] call ace_cargo_fnc_loadItem;
        ["ACE_Wheel", _vehicle] call ace_cargo_fnc_loadItem;
    };
};

_vehicle
