#define COMPONENT police
#include "\z\afsk\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_POLICE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_POLICE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_POLICE
#endif

#include "\z\afsk\addons\main\script_macros.hpp"

// Safezone for vehicle spawn points
#define SPAWNPOINT_SAFEZONE 5
