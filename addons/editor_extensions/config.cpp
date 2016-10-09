class CfgPatches {
    class Editor_Extensions {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"3den"};
    };
};

class CfgFunctions {
    class a3ee {
        class object_attrs {
            file = "\editor_extensions\functions\object_attrs";
            class oa_simpleObject;
        };
        class mission_attrs {
            file = "\editor_extensions\functions\mission_attrs";
        };
        class modules {
            file = "\editor_extensions\functions\modules";
            class m_createLoc;
            class m_hideTerrain;
            class m_sendBriefing;
            class m_executeCode;
            class m_instaOSD;
            class m_arsenal;
            class m_teleportOnJIP;
            class m_moveRespawn;
        };
        class misc {
            file = "\editor_extensions\functions\misc";
            class modifyLoadout;
            class nearLocText;
            class typeText;
            class instaOSD;
            class arsenalRespawn { postInit = 1; };
            class checkApex;
        };
    };
};

class Cfg3DEN {
#include "Cfg3DEN.h"
};

class ctrlMenuStrip;
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += {"A3EE_Check_Apex"};
                };
                class A3EE_Check_Apex {
                    text = "Check for Apex objects";
                    action = "collect3DENHistory { [] call a3ee_fnc_checkApex }";
                };
            };
        };
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class A3EE : NO_CATEGORY {
        displayName = "A3EE";
    };
};

class CfgVehicles {
#include "modules.h"
};
