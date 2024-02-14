#define COMPONENT jail
#include "\z\afsk\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_JAIL
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_JAIL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_JAIL
#endif

#include "\z\afsk\addons\main\script_macros.hpp"

#define RECENTLY_FREED_TIMEOUT 60
