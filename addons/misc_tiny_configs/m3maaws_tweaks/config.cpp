/*
 * m3maaws tweaks - misc useful stuff for TF47 Carl Gustav launcher
 */

class CfgPatches {
    class M3MAAWS_Tweaks {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "rhs_c_weapons",
            "tf47_m3maaws"
        };
    };
};

class CfgAmmo {
    /*
     * more effective HE CG rounds
     */
    class RocketBase;
    class tf47_m3maaws_HE : RocketBase {
        indirectHitRange = 20;
        ace_frag_enabled = 1;
        ace_frag_classes[] = {"large","large","large_HD","large","huge","huge_HD","huge"};
        ace_frag_metal = 36000;
        ace_frag_charge = 9979;
        ace_frag_gurney_c = 2440;
        ace_frag_gurney_k = 3/5;
    };
    class tf47_m3maaws_HE_50 : RocketBase {
        indirectHitRange = 20;
        ace_frag_enabled = 1;
        ace_frag_classes[] = {"large","large","large_HD","large","huge","huge_HD","huge"};
        ace_frag_metal = 36000;
        ace_frag_charge = 9979;
        ace_frag_gurney_c = 2440;
        ace_frag_gurney_k = 3/5;
    };
};

class CfgCloudlets {
    /*
     * cool and useful instant smoke CG blast
     */
    class Default;
    class m3maawsfakeparticle : Default {
        beforeDestroyScript = "\misc_tiny_configs\m3maaws_tweaks\smokecone.sqf";
    };
    /* fast smoke stays longer */
    class RHS_GDM40TrailEffect;
    class RHS_GDM40TrailEffectLong : RHS_GDM40TrailEffect {
        lifeTime = 60;
    };
};
