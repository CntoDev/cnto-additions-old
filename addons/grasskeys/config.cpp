class CfgPatches {
    class GrassKeys {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_keybinding",
            "cba_settings",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class GrassKeys {
        class All {
            file = "\grasskeys";
            class init;
            class setTerrain;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class GrassKeys {
        init = "[] call GrassKeys_fnc_init";
    };
};
