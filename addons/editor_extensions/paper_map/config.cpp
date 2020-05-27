class CfgPatches {
    class Editor_Extensions_paper_map {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = { "Editor_Extensions_shared" };
    };
};

class CfgFunctions {
    class a3ee_paper_map {
        class All {
            file = "\editor_extensions\paper_map";
            class init;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_paper_map : a3ee_module_base {
        scope = 2;
        icon = "\A3\modules_f\data\portraitStrategicMapInit_ca.paa";
        displayName = "Paper map";
        class Attributes {
            class markrange {
                property = "a3ee_markrange";
                control = "EditShort";
                displayName = "Marker sharing range";
                expression = "_this setVariable [""%s"",_value]";
                typeName = "NUMBER";
                defaultValue = "20";
                tooltip = "Maximum range in meters across which markers can be shared.";
            };
            class nodelete {
                property = "a3ee_nodelete";
                control = "Checkbox";
                displayName = "Prevent marker deletion";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "false";
                tooltip = "Disable the ""delete"" key on the map, simulating a true paper map. You might also want to disable ACE map marker moving (ace_markers_moveRestriction).";
            };
        };
        class EventHandlers : EventHandlers {
            class init_paper_map { init = "if (isServer) then { (_this select 0) call a3ee_paper_map_fnc_init }"; };
        };
    };
};
