/*
 * Prevent player rating from going below 0 to avoid additional engine-driven
 * effects like denying entry into "friendly" vehicles, etc.
 */

class CfgPatches {
    class Prevent_Negative_Rating {
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
    class Prevent_Negative_Rating {
        class All {
            file = "\prevent_negative_rating";
            class init;
            class setupEH;  /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Prevent_Negative_Rating {
        init = "[] call Prevent_Negative_Rating_fnc_init";
    };
};
