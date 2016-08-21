/*
 * silent weapons - various tweaks of bullet, magazine and weapon AI detect
 * properties to make them more usable in silenced urban/cqb combat
 */

class CfgPatches {
    class Silent_Weapons {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "A3_Weapons_F_Acc",
            "ace_ballistics",  //overwrites suppressors
            "rhsusf_c_weapons",
            "rhs_c_weapons",
            "rhs_sounds"
        };
    };
};

/*
 * also increase damage (hit) of ASP-1 Kir and RHS AS VAL / VSS
 * to account for the insane durability of RHS Russian units
 */

class CfgAmmo {
    /* ASP-1 Kir ammo */
    class BulletBase;
    class B_127x54_Ball : BulletBase {
        hit = 60;  //default: 20
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.1;  //~10m
        visibleFire = 0.001;
    };

    /* AS Val / VSS Vintorez special ammo */
    class rhs_B_9x39_SP5;
    class SW_SP5_SuperHeavy_Frag : rhs_B_9x39_SP5 {
        hit = 50;  //default: 7.73
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.05;  // slightly more than 9mm pistol
        visibleFire = 0.001;
    };

    /* silent grenade throwing, AI still hears explosion */
    class Grenade;
    class GrenadeHand : Grenade {
        visibleFire = 0.001;
        audibleFire = 0.005;
    };
};

class CfgMagazines {
    class rhs_10rnd_9x39mm_SP5;
    class SW_10rnd_SP5_SuperHeavy_Frag : rhs_10rnd_9x39mm_SP5 {
        mass = 20;
        ammo = "SW_SP5_SuperHeavy_Frag";
        displayName = "SP-5 10Rnd SuperHeavy Frag Mag";
        descriptionShort = "Caliber: 9x60mm<br />Rounds: 10<br />Used in: AS Val";
        author = "";
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
