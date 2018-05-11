/*
 * adjust FIR AWS Harriers for CNTO gameplay
 */

class CfgPatches {
    class Harrier_Fixes {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "FIR_AV8B_F"
        };
    };
};

class CfgVehicles {
    class Plane_Fighter_03_base_F;
    class FIR_AV8B_Base : Plane_Fighter_03_base_F {
        /*
         * inherit original value from Plane_Fighter_03_base_F,
         * default Harriers use too much (5000)
         */
        delete fuelCapacity;
        /*
         * delete the "Open AMS" GUI option,
         * no easy instant rearm/refuel/repair
         */
        class UserActions {
            delete AV8B_Gui_Open;
        };
    };
    class FIR_AV8B_NA_Base : Plane_Fighter_03_base_F {
        delete fuelCapacity;
        class UserActions {
            delete AV8B_Gui_Open;
        };
    };
    class FIR_AV8B_GR7_Base : Plane_Fighter_03_base_F {
        delete fuelCapacity;
        class UserActions {
            delete AV8B_Gui_Open;
        };
    };
};
