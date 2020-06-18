/*
 * Prevent player rating from going below 0 to avoid additional engine-driven
 * effects like denying entry into "friendly" vehicles, etc.
 */

class CfgPatches {
    class a3aa_no_neg_rating {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_settings",
            "cba_events",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class a3aa_no_neg_rating {
        class all {
            file = "\a3aa\no_neg_rating";
            class init;
            class setupEH;  /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_no_neg_rating {
        init = "[] call a3aa_no_neg_rating_fnc_init";
    };
};
