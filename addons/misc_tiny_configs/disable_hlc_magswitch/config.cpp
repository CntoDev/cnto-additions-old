/*
 * HLC / Niarms on Arma3 v1.82 breaks ACE3 self-interact when the player(s)
 * start in a vehicle / plane
 *
 * since it's a fairly obscure nice-to-have functionality, disable it
 */

class CfgPatches {
    class Disable_HLC_Magswitch {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "hlcweapons_core"
        };
    };
};

class CfgFunctions {
    class Niarms {
        class Misc {
            class magSwitch {
                file = "\misc_tiny_configs\disable_hlc_magswitch\dummy.sqf";
            };
            class magInit {
                file = "\misc_tiny_configs\disable_hlc_magswitch\dummy.sqf";
            };
        };
    };
};
