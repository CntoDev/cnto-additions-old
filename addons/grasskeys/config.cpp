class CfgPatches {
    class GrassKeys {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"cba_keybinding"};
    };
};

class CfgFunctions {
    class GrassKeys {
        class All {
            file = "\grasskeys";
            class init { postInit = 1; };
            class setTerrain;
        };
    };
};
