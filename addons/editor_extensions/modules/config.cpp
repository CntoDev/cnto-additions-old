class CfgPatches {
    class Editor_Extensions_modules {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee {
        class modules {
            file = "\editor_extensions\modules\functions";
            class m_createLoc;
            class m_hideTerrain;
            class m_sendBriefing;
            class m_arsenal;
            class m_teleportOnJIP;
            class m_moveRespawn;
            class m_attachSynced;
            class m_killOnJIP;
            class m_postProcess;
        };
    };
};

class CfgVehicles {
#include "modules.h"
};
