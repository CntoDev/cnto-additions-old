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

    /*
     * stronger flares, live longer
     */
    class F_40mm_White;
    class m3maaws_tweaks_nightsun : F_40mm_White {
        intensity = 2500000;
        timeToLive = 180;
        size = 0.1;
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

    /*
     * custom circle of flares
     */
    class m3maawsfakeparticleIllum : m3maawsfakeparticle {
        beforeDestroyScript = "\misc_tiny_configs\m3maaws_tweaks\flarecone.sqf";
    };
};

class CfgMagazines {
    /*
     * lighter illum mag, half of smoke
     */
    class CA_LauncherMagazine;
    class tf47_m3maaws_ILLUM : CA_LauncherMagazine {
        mass = 34.18;
    };
};
