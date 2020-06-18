class CfgPatches {
    class a3aa_infopanel_control {
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
    class a3aa_infopanel_control {
        class all {
            file = "\a3aa\infopanel_control";
            class initSettings;
            class applySettings;  /* scheduled by initSettings */
            class disablePanels;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_infopanel_control {
        init = "[] call a3aa_infopanel_control_fnc_initSettings";
    };
};
