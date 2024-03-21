#define COMPONENT missions
#include "\z\afsk\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MISSIONS
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_MISSIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSIONS
#endif

#define MISSION_CONFIG(MISSION_NAME,MAP) \
        class DOUBLES(MISSION_NAME,MAP) { \
            directory = QUOTE(PATHTO_R(MISSION_NAME.MAP)); \
        }

#include "\z\afsk\addons\main\script_macros.hpp"
