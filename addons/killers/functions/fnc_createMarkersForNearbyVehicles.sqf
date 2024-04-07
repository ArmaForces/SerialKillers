#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Searches for vehicles in given radius near given position.
 * Creates a decaying marker for each vehicle.
 *
 * Arguments:
 * 0: Search position <POSITION>
 * 1: Search radius <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosATL bob, 500] call afsk_killers_fnc_createMarkersForNearbyVehicles
 *
 * Public: No
 */

params ["_position", ["_radius", 1000]];

private _nearbyVehicles = _position nearEntities [["Air", "Car", "Motorcycle", "Tank"], _radius];
private _emptyVehicles = _nearbyVehicles select {
    damage _x isEqualTo 0 &&
    {crew _x isEqualTo []}
};

{
    private _vehicle = _x;
    private _markerName = format ["vehicle_%1", _vehicle];
    private _marker = createMarkerLocal [_markerName, getPosATL _vehicle];
    if (_marker isEqualTo "") then { _marker = _markerName };
    _marker setMarkerColorLocal "ColorCIVILIAN";
    _marker setMarkerSizeLocal [0.5, 0.5];
    _marker setMarkerAlphaLocal 1; // Force just in case marker already exists and should be fully-visible again
    _marker setMarkerTextLocal getText (configFile >> "CfgVehicles" >> (typeof _vehicle) >> "displayName");

    private _markerType = if (_vehicle isKindOf "Air") then {
            if (_vehicle isKindOf "Plane") then { "loc_plane" } else { "loc_heli" }
        } else { "loc_car" };
    _marker setMarkerTypeLocal _markerType;

    [_marker, 2.5, true] call EFUNC(markers,markerDecay);
} forEach _emptyVehicles;

nil
