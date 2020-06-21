class CfgPatches {
    class a3aa_marker_enh {
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
    class a3aa_marker_enh {
        class all {
            file = "\a3aa\marker_enh";
            class init;
            class hookAnyMapDisplay;
            class setupEHs;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_marker_enh {
        init = "[] call a3aa_marker_enh_fnc_init";
    };
};
