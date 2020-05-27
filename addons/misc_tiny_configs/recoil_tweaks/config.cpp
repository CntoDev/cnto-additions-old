class CfgPatches {
    class Recoil_Tweaks {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "rhsusf_c_weapons",
            "rhs_c_weapons"
        };
    };
};

class CfgWeapons {
    class rhs_weap_saw_base;
    class rhs_weap_lmg_minimipara : rhs_weap_saw_base {  /* RHS M249 */
        recoil = "recoil_lim";
    };

    class rhs_weap_M249_base;
    class rhs_weap_m240_base : rhs_weap_M249_base {
        recoil = "recoil_mk200";
    };

    class rhs_pkp_base;
    class rhs_weap_pkp : rhs_pkp_base {
        recoil = "recoil_mk200";
    };
    class rhs_weap_pkm : rhs_weap_pkp {
        recoil = "recoil_mk200";
    };
};
