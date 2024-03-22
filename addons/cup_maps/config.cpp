#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_Chernarus_Config",
            "CUP_Chernarus_Summer_Config",
            "CUP_Chernarus_Winter_Config"
        };
        skipWhenMissingDependencies = 1;
        author = "ArmaForces";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWorlds.hpp"
