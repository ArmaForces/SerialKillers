#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

GVAR(enabled) = ("SK" isEqualTo (getText (missionConfigFile >> "Header" >> "gameType")));

GVAR(ACE_Loaded) = isClass (configFile >> "CfgPatches" >> "ace_common");
GVAR(ACRE_Loaded) = isClass (configFile >> "CfgPatches" >> "acre_main");
GVAR(AFFT_Loaded) = isClass (configFile >> "CfgPatches" >> "afft_main");
GVAR(CUP_Loaded) = isClass (configFile >> "CfgPatches" >> "CUP_Vehicles_Core");
GVAR(RHS_Loaded) = isClass (configFile >> "CfgPatches" >> "rhssaf_main_loadorder");

// Killswitch
if (!GVAR(enabled)) exitWith {};

// Prepare all location types for getNearestLocation function
GVAR(allLocationTypes) = ("true" configClasses (configFile >> "CfgLocationTypes")) apply {configName _x};

// Location names cache namespace (to prevent reading from config every time)
GVAR(locationNames) = call CBA_fnc_createNamespace;

if (isServer) then {
    GVAR(musicEH) = -1;
    GVAR(musicPlaying) = false;
    GVAR(musicQueue) = [];

    GVAR(cities) = call FUNC(getAllMapCities);

#ifdef DEV_DEBUG
    {
      private _position = getArray (_x >> "position");
      private _radiusA = getNumber (_x >> "radiusA");
      private _radiusB = getNumber (_x >> "radiusB");
      private _angle = getNumber (_x >> "angle");

      private _marker = createMarkerLocal [configName _x, _position];
      _marker setMarkerShapeLocal "ELLIPSE";
      _marker setMarkerAlphaLocal 0.5;
      _marker setMarkerColorLocal "ColorCIVILIAN";
      _marker setMarkerSizeLocal [_radiusA, _radiusB];
      _marker setMarkerDir _angle
    } forEach GVAR(cities);
#endif
};

ADDON = true;
