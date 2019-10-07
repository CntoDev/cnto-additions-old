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
            "A3_Characters_F",
            "ace_ballistics"  /* muzzle_snds_* overrides */
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
    class B_Soldier_recon_base;
    class silent_ops_silent_operative : B_Soldier_recon_base {
        scope = 2;
        side = 3;  /* allows using any uniforms */
        faction = "CIV_F";
        displayName = "Silent Operative";

        camouflage = 0.3;
        audible = 0.005;
        attendant = 1;
        engineer = 1;
        uavHacker = 1;
        canDeactivateMines = 1;
        canHideBodies = 1;

        /*
         * I should actually just re-define all of the 9000 sounds, but with lower
         * volume .. though it would be a lot of variables to break on Arma update.
         * The class Sound* thing is really lazy, but as there are still *some*
         * quiet footstep sounds, it works reasonably well in practice.
         */
        class SoundEnvironExt {};
        class SoundGear {};
    };
};
