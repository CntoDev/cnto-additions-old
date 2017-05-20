class CfgPatches {
    class Recoil_Tweaks {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "rhsusf_c_weapons",
            "rhs_c_weapons",
            "hlcweapons_m60e4",
            "hlcweapons_MG3s"
        };
    };
};

class CfgWeapons {
    class rhs_weap_M249_base;
    class rhs_weap_m240_base : rhs_weap_M249_base {
        recoil = "recoil_SAW";
    };

    class rhs_pkp_base;
    class rhs_weap_pkp : rhs_pkp_base {
        recoil = "recoil_mk200";
    };
    class rhs_weap_pkm : rhs_weap_pkp {
        recoil = "recoil_mk200";
    };

    class Rifle_Base_F;
    class hlc_M60e4_base : Rifle_Base_F {
        recoil = "recoil_SAW";
    };
    class hlc_MG42_base : Rifle_Base_F {
        recoil = "recoil_mk200";
    };
};
