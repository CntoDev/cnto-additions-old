/*
 * rhs map flashlights - make some RHS flashlights usable as ACE3 map lights
 */

class CfgPatches {
    class RHS_Map_Flashlights {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhs_c_weapons",    // rhs_acc_2dpZenit
            "rhsusf_c_weapons"  // rhsusf_acc_M952V
        };
    };
};

class CfgWeapons {
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

                color[] = {180, 160, 130};
                ambient[] = {0.9, 0.81, 0.7};
                intensity = 1000;
                size = 1;
                innerAngle = 10;
                outerAngle = 80;
                coneFadeCoef = 12;
                position = "flashdir";
                direction = "flash";
                useFlare = 1;
                flareSize = 1;
                flareMaxDistance = 300;
                dayLight = 1;

                class Attenuation {
                    start = 0;
                    constant = 0;
                    linear = 0;
                    quadratic = 0.2;
                    hardLimitStart = 260;
                    hardLimitEnd = 300;
                };
                scale[] = {0};
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

                color[] = {180, 160, 130};
                ambient[] = {0.9, 0.81, 0.7};
                intensity = 1000;
                size = 1;
                innerAngle = 10;
                outerAngle = 80;
                coneFadeCoef = 12;
                position = "flash dir";
                direction = "flash";
                useFlare = 1;
                flareSize = 1;
                flareMaxDistance = 300;
                dayLight = 1;

                class Attenuation {
                    start = 0;
                    constant = 0;
                    linear = 0;
                    quadratic = 0.2;
                    hardLimitStart = 260;
                    hardLimitEnd = 300;
                };
                scale[] = {0};
            };
        };
    };
    class rhsusf_acc_M952V : rhsusf_acc_anpeq15_light {
        /* "flashlight" inventory image, instead of laser package */
        picture = "\A3\weapons_F\Data\UI\gear_accv_flashlight_CA.paa";
        class ItemInfo : ItemInfo {
            mass = 1;
        };
    };
};
