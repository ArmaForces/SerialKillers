#define COMPONENT equipment
#include "\z\afsk\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_EQUIPMENT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_EQUIPMENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EQUIPMENT
#endif

#include "\z\afsk\addons\main\script_macros.hpp"

#define SUPPORTED_PROPERTIES ["requiredScore", "availableInStash", "availableOnStart"]
#define SUPPORTED_PROPERTIES_DEFAULTS [0, 1, 1]
