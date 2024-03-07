#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Killswitch
if (!EGVAR(common,enabled)) exitWith {};

if (isServer) then {
    // Create namespace for linking location classname with city
    GVAR(citiesLocations) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(citiesLocations);
    // All cities and civilians
    GVAR(cities) = [];
    GVAR(civilians) = [];

    // Civilians quantity according to settings
    if (GVAR(initialCiviliansCount) isEqualTo 0) then {
        GVAR(initialCiviliansCount) = ceil (random [100, 150, 200]);
    } else {
        private _tenPercent = GVAR(initialCiviliansCount)/10;
        GVAR(initialCiviliansCount) = GVAR(initialCiviliansCount) + round (random (2 * _tenPercent) - _tenPercent);
    };
    publicVariable QGVAR(initialCiviliansCount);

    // Weights for civilians creation
    GVAR(weightCapital) = ceil (random (10));
    GVAR(weightCity) = ceil (random (8));
    GVAR(weightVillage) = ceil (random (6));
    GVAR(weightRural) = ceil (random (10));

    // Initialize all cities found on the map
    {
        private _city = [_x] call FUNC(initCity);
        GVAR(cities) pushBack _city;

#ifdef DEV_DEBUG
        private _cityArea = _city getVariable QGVAR(cityArea);
        _cityArea params ["_position", "_radiusA", "_radiusB", "_angle"];

        private _marker = createMarkerLocal [configName _x, _position];
        _marker setMarkerShapeLocal "ELLIPSE";
        _marker setMarkerAlphaLocal 0.5;
        _marker setMarkerColorLocal "ColorCIVILIAN";
        _marker setMarkerSizeLocal [_radiusA, _radiusB];
        _marker setMarkerDir _angle;

        private _centerMarker = createMarkerLocal [format["center_%1", configName _x], _position];
        _centerMarker setMarkerColorLocal "ColorCIVILIAN";
        _centerMarker setMarkerType "mil_dot";
#endif
    } forEach EGVAR(common,cities);
    publicVariable QGVAR(cities);

    // Prepare civilian units and available equipment for them
    GVAR(units) = [];
    GVAR(backpacks) = [];
    GVAR(uniforms) = [];
    GVAR(vests) = [];
    GVAR(headgear) = [];
    call FUNC(initCiviliansConfig);
    publicVariable QGVAR(backpacks);
    publicVariable QGVAR(uniforms);
    publicVariable QGVAR(vests);
    publicVariable QGVAR(headgear);
    // Initialize civilians
    call FUNC(initCivilians);
    publicVariable QGVAR(civilians);
    {
        private _civiliansCount = count (_x getVariable [QGVAR(CiviliansList), []]);
        _x setVariable [QGVAR(CiviliansCount), _civiliansCount];
        _x setVariable [QGVAR(initialCiviliansCount), _civiliansCount];
    } forEach GVAR(cities);
};

ADDON = true;
