class CfgPatches {
    class Editor_Extensions_modules {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_modules {
        class All {
            file = "\editor_extensions\modules\functions";
            class createLoc;
            class sendBriefing;
            class teleportOnJIP;
            class moveRespawn;
            class attachSynced;
            class killOnJIP;
            class postProcess;
        };
    };
};

class CfgVehicles {
#include "modules.h"
};
