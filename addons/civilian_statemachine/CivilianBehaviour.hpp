class CivilianBehaviour {
    // Class properties have the same name as the corresponding function parameters
    // and code goes into strings.
    list = "allUnits select {side _x isEqualTo CIVILIAN}";
    skipNull = 1;

    // Unit is in aware state
    class Aware {
        onState = "";
        onStateEntered = "_this setSpeedMode 'NORMAL'";
        onStateLeaving = "";
        class EnteredCombat {
            targetState = "Combat";
            condition = "behaviour _this isEqualTo 'COMBAT'"
        };
        class EnteredSafe {
            targetState = "Safe";
            condition = "behaviour _this isEqualTo 'SAFE'"
        };
    };

    // Unit is in safe state
    class Safe {
        onState = "";
        onStateEntered = "_this setSpeedMode 'LIMITED'";
        onStateLeaving = "";
        class EnteredAware {
            targetState = "Aware";
            condition = "behaviour _this isEqualTo 'AWARE'"
        };
        class EnteredCombat {
            targetState = "Combat";
            condition = "behaviour _this isEqualTo 'COMBAT'"
        };
    };

    class Combat {
        onState = "";
        onStateEntered = "_this setSpeedMode 'FULL'";
        onStateLeaving = "";
        class EnteredAware {
            targetState = "Aware";
            condition = "behaviour _this isEqualTo 'AWARE'"
        };
        class EnteredSafe {
            targetState = "Safe";
            condition = "behaviour _this isEqualTo 'SAFE'"
        };
    };
};
