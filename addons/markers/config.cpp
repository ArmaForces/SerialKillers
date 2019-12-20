#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afsk_civilian",
            "afsk_killers",
            "afsk_police"
        };
        author = "ArmaForces";
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
