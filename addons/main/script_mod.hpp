#define MAINPREFIX z
#define PREFIX afsk

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCH,BUILD

#define REQUIRED_VERSION 2.08

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(AFSK - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(AFSK - COMPONENT)
#endif

#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {_this call FUNC(x)}
#else
    #define LINKFUNC(x) FUNC(x)
#endif

// Mod-wide macros
#define SK_GAME_TYPE SK

// Enables some debugging functionality.
// Should never be enabled during normal gameplay as it might reveal information!
// #define DEV_DEBUG
