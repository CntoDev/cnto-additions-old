class CfgPatches {
    class a3aa_door_keybind {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_keybinding",
            "cba_events",
            "cba_xeh"
        };
    };
};

class CfgFunctions {
    class a3aa_door_keybind {
        class all {
            file = "\a3aa\door_keybind";
            class init;
            class openCloseDoor;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_door_keybind {
        init = "[] call a3aa_door_keybind_fnc_init";
    };
};
