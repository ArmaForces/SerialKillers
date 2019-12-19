#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(musicEH) = -1;
    GVAR(musicPlaying) = false;
    GVAR(musicQueue) = [];

    GVAR(cities) = call FUNC(getAllMapCities);
}

ADDON = true;
