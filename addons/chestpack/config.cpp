class CfgPatches {
    class Chestpack {
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
    class Chestpack {
        class All {
            file = "\chestpack";
            /* preInit because of newControllableObject */
            class hookACEInteract { preInit = 1; };
            class hookCBAKeybind;
            class oneKeyAutoSwap;
            class isDead;
            class setChestpack;
            class removeChestpack;
            class setBackpack;
            class removeBackpack;
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Chestpack {
        init = "[] call Chestpack_fnc_hookCBAKeybind";
    };
};
