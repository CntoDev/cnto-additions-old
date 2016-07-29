class CfgPatches {
    class Insta_Zeus {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"cba_keybinding"};
    };
};

class CfgFunctions {
    class Insta_Zeus {
        class All {
            file = "\insta_zeus";
            class mkCurator;
            class createGlobalCurator { postInit = 1; };
            class maintainCurator { postInit = 1; };
            class onRespawn { postInit = 1; };
            class registerKeys { postInit = 1; };  /* for arsenal */
            class arsenal;
            //class activateAddons { preInit = 1; };
        };
    };
};

class CfgVehicles {
    class Logic;
    class Insta_Zeus_Dumb_Curator : Logic {
        scope = 1;
        simulation = "curator";
    };
};
