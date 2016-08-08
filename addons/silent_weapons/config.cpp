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
            "rhsusf_c_weapons"
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
        audibleFire = 0.1;
        visibleFire = 0.001;
    };

    /* AS Val / VSS Vintorez ammo, covers SP6 as well */
    class rhs_B_762x39_Ball;
    class rhs_B_9x39_SP5 : rhs_B_762x39_Ball {
        hit = 50;  //default: 7.73
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.1;
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
                audibleFire = 0.005;
                visibleFire = 0.005;
            };
        };
    };
    /* 9mm */
    class muzzle_snds_L : muzzle_snds_H {
        class ItemInfo : InventoryMuzzleItem_Base_F {
            class AmmoCoef {
                audibleFire = 0.001;
                visibleFire = 0.001;
            };
        };
    };
};
