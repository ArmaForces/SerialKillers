class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Edit;
            class Checkbox;
            class ModuleDescription;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };

    class GVAR(modulePoliceStation): Module_F {
        scope = 2;
        displayName = CSTRING(PoliceStation_Name);
        category = QUOTE(PREFIX);
        function = QFUNC(modulePoliceStation);
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 1;
        is3DEN = 0;

        canSetArea = 1;
        canSetAreaHeight = 0;
        canSetAreaShape = 1;
        class AttributeValues {
            size2[] = {50, 50};
            size3[] = {50, 50, -1};
            isRectangle = 1;
        };

        class Attributes: AttributesBase {
            // Allows police station identification
            class LocationName: Edit {
                displayName = CSTRING(PoliceStation_LocationName);
                tooltip = CSTRING(PoliceStation_LocationName_Description);
                property = "LocationName";
            };
            // Determine if helicopters can be spawned here
            class HasHelipad: Checkbox {
                displayName = CSTRING(PoliceStation_HasHelipad);
                property = "HasHelipad";
            };
            class ModuleDescription: ModuleDescription {};
        };
        class ModuleDescription: ModuleDescription {};
    };
};
