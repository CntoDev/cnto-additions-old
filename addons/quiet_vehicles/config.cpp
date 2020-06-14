/*
 * reduce sound in vehicles to make direct speech communication viable
 */
class CfgPatches {
    class Quiet_Vehicles {
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
    class Quiet_Vehicles {
        class All {
            file = "\quiet_vehicles";
            class init;
            class registerEHs;  /* scheduled by init */
            class adjustSoundVolume;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Quiet_Vehicles {
        init = "[] call Quiet_Vehicles_fnc_init";
    };
};
