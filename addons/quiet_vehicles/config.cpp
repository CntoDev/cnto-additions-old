class CfgPatches {
    class a3aa_quiet_vehicles {
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
    class a3aa_quiet_vehicles {
        class all {
            file = "\a3aa\quiet_vehicles";
            class init;
            class registerEHs;  /* scheduled by init */
            class adjustSoundVolume;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_quiet_vehicles {
        init = "[] call a3aa_quiet_vehicles_fnc_init";
    };
};
