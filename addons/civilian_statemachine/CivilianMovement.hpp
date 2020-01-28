class CivilianMovement {
    list = "allGroups select {side leader _x isEqualTo CIVILIAN}";
    skipNull = 1;

    // Idle state with no tasks assigned
    class Idle {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class StartWalking {
            targetState = "WalkingRandomly";
            condition = "true";
            onTransition = QUOTE([_this] call FUNC(startWalking));
        };
    };

    // Unit is walking randomly
    class WalkingRandomly {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class StoppedWalking {
            targetState = "Idle";
            condition = "currentWaypoint _this isEqualTo (count waypoints _this)";
            onTransition = "";
        };
    };
};
