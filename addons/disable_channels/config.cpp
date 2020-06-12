/*
 * Disable unused chat channels for convenience
 */

class CfgPatches {
    class Disable_Channels {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_settings",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class Disable_Channels {
        class All {
            file = "\disable_channels";
            class init;
            class disable { postInit = 1; };
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Disable_Channels {
        init = "[] call Disable_Channels_fnc_init";
    };
};
