/*
 * RHS vanilla ammo - make various RHS weapons (mostly AFRF) use vanilla
 * CfgAmmo, especially in cases where the AFRF version is buggy or the
 * vanilla version has been modified/fixed by another tweak
 *
 * This is generally needed because RHS AFRF (unlike RHS USAF) likes to
 * define everything from scratch, not inherit vanilla classes.
 *
 * - note that magazines stay the same, so this shouldn't have any notable
 *   negative gameplay effect
 */

class CfgPatches {
    class RHS_Vanilla_Ammo {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhsusf_c_weapons",
            "rhs_c_weapons"
        };
    };
};

class CfgMagazines {
    /* throwable and UGL smokes - reduced bounce (tweak), ACE Particles, etc. */
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
