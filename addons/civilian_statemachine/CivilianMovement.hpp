class CivilianMovement {
    list = "allGroups select {side leader _x isEqualTo CIVILIAN}";
    skipNull = 1;

    // Idle state with no tasks assigned
    class Idle {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class GoToVehicle {
            targetState = "WalkingToVehicle";
            condition = QUOTE(random 1 > 0.95 && {[_this] call FUNC(isVehicleNearby)});
            onTransition = QUOTE([_this] call FUNC(moveToVehicle));
        };

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

    class WalkingToVehicle {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class InVehicle {
            targetState = "EnteredVehicle";
            condition = "!((vehicle leader _this) isEqualTo (leader _this))";
            onTransition = "";
        };
    };

    class EnteredVehicle {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class DriveSomewhere {
            targetState = "Driving";
            condition = "true";
            onTransition = QUOTE([_this] call FUNC(driveSomewhere));
        };
    };

    class IdleInVehicle {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class DoGetOut {
            targetState = "Idle";
            condition = "random 1 > 0.7";
            onTransition = "";
        };

        class DriveSomewhere {
            targetState = "Driving";
            condition = "true";
            onTransition = QUOTE([_this] call FUNC(driveSomewhere));
        };
    };

    class Driving {
        onState = "";
        onStateEntered = "";
        onStateLeaving = "";
        class StoppedDriving {
            targetState = "IdleInVehicle";
            condition = "currentWaypoint _this isEqualTo (count waypoints _this)";
            onTransition = "";
        };
    };
};
