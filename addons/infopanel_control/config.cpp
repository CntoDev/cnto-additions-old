class CfgPatches {
    class InfoPanel_Control {
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
    class InfoPanel_Control {
        class All {
            file = "\infopanel_control";
            class initSettings;
            class applySettings;  /* scheduled by initSettings */
            class disablePanels;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class InfoPanel_Control {
        init = "[] call InfoPanel_Control_fnc_initSettings";
    };
};
