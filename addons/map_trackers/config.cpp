/*
 * reduce sound in vehicles to make direct speech communication viable
 */
class CfgPatches {
    class a3aa_map_trackers {
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
    class a3aa_map_trackers {
        class all {
            file = "\a3aa\map_trackers";
            class init;
            class hookAnyMapDisplay;  /* scheduled by init */
            class setupDrawEH;
            class groupUpdater;       /* scheduled by init */
            class getGroupIcon;
            class unitUpdater;        /* scheduled by init */
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_map_trackers {
        init = "[] call a3aa_map_trackers_fnc_init";
    };
};
