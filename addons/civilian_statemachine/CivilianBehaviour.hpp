class CivilianBehaviour {
    list = "allUnits select {side _x isEqualTo CIVILIAN}";
    skipNull = 1;

    // Unit is in aware state and was in combat
    class AwareAfterCombat {
        onState = "";
        onStateEntered = "_this setBehaviour 'SAFE'";
        onStateLeaving = "";
        class EnteredSafe {
            targetState = "Safe";
            condition = "behaviour _this isEqualTo 'SAFE'"
        };
    };

    // Unit is in aware state and was safe
    class AwareAfterSafe {
        onState = "";
        onStateEntered = "_this setBehaviour 'COMBAT'";
        onStateLeaving = "";
        class EnteredCombat {
            targetState = "Combat";
            condition = "behaviour _this isEqualTo 'COMBAT'"
        };
    };

    // Unit is in safe state
    class Safe {
        onState = "";
        onStateEntered = "_this setSpeedMode 'LIMITED'";
        onStateLeaving = "";
        class EnteredAware {
            targetState = "AwareAfterSafe";
            condition = "behaviour _this isEqualTo 'AWARE'"
        };
        class EnteredCombat {
            targetState = "Combat";
            condition = "behaviour _this isEqualTo 'COMBAT'"
        };
    };

    // Unit is in combat state
    class Combat {
        onState = "";
        onStateEntered = "_this setSpeedMode 'FULL'";
        onStateLeaving = "";
        class EnteredAware {
            targetState = "AwareAfterCombat";
            condition = "behaviour _this isEqualTo 'AWARE'"
        };
        class EnteredSafe {
            targetState = "Safe";
            condition = "behaviour _this isEqualTo 'SAFE'"
        };
    };
};
