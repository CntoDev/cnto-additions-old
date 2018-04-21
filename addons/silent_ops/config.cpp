/*
 * silent ops - various tweaks of bullet, magazine, weapons and soldiers
 * for "silent" operations
 */

class CfgPatches {
    class Silent_Ops {
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "A3_Weapons_F_Acc",
            "A3_Characters_F"
        };
    };
};

class CfgAmmo {
    /* silent grenade throwing, AI still hears explosion */
    class Grenade;
    class GrenadeHand : Grenade {
        audibleFire = 0.005;
        visibleFire = 0.001;
    };
};

class CfgWeapons {
    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    /* 6.5mm & others inheriting */
    class muzzle_snds_H : ItemCore {
        class ItemInfo : InventoryMuzzleItem_Base_F {
            class AmmoCoef {
                /* ~10m */
                audibleFire = 0.005;
                visibleFire = 0.005;
            };
        };
    };
    /* 9mm */
    class muzzle_snds_L : muzzle_snds_H {
        class ItemInfo : InventoryMuzzleItem_Base_F {
            class AmmoCoef {
                /* as close as it gets, ~5m */
                audibleFire = 0.001;
                visibleFire = 0.001;
            };
        };
    };
};

class CfgVehicles {
    /*
     * camouflage:
     * We use 0.7 spotdistance skill via ASR AI, so use super low
     * value here, to counteract it
     */
    /*
     * class Sound*:
     * I should actually just re-define all of the 9000 sounds, but with lower
     * volume .. though it would be a lot of variables to break on Arma update.
     * The class Sound* thing is really lazy, but as there are still *some*
     * quiet footstep sounds, it works reasonably well in practice.
     */
    #define SILENT_UNIT_TUNABLES \
        camouflage = 0.3; \
        audible = 0.005; \
        attendant = 1; \
        engineer = 1; \
        uavHacker = 1; \
        canDeactivateMines = 1; \
        canHideBodies = 1; \
        class SoundEnvironExt {}; \
        class SoundGear {};

    /* no I_Soldier_recon_base, imitate it based on B_Soldier_recon_base */
    class I_Soldier_base_F;
    class silent_ops_I_Soldier_recon_base : I_Soldier_base_F {
        scope = 0;
        detectSkill = 30;
        displayName = "Recon";
        editorSubcategory = "EdSubcat_Personnel_SpecialForces";
        nameSound = "veh_infantry_SF_s";
        role = "Rifleman";
        textPlural = "specops";
        textSingular = "specop";
        vehicleClass = "MenRecon";
    };

    class B_Soldier_recon_base;
    class silent_ops_B_SilentOp : B_Soldier_recon_base {
        SILENT_UNIT_TUNABLES
        scope = 2;
        displayName = "Silent Operative";
    };
    class O_Soldier_recon_base;
    class silent_ops_O_SilentOp : O_Soldier_recon_base {
        SILENT_UNIT_TUNABLES
        scope = 2;
        displayName = "Silent Operative";
    };
    class silent_ops_I_SilentOp : silent_ops_I_Soldier_recon_base {
        SILENT_UNIT_TUNABLES
        scope = 2;
        displayName = "Silent Operative";
    };
};
