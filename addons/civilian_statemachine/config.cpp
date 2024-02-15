#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afsk_civilian"
        };
        author = "ArmaForces";
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"

class CfgSerialKillers {
    #include "CfgStateMachine.hpp"
};
