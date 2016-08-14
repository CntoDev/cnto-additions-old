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
            "A3_Weapons_F_Acc",  //flashlight
            "ace_grenades"  //overwrites flare intensity
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
    /* weapon-attached flashlight */
    class ItemCore;
    class InventoryFlashLightItem_Base_F;
    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                intensity = 400;
                innerAngle = 1;
                outerAngle = 120;
                coneFadeCoef = 10;
                flareMaxDistance = 250;
                class Attenuation {
                    hardLimitStart = 200;
                    hardLimitEnd = 300;
                };
            };
        };
    };

};
