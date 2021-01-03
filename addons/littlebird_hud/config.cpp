class CfgPatches {
    class a3aa_littlebird_hud {
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
    class a3aa_littlebird_hud {
        class all {
            file = "\a3aa\littlebird_hud";
            class init;
            class hud;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_littlebird_hud {
        init = "[] call a3aa_littlebird_hud_fnc_init";
    };
};