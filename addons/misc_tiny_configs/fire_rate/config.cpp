/*
 * fire rate - add non-standard fire rates to weapons (ie. slow fire to MGs)
 */

class CfgPatches {
    class Fire_Rate {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhsusf_c_weapons"  // rhs_weap_lmg_minimipara
        };
    };
};

class CfgWeapons {
    /*
     * give M249 variants a slower fire rate option for suppression
     */
    class rhs_weap_lmg_minimipara;
    class rhs_weap_lmg_minimi_railed : rhs_weap_lmg_minimipara {
        class FullAuto;
    };
    class rhs_weap_m249_pip_S : rhs_weap_lmg_minimi_railed {
        modes[] = {"FullAuto","SlowAuto","close","short","medium","far_optic1","far_optic2"};
        class FullAuto : FullAuto {
            textureType = "fastAuto";
            //reloadTime = 0.075;
        };
        class SlowAuto : FullAuto {
            textureType = "fullAuto";
            reloadTime = 0.15;  /* 2x slower than FullAuto */
        };
    };
};
