/*
 * silent ops - various tweaks of bullet, magazine, weapons and soldiers
 * for "silent" operations
 */

class CfgPatches {
    class Silent_Ops {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "A3_Weapons_F_Acc",
            "ace_ballistics",  //overwrites suppressors
            "rhsusf_c_weapons",
            "rhs_c_weapons",
            "rhs_sounds",
            "hlcweapons_core",  // HLC_10mm_JHP
            "hlcweapons_mp5"  // 10mm mp5 smg (mag/weapon/suppressor
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
        caliber = 0.5;  //penetrate less, damage more
        dangerRadiusBulletClose = 1;
        dangerRadiusHit = 2;
        suppressionRadiusBulletClose = 1;
        suppressionRadiusHit = 2;
        audibleFire = 0.05;  // slightly more than 9mm pistol
        visibleFire = 0.001;
    };

    /* NIArms 10mm JHP bullet, increase hit to account for RHS */
    class HLC_9x19_Ball;
    class HLC_10mm_FMJ : HLC_9x19_Ball {
        hit = 14;
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
        audibleFire = 0.005;
        visibleFire = 0.001;
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

    /* 10mm mp5 - subsonic initspeed, no tracers */
    class 30Rnd_9x21_Mag;
    class hlc_30Rnd_10mm_B_MP5 : 30Rnd_9x21_Mag {
        initspeed = 320;
        lastroundstracer = 0;
        tracersevery = 0;
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

    /* AS Val has very loud AK-ish silenced sound tails, reconfigure it after
     * the vanilla PDW (nice re-chamber sound, non-dlc, no watermarking) */
    class rhs_weap_ak74m_Base_F;
    class rhs_weap_ak74m : rhs_weap_ak74m_Base_F {
        class Single;
        class FullAuto;
    };
    class rhs_weap_asval : rhs_weap_ak74m {
        magazines[] += {"SW_10rnd_SP5_SuperHeavy_Frag"};
        class Single : Single {
            class StandardSound {
                begin1[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_01",0.891251,1,400};
                begin2[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_02",0.891251,1,400};
                begin3[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_03",0.891251,1,400};
                soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin3",0.34};
                SoundSetShot[] = {"SMGVermin_silencerShot_SoundSet","SMGVermin_silencerTail_SoundSet","SMGVermin_silencerInteriorTail_SoundSet"};
                closure1[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\closure_Vermin_01",0.562341,1,10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\closure_Vermin_02",0.562341,1.1,10};
                soundClosure[] = {"closure1",0.5,"closure2",0.5};
            };
        };
        class FullAuto : FullAuto {
            class StandardSound {
                begin1[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_01",0.891251,1,400};
                begin2[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_02",0.891251,1,400};
                begin3[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\Silencer_Vermin_short_03",0.891251,1,400};
                soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin3",0.34};
                SoundSetShot[] = {"SMGVermin_silencerShot_SoundSet","SMGVermin_silencerTail_SoundSet","SMGVermin_silencerInteriorTail_SoundSet"};
                closure1[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\closure_Vermin_01",0.562341,1,10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\SMG\Vermin\closure_Vermin_02",0.562341,1.1,10};
                soundClosure[] = {"closure1",0.5,"closure2",0.5};
            };
        };
    };

    /* NIArms 10mm mp5 silencer */
    class hlc_muzzle_Agendasix : muzzle_snds_H {};  /* muzzle_snds_H above */
    class hlc_muzzle_Agendasix10mm : hlc_muzzle_Agendasix {
        class ItemInfo : ItemInfo {
            class AmmoCoef : AmmoCoef {
                /* as close as it gets, ~5m */
                audibleFire = 0.001;
                visibleFire = 0.001;
            };
        };
    };

    /* NIArms 10mm mp5 - super fast burst */
    class hlc_MP5_base;
    class hlc_smg_MP5N : hlc_MP5_base {
        class Burst;
    };
    class hlc_smg_mp510 : hlc_smg_MP5N {
        class Burst : Burst {
            reloadtime = "(20/800)";
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
