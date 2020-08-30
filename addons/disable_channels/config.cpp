class CfgPatches {
    class a3aa_disable_channels {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_settings",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class a3aa_disable_channels {
        class all {
            file = "\a3aa\disable_channels";
            class init;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_disable_channels {
        init = "[] call a3aa_disable_channels_fnc_init";
    };
};
