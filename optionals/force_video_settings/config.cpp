/*
 * force video settings - force 1.0 brightness and contrast, to limit cheating
 * when playing without NVGs
 */

class CfgPatches {
    class a3aa_force_video_settings {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgVideoOptions {
    class PPBrightness {
        minValue = 1;
        maxValue = 1;
    };
    class PPContrast {
        minValue = 1;
        maxValue = 1;
    };
};
