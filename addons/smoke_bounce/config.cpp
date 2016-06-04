class CfgPatches {
    class Smoke_Bounce {
        units[] = {};
        weapons[] = {};
        /* afrf = rhs_c_weapons, usf = rhsusf_c_weapons, gref has no UGLs */
        requiredAddons[] = {"A3_Weapons_F", "rhs_c_weapons", "rhsusf_c_weapons"};
        /* for vanilla */
        //requiredAddons[] = {"A3_Weapons_F"};
    };
};

class CfgAmmo {
    class SmokeShell;
    class G_40mm_Smoke : SmokeShell {
        /* inherited from SmokeShell is shotSmokeX which ignores
         * "deflecting" and "deflectionSlowDown" parameters */
        simulation = "shotSmoke";
        /* multiplier; small bounce, on 400m flat ground shot ~10m bounce */
        deflectionSlowDown = 0.3;
    };
};

/* compatibility */
class CfgMagazines {
    /* rhs - usf */
    class rhs_mag_M441_HE;
    class rhs_mag_m713_Red : rhs_mag_M441_HE { ammo = "G_40mm_SmokeRed"; };
    class rhs_mag_m714_White : rhs_mag_m713_Red { ammo = "G_40mm_Smoke"; };
    class rhs_mag_m715_Green : rhs_mag_m713_Red { ammo = "G_40mm_SmokeGreen"; };
    class rhs_mag_m716_yellow : rhs_mag_m713_Red { ammo = "G_40mm_SmokeYellow"; };
    /* rhs - afrf */
    class rhs_VOG25;
    class rhs_GRD40_White : rhs_VOG25 { ammo = "G_40mm_Smoke"; };
    class rhs_GRD40_Green : rhs_GRD40_White { ammo = "G_40mm_SmokeGreen"; };
    class rhs_GRD40_Red : rhs_GRD40_White { ammo = "G_40mm_SmokeRed"; };
};
