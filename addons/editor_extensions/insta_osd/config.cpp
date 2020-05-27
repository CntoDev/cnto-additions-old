class CfgPatches {
    class Editor_Extensions_insta_osd {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_insta_osd {
        class all {
            file = "\editor_extensions\insta_osd";
            class nearLocText;
            class moduleOSD;
        };
    };
    /*
     * shared (external) API
     */
    class a3ee {
        class insta_osd {
            file = "\editor_extensions\insta_osd";
            class typeText;
            class instaOSD;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_insta_osd : a3ee_module_base {
        scope = 2;
        icon = "\A3\modules_f\data\portraitStrategicMapMission_ca.paa";
        displayName = "Insta OSD Location Info";
        class Attributes {
            class header {
                property = "a3ee_header";
                control = "Edit";
                displayName = "Custom header";
                expression = "_this setVariable [""%s"",_value]";
                typeName = "STRING";
                defaultValue = """""";
                tooltip = "Displayed in bold above the location info. If unset, no header is displayed.\n\nGood for ie. mission name.";
            };
            class tojip {
                property = "a3ee_tojip";
                control = "Checkbox";
                displayName = "Show to JIP players";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "false";
            };
        };
        class EventHandlers : EventHandlers {
            class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_insta_osd_fnc_moduleOSD }"; };
        };
    };
};
