/*
 * sdv visibility - reduce SDV (submarine) visibility to compensate
 * for bad underwater detection logic (by default, they can be seen by AI
 * from 200+m on the shore)
 */

class CfgPatches {
    class Sdv_Visibility {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Boat_F_Beta_SDV_01"
        };
    };
};

class CfgVehicles {
    class SDV_01_base_F;
    class B_SDV_01_F : SDV_01_base_F {
        audible = 0.05;  // default 6 (like tanks, soldiers have 0.05)
        camouflage = 1;  // default 2 (soldiers have 1)
    };
};
