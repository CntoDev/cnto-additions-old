/*
 * various post-1.60 lighting fixes as the "visual upgrade" made all light
 * sources much less intense (by increasing hdr filter intensity)
 */

class CfgPatches {
    class Lighting_Fixes {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "ace_grenades",     // overwrites flare intensity
            "rhs_c_weapons",    // rhs_acc_2dpZenit
            "rhsusf_c_weapons"  // rhsusf_acc_M952V
        };
    };
};

class CfgAmmo {
    /*
     * flare intensity - increase brightness/intensity of flares, so they
     * actually can illuminate something (even without NVGs!)
     * - taken from https://feedback.bistudio.com/T76756
     */
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

class CfgWeapons {
    /*
     * make some RHS flashlights behave/weight as much as ACE map flashlights
     */
    class InventoryFlashLightItem_Base_F;
    class acc_flashlight;
    class rhs_acc_2dpZenit : acc_flashlight {
        class ItemInfo : InventoryFlashlightItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = "\z\ace\addons\map\UI\Flashlight_beam_white_ca.paa";
                ACE_Flashlight_Size = 2.5;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
    class acc_pointer_IR;
    class rhsusf_acc_anpeq15 : acc_pointer_IR {
        class ItemInfo;
    };
    class rhsusf_acc_anpeq15_light : rhsusf_acc_anpeq15 {
        class ItemInfo : ItemInfo {
            class Flashlight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = "\z\ace\addons\map\UI\Flashlight_beam_white_ca.paa";
                ACE_Flashlight_Size = 2.5;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
    class rhsusf_acc_M952V : rhsusf_acc_anpeq15_light {
        class ItemInfo : ItemInfo {
            mass = 1;
        };
    };
};
