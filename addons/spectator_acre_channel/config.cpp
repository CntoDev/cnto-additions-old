/*
 * ACRE2 "dead people" channel for Arma 3 Spectator
 */

class CfgPatches {
    class Spectator_ACRE_Channel {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class Spectator_ACRE_Channel {
        class All {
            file = "\spectator_acre_channel";
            class acreSpectator { postInit = 1; };
        };
    };
};
