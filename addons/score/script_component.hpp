#define COMPONENT score
#include "\z\afsk\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_SCORE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_SCORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SCORE
#endif

#include "\z\afsk\addons\main\script_macros.hpp"

#define KILLERS_SCORE_REACHED 0
#define KILLERS_DEAD 1
#define MAXIMUM_TIMEOUT_REACHED 2
