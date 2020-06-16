/*
 * reduce sound in vehicles to make direct speech communication viable
 */
class CfgPatches {
    class Map_Trackers {
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
    class Map_Trackers {
        class All {
            file = "\map_trackers";
            class init;
            //class groupUpdater;  /* scheduled by init */
            class unitUpdater;   /* scheduled by init */
            class setupDrawEH;   /* scheduled by init */
            class guessUnitIcon;
            class getUnitTeamColor;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Map_Trackers {
        init = "[] call Map_Trackers_fnc_init";
    };
};
