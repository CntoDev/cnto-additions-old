class CfgPatches {
    class Chestpack {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_keybinding",
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
            class hookCBAKeybind { postInit = 1; };
            class oneKeyAutoSwap;
            class isDead;
            class setChestpack;
            class removeChestpack;
            class setBackpack;
            class removeBackpack;
        };
    };
};
