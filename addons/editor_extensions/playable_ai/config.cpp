class CfgPatches {
    class Editor_Extensions_playable_ai {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = { "Editor_Extensions_shared" };
    };
};

class CfgFunctions {
    class a3ee_playable_ai {
        class All {
            file = "\editor_extensions\playable_ai";
            class registerEH;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_playable_ai : a3ee_module_base {
        scope = 2;
        icon = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        displayName = "Keep Playable AI";
        class Attributes {
            class stop_ai {
                property = "a3ee_playable_stop_ai";
                control = "Checkbox";
                displayName = "Stop AI";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Order the AI to stop, hold fire, go prone and generally be passive to avoid exposing the players to danger instead of trying to play/follow along. Can be overruled by group leader using AI commands.";
            };
            class custom_code {
                property = "a3ee_playable_code";
                control = "EditCodeMulti3";
                displayName = "Code";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = """""";
                typeName = "STRING";
                tooltip = "Custom code to run (on server) on the AI unit when a player disconnects.";
            };
        };
        class EventHandlers : EventHandlers {
            class add_eh { init = "if (isServer) then { (_this select 0) call a3ee_playable_ai_fnc_registerEH }"; };
        };
    };
};
