class CfgPatches {
    class Editor_Extensions {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgFunctions {
    class a3ee {
        class object_attrs {
            file = "\editor_extensions\functions\object_attrs";
            class intoSimpleObject;
        };
        class mission_attrs {
            file = "\editor_extensions\functions\mission_attrs";
        };
        class modules {
            file = "\editor_extensions\functions\modules";
            class createLoc;
            class hideTerrain;
        };
        class misc {
            file = "\editor_extensions\functions\misc";
            class modifyLoadout;
        };
    };
};

class Cfg3DEN {
#include "Cfg3DEN.h"
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
