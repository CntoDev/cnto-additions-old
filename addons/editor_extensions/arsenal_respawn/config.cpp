class CfgPatches {
    class Editor_Extensions_arsenal_respawn {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_arsenal_respawn {
        class all {
            file = "\editor_extensions\arsenal_respawn";
            class setupRespawn;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_aresenal_respawn : a3ee_module_base {
        scope = 2;
        icon = "\a3\Modules_f\data\portraitRespawn_ca.paa";
        displayName = "Arsenal Respawn";
        class Attributes {
            class structured_hint {
                property = "a3ee_arsenal_respawn_structured_hint";
                control = "StructuredText1";
                description = "Hint: This module allows units with Arsenal loadouts respawn with those pre-defined loadouts.";
            };
        };
        class EventHandlers : EventHandlers {
            class setup_respawn { init = "if (isServer) then { (_this select 0) call a3ee_arsenal_respawn_fnc_setupRespawn }"; };
        };
    };
};
