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
    class Flare_82mm_AMOS_White: FlareCore {
        timeToLive = 80;
        brightness = 200;
        intensity  = 500000;
    };
    class F_40mm_White: FlareBase {
        brightness = 120;
        intensity  = 500000;
    };
    class F_20mm_White: FlareBase {
        brightness = 80;
        intensity  = 500000;
    };
    class F_Signal_Green: FlareBase {
        brightness = 80;
        intensity  = 500000;
    };
};
