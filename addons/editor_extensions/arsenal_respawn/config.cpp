class CfgPatches {
    class Editor_Extensions_arsenal_respawn {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_arsenal_respawn {
        class shared {
            file = "\editor_extensions\arsenal_respawn";
            class respawn { postInit = 1; };
        };
    };
};
