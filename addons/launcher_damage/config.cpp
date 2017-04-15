/*
 * launcher damage - correct over-the-shoulder launcher damage/penetration
 *                   from various mods
 */

class CfgPatches {
    class Launcher_Damage {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "tf47_at4",
            "rhsusf_c_weapons",
            "rhs_c_weapons"
        };
    };
};

class CfgMagazines {
    /*
     * make RHS launchers as powerful as TF47 AT4
     * (effective against older MBTs, not much against modern ones)
     */
    class CA_LauncherMagazine;
    class rhs_m136_mag : CA_LauncherMagazine {
        ammo = "tf47_at4_m_HEAT";
    };
    class rhs_m136_hedp_mag : rhs_m136_mag {
        ammo = "tf47_at4_m_HEDP";
    };
    class rhs_m136_hp_mag : rhs_m136_mag {
        ammo = "tf47_at4_m_HP";
    };

    //class rhs_m72a7_mag : rhs_m136_hedp_mag {
    //    ammo = "tf47_at4_m_HEDP";
    //};

    class FakeMagazine;
    class rhs_rpg26_mag : FakeMagazine {
        ammo = "tf47_at4_m_HEAT";
    };
    class rhs_rshg2_mag : rhs_rpg26_mag {
        ammo = "tf47_at4_m_HEDP";
    };
};

class CfgAmmo {
    /*
     * make TF47 High Penetration rounds (and any RHS weapons that use them)
     * more damaging, the default 1000 versus 900 HEAT is too small difference
     */
    class tf47_at4_m_HEAT;
    class tf47_at4_m_HP : tf47_at4_m_HEAT {
        hit = 1600;
        indirectHitRange = 0.1;  /* heavy non-explosive projectile */
    };
};
