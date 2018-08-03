/*
 * various Arma 3 Spectator related tweaks and configuration
 */

class CfgPatches {
    class Spectator_Tweaks {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class Spectator_Tweaks {
        class All {
            file = "\spectator_tweaks";
            class acreSpectator { postInit = 1; };
        };
    };
};
