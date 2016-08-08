/*
 * powerful kir - increase damage of ASP-1 Kir and RHS asp val / vss to
 * account for the insane durability of RHS Russian units
 */

class CfgPatches {
    class Powerful_Kir {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "rhsusf_c_weapons"
        };
    };
};

class CfgAmmo {
    class BulletBase;
    class B_127x54_Ball : BulletBase {
        hit = 40;  //default: 20
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.001;
        visibleFire = 0.000001;
    };

    //as val / vss vintorez
    class rhs_B_762x39_Ball;
    class rhs_B_9x39_SP5 : rhs_B_762x39_Ball {
        hit = 30;  //default: 7.73
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.001;
        visibleFire = 0.000001;
    };
};
