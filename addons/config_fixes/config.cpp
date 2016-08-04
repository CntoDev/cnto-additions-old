/*
 * changes/features/fixes:
 *
 * - smoke bounce - reduce bounciness of UGL smoke shells, as they can,
 *   by default, bounce even kilometers from their original impact
 *
 * - flare intensity - increase brightness/intensity of flares, so they
 *   actually can illuminate something (even without NVGs!)
 *   - taken from https://feedback.bistudio.com/T76756
 *
 * - sdv visibility - reduce SDV (submarine) visibility to compensate
 *   for bad underwater detection logic (by default, they can be seen by AI
 *   from 200+m on the shore)
 *
 * - remove rakurs - remove an annoying RHS scope which has higher Arsenal
 *   priority than <None>, being the default for many (even vanilla) weapons
 *
 */

class CfgPatches {
    class Config_Fixes {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",          // smoke bounce, flare intensity
            "ace_grenades",          // flare intensity
            "A3_Boat_F_Beta_SDV_01", // sdv visibility
            "rhsusf_c_weapons",      // smoke bounce
            "rhs_c_weapons"          // smoke bounce, remove rakurs
        };
    };
};

class CfgVehicles {
    /* sdv visibility */
    class SDV_01_base_F;
    class B_SDV_01_F : SDV_01_base_F {
        audible = 0.05;  // default 6 (like tanks, soldiers have 0.05)
        camouflage = 1;  // default 2 (soldiers have 1)
    };
};

class CfgWeapons {
    /* remove rakurs */
    class rhs_acc_1p63;
    class rhs_acc_rakursPM : rhs_acc_1p63 {
        scope = 1;
    };
};

class CfgAmmo {
    /* smoke bounce */
    class SmokeShell;
    class G_40mm_Smoke : SmokeShell {
        /* inherited from SmokeShell is shotSmokeX which ignores
         * "deflecting" and "deflectionSlowDown" parameters */
        simulation = "shotSmoke";
        /* multiplier; small bounce, on 400m flat ground shot ~10m bounce */
        deflectionSlowDown = 0.3;
    };

    /* flare intensity */
    class FlareCore;
    class FlareBase;
    class Flare_82mm_AMOS_White: FlareCore {
        timeToLive = 80;
        brightness = 200;
        intensity  = 5000000;
    };
    class F_40mm_White: FlareBase {
        brightness = 120;
        intensity  = 5000000;
    };
    class F_20mm_White: FlareBase {
        brightness = 80;
        intensity  = 5000000;
    };
    class F_Signal_Green: FlareBase {
        brightness = 80;
        intensity  = 5000000;
    };
};

class CfgMagazines {
    /* smoke bounce */
    /* (RHS uses completely custom parents/classes for UGL grenades, eh */
    class rhs_mag_M441_HE;
    class rhs_mag_m713_Red : rhs_mag_M441_HE { ammo = "G_40mm_SmokeRed"; };
    class rhs_mag_m714_White : rhs_mag_m713_Red { ammo = "G_40mm_Smoke"; };
    class rhs_mag_m715_Green : rhs_mag_m713_Red { ammo = "G_40mm_SmokeGreen"; };
    class rhs_mag_m716_yellow : rhs_mag_m713_Red { ammo = "G_40mm_SmokeYellow"; };
    class rhs_VOG25;
    class rhs_GRD40_White : rhs_VOG25 { ammo = "G_40mm_Smoke"; };
    class rhs_GRD40_Green : rhs_GRD40_White { ammo = "G_40mm_SmokeGreen"; };
    class rhs_GRD40_Red : rhs_GRD40_White { ammo = "G_40mm_SmokeRed"; };
};
