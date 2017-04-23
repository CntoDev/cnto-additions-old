/*
 * various misc small tunables should be here, things that mods should
 * have exported via editor modules, but for one reason or another, haven't
 * - this mostly includes setting global variables or calling config functions
 *
 * note that these settings will be applied TO ALL MISSIONS, incl. 3rd party
 * missions made using custom mission frameworks, so ONLY set very generic
 * mod settings that fit our "serious gameplay" style and cannot possibly break
 * other 3rd party missions
 *
 * for everything else, use editor modules / Logic init lines in another addon
 */

class CfgPatches {
    class Mod_Configuration {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class Mod_Configuration {
        class All {
            file = "\mod_configuration";
            class acre { postInit = 1; };
            class ignoreFriendlyFire { postInit = 1; };
            class respawnMarkInvisible { postInit = 1; };
        };
    };
};
