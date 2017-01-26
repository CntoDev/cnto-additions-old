class CfgPatches {
    class Insta_Zeus {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"cba_keybinding"};
    };
};

class CfgFunctions {
    class Insta_Zeus {
        /* instance dedicated to logged in / voted admin */
        class AdminCurator {
            file = "\insta_zeus\functions\admin_curator";
            class createGlobalCurator { postInit = 1; };
            class maintainCurator { postInit = 1; };
        };
        /* keybind-based arsenal functionality for the admin instance */
        class Arsenal {
            file = "\insta_zeus\functions\arsenal";
            class arsenal;
            class registerKeys { postInit = 1; };
        };
        /* misc keepers for all curators */
        class Runtime {
            file = "\insta_zeus\functions\runtime";
            class addPlayer { postInit = 1; };
            class onRespawn { postInit = 1; };
        };
        /* internal and external */
        class Api {
            file = "\insta_zeus\functions\api";
            class mkCurator;
        };
        //class Unused {
        //    class activateAddons { preInit = 1; };
        //};
    };
};

class CfgVehicles {
    class Logic;
    class Insta_Zeus_Dumb_Curator : Logic {
        scope = 1;
        /* creates a curator instance upon creating this Vehicle */
        simulation = "curator";
    };
};
