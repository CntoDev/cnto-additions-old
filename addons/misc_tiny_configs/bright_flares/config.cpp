/*
 * bright flares - increase brightness/intensity of flares, so they
 * actually can illuminate something (even without NVGs!)
 * - taken from https://feedback.bistudio.com/T76756
 */

class CfgPatches {
    class Bright_Flares {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Weapons_F",
            "ace_grenades"     // overwrites flare intensity
        };
    };
};

class CfgAmmo {
    class FlareCore;
    class FlareBase;
    class Flare_82mm_AMOS_White : FlareCore {
        timeToLive = 80;
        intensity  = 500000;
        size = 0.1;
    };
    class F_40mm_White : FlareBase {
        intensity  = 500000;
        size = 0.1;
    };
    class F_20mm_White : FlareBase {
        intensity  = 500000;
        size = 0.1;
    };
    class F_Signal_Green : FlareBase {
        intensity  = 500000;
        size = 0.1;
    };
};
