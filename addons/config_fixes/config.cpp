class CfgPatches {
    class Config_Fixes {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Boat_F_Beta_SDV_01", // B_SDV_01_F
            "rhs_c_weapons"          // rhs_acc_rakursPM
        };
    };
};

class CfgVehicles {
    /* SDV (Submarine) audibility/visibility - make AI *not* spot it
     * 100m away deep in the ocean */
    class SDV_01_base_F;
    class B_SDV_01_F : SDV_01_base_F {
        audible = 0.05;  // default 6 (like tanks, soldiers have 0.05)
        camouflage = 1;  // default 2 (soldiers have 1)
    };
};

class CfgWeapons {
    /* annoying RHS scope, sits above <Empty> in Arsenal, making it
     * the default for any selected weapon - hide it, it's crappy anyway */
    class rhs_acc_1p63;
    class rhs_acc_rakursPM : rhs_acc_1p63 {
        scope = 1;
    };
};
